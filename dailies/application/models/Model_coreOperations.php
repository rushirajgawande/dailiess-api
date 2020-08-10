<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 */
class Model_coreOperations extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function log_failed_ip_attemnts(){
		$this->db->insert(
			'ip_hits_failed',
			array(
				'ip_address' =>$this->input->ip_address(),
				'email' =>(isset($_POST['email']) ? $_POST['email'] : "NA"),
				'mobile' =>(isset($_POST['mobile']) ? $_POST['mobile'] : "NA"),
				'action' =>(isset($_POST['log_this_action']) ? $_POST['log_this_action'] : "NA")
			)
		);
	}
}
