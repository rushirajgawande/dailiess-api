<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
   var $RESULT;
   var $bizOwnerId;
   var $refid;
   var $refname;
   function __construct()
   {
      parent::__construct();
      // Init default values
      $this->RESULT["status"] = "0";
      $this->RESULT["message"] = "Script Run Unsuccesfull";
      // Check params for dev mode
      $this->RESULT["post_data"] = $_POST;
      // Check Lat Lng Params
      if (
         (
            $this->input->post('lat', TRUE)
            && strlen($this->input->post('lat')) > 0
            && $this->input->post('lng', TRUE)
            && strlen($this->input->post('lng')) > 0
            ) !== TRUE
         ) {
            $this->RESULT["message"] = "Lat Long Missing";
            $_POST['log_this_action'] = $this->RESULT["message"];
            $this->Model_coreOperations->log_failed_ip_attemnts();
            exit(json_encode($this->RESULT));
         }
         // Class Wise Checks
         switch ( $this->router->fetch_class() ) {
            case 'SignIn':
            break;
            case 'CoreBusiness':
            $this->validate_user_actions();
            break;
            case 'Business':
            $this->validate_user_actions();
            if ( (isset($_POST['bizid']) && strlen($_POST['bizid']) > 0) !== TRUE ) {
               $this->RESULT["message"] = "Biz Id Missing";
               $_POST['log_this_action'] = $this->RESULT["message"];
               $this->Model_coreOperations->log_failed_ip_attemnts();
               exit(json_encode($this->RESULT));
            }
            break;
            case 'Customer_Signin':
            break;
            default:
            $this->validate_user_actions();
            break;
         }
      }
      function validate_user_actions(){
         // Get bizOwnerId from authToken
         $results_authToken = $this->db->get_where(
            'authTokens',
            array(
               'authToken' => $_POST['authToken']
            )
         );
         if ( $results_authToken->num_rows() > 0 ) {
            $this->bizOwnerId = $results_authToken->row()->refid;
            $this->refid = $results_authToken->row()->refid;
            $this->refname = $results_authToken->row()->refname;
         } else {
            $this->RESULT["message"] = "Request not authorised2!";
            exit(json_encode($this->RESULT));
         }
         $this->db->insert(
            'action_logger',
            array(
               'fname' => ( isset($_POST['fname']) ? $_POST['fname'] : 'NA' ),
               'lname' => ( isset($_POST['lname']) ? $_POST['lname'] : 'NA' ),
               'email' => ( isset($_POST['email']) ? $_POST['email'] : 'NA' ),
               'mobile' => ( isset($_POST['mobile']) ? $_POST['mobile'] : 'NA' ),
               'refid' => $this->refid,
               'refname' => $this->refname,
               'from_ip' => $this->input->ip_address(),
               'className' => $this->router->fetch_class(),
               'methodName' => $this->router->fetch_method(),
               'action' => 'NA',
               'route' => $this->uri->segment('1')
            )
         );
      }
   }
