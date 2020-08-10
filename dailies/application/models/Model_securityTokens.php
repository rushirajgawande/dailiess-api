<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
*
*/
class Model_securityTokens extends CI_Model{
  function __construct(){
    parent::__construct();
  }
  function createAuthToken(
	  $userid,
	  $refname,
	  $lat,
	  $lng
  ){
    $authToken = password_hash(
      $userid,
      PASSWORD_DEFAULT
    );
    if (
      $this->db->delete(
        'authTokens',
	        array(
	          'refid' => $userid,
				 'refname' => $refname,
			  	 'lat' => $lat,
			  	 'lng' => $lng
	        )
        )
        && $this->db->insert(
          'authTokens',
          array(
            'authToken' => $authToken,
            'refid' => $userid,
            'refname' => $this->input->post('refname'),
            'lat' => $this->input->post('lat'),
            'lng' => $this->input->post('lng')
          )
          )
        ) {
          return $authToken;
        }
        return rand(1000,9999);
      }
      function verifyAuth($authToken){
        $results = $this->db->get_where(
          'authTokens',
          array(
            'authToken' => $authToken
          )
        );
        if (
          $results->num_rows() > 0
        ) {
          return true;
        }
        return false;
      }
      function add_failed_attemp(
        $email, $mobile, $action
      ){
        return $this->db->insert(
          'ip_hits_failed',
          array(
            'ip_address' => $this->input->ip_address(),
            'email' => $email,
            'mobile' => $mobile,
            'action' => $action
          )
        );
      }
    }
