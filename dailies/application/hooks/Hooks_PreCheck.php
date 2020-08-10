<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Hooks_PreCheck{
  var $RESULT;
  var $host;
  var $schema;
  var $user;
  var $password;
  function __construct(){
    switch (ENVIRONMENT) {
      case 'production':
      $this->host = 'localhost';
      $this->schema = '';
      $this->user = '';
      $this->password = '';
      break;
      case 'development':
      $this->host = 'localhost';
      $this->schema = 'dailiess';
      $this->user = 'dailies_dev_db_user';
      $this->password = 'ZILr5sa!f';
      break;
      default:
      exit("Incorrect env");
      break;
    }
  }
  function pre_Security_checks(){
    // Step 1: Add Default Header Option
    header("content-type:application/json");

    // Step 2: Validate POST Request
    if ( $_SERVER['REQUEST_METHOD'] !== 'POST') {
      $this->RESULT["status"] = "Failed";
      $this->RESULT["message"] = "Request not allowed!";
		$this->insert_failed_attempts($this->get_client_ip());
      exit(json_encode($this->RESULT));
    }

    // Step 3: Check for Invalid Attempts
    if ( $this->verify_ip_failed_attempts() ) {
      $this->RESULT["ip"] = $this->get_client_ip();
      $this->RESULT["timestamp"] = date("d-m-y h:i:s A");
      $this->RESULT["address"] = $this->ip_info( $this->get_client_ip(), "address");
      $this->RESULT["location"] = $this->ip_info( $this->get_client_ip(), "location");
      $this->RESULT["city"] = $this->ip_info( $this->get_client_ip(), "city");
      $this->RESULT["region"] = $this->ip_info( $this->get_client_ip(), "region");
      $this->RESULT["state"] = $this->ip_info( $this->get_client_ip(), "state");
      $this->RESULT["countrycode"] = $this->ip_info( $this->get_client_ip(), "countrycode");
      $this->RESULT["country"] = $this->ip_info( $this->get_client_ip(), "country");
      $this->RESULT["message"] = "IP BLOCKED!";
      exit(json_encode($this->RESULT));
      // code...
    }
  }

  function verify_ip_failed_attempts(){
    $conn = new mysqli(
      $this->host,
      $this->user,
      $this->password,
      $this->schema
    );
    $stmt = $conn->prepare(
      'SELECT
      id, ip_address, email, mobile, addedon, action
      FROM
      ip_hits_failed
      WHERE
      addedon >= NOW() - INTERVAL 10 MINUTE AND ip_address = ?'
    );
    // We have blocked access till 10 minutes of 5 attempts, so aftter 10 minutes we can access
    $ip_address = $this->get_client_ip();
    $stmt->bind_param(
      "s",
      $ip_address
    );
    if ( $stmt->execute()) {
      $stmt->store_result();
      if (
        $stmt->num_rows > 5
      ) {
        return true;
      }
    }
    return false;
  }
  function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
    $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
    $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
    $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
    $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
    $ipaddress = getenv('REMOTE_ADDR');
    else
    $ipaddress = 'UNKNOWN';
    return $ipaddress;
  }
  function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE) {
    $output = NULL;
    if (filter_var($ip, FILTER_VALIDATE_IP) === FALSE) {
      $ip = $_SERVER["REMOTE_ADDR"];
      if ($deep_detect) {
        if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP))
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP))
        $ip = $_SERVER['HTTP_CLIENT_IP'];
      }
    }
    $purpose    = str_replace(array("name", "\n", "\t", " ", "-", "_"), NULL, strtolower(trim($purpose)));
    $support    = array("country", "countrycode", "state", "region", "city", "location", "address");
    $continents = array(
      "AF" => "Africa",
      "AN" => "Antarctica",
      "AS" => "Asia",
      "EU" => "Europe",
      "OC" => "Australia (Oceania)",
      "NA" => "North America",
      "SA" => "South America"
    );
    if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
      $ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
      if (@strlen(trim($ipdat->geoplugin_countryCode)) == 2) {
        switch ($purpose) {
          case "location":
          $output = array(
            "city"           => @$ipdat->geoplugin_city,
            "state"          => @$ipdat->geoplugin_regionName,
            "country"        => @$ipdat->geoplugin_countryName,
            "country_code"   => @$ipdat->geoplugin_countryCode,
            "continent"      => @$continents[strtoupper($ipdat->geoplugin_continentCode)],
            "continent_code" => @$ipdat->geoplugin_continentCode
          );
          break;
          case "address":
          $address = array($ipdat->geoplugin_countryName);
          if (@strlen($ipdat->geoplugin_regionName) >= 1)
          $address[] = $ipdat->geoplugin_regionName;
          if (@strlen($ipdat->geoplugin_city) >= 1)
          $address[] = $ipdat->geoplugin_city;
          $output = implode(", ", array_reverse($address));
          break;
          case "city":
          $output = @$ipdat->geoplugin_city;
          break;
          case "state":
          $output = @$ipdat->geoplugin_regionName;
          break;
          case "region":
          $output = @$ipdat->geoplugin_regionName;
          break;
          case "country":
          $output = @$ipdat->geoplugin_countryName;
          break;
          case "countrycode":
          $output = @$ipdat->geoplugin_countryCode;
          break;
        }
      }
    }
    return $output;
  }
  function insert_failed_attempts($ip_address){
	  $conn = new mysqli(
		 $this->host,
		 $this->user,
		 $this->password,
		 $this->schema
	  );
	  $stmt = $conn->prepare(
		  'INSERT INTO ip_hits_failed (ip_address) VALUES (?)'
	  );
	  $stmt->bind_param( "s", $ip_address);
	  if (
		$stmt->execute()
	  ) {
		  $stmt->close();
		  $conn->close();
		  return true;
	  }
	  $stmt->close();
	  $conn->close();
	  return false;
  }
}
?>
