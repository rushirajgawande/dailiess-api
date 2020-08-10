<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Users extends CI_Controller
{
  var $RESULT,$refid,$value;
  function __construct()
  {
    parent::__construct();
    $this->RESULT["status"]  = "0";
    if (
      isset($_POST['authToken'])
      && strlen($_POST['authToken']) > 20
      && $this->Model_securityTokens->verifyAuth($_POST['authToken'])
    ) {
      $this->refid = $this->Model_securityTokens->verifyAuth($_POST['authToken']);
    } else {
      $this->RESULT["message"] = "Request not authorised!";
      exit(
        json_encode($this->RESULT)
      );
    }
    $this->RESULT["message"] = "Script Run Unsuccesfull";
  }
  function api_update_user_roles()
  {
    $this->db->trans_start();
    if (
      $this->input->post('bizid',TRUE)
      && $this->input->post('bizUserId',TRUE)
      && $this->input->post('refid',TRUE)
      && $this->input->post('refname',TRUE)
      && $this->db->delete(
        'clientBizUsersRoles',
        array(
          'bizid' => $_POST['bizid'],
          'bizUserId' => $_POST['bizUserId']
        )
        )
      ) {
        $roles_array = explode( ",", $_POST['roles']);
        for ($i=0; $i < sizeof($roles_array); $i++) {
          $this->db->insert(
            'clientBizUsersRoles',
            array(
              'action' => $roles_array[$i],
              'refid' => $_POST['refid'],
              'refname' => $_POST['refname'],
              'from_ip' => $this->input->ip_address(),
              'bizid' => $_POST['bizid'],
              'bizUserId' => $_POST['bizUserId']
            )
          );
        }
        $this->RESULT["status"] = sizeof($roles_array) > 0 ? "1" : '0';
        $this->RESULT["message"] = "User role updated Succesfully";
        $this->db->trans_commit();
      }
      return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
    }
    function api_get_all_user_roles()
    {
      $results = $this->db->get(
        'clientBizUsersRoles'
      );
      if (
        $results->num_rows() > 0
      ) {
        $this->RESULT["status"]  = "1";
        $this->RESULT["message"] = "Business Staff added Succesfully";
        $this->RESULT["client_roles"] = $results->result();
      }else{
        $this->RESULT["message"] = "Failed";
      }
      return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
    }
    function api_delete_curr_user_role()
    {
      if (
        $this->input->post('roleid',TRUE)
        && $this->input->post('bizUserId',TRUE)
      ) {
        $results = $this->db->get_where(
          'clientBizUsersRoles',
          array(
            'roleid' => $_POST['roleid'],
            'bizUserId' => $_POST['bizUserId']
          )
        );
        if (
          $results->num_rows() > 0
        ) {
          $this->db->where(
            array(
              'roleid' => $this->input->post('roleid'),
              'bizUserId' => $this->input->post('bizUserId')
            )
            )->delete(
              'clientBizUsersRoles'
            );
            $this->RESULT["status"]  = "1";
            $this->RESULT["message"] = "Deleted Succesfully";
          }else {
            $this->RESULT["message"] = "data doesnt exist";
          }
        }else {
          $this->RESULT["message"] = "Failed check params";
        }
        return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
      }
    }
