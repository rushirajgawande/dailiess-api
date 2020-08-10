<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payments extends MY_Controller{
	var $RESULT,$refid,$value;
	function __construct()
	{
		parent::__construct();
		// $this->RESULT["status"]  = "0";
		// if (
		// 	isset($_POST['authToken'])
		// 	&& strlen($_POST['authToken']) > 20
		// 	&& $this->Model_securityTokens->verifyAuth($_POST['authToken'])
		// ) {
		// 	$this->refid = $this->Model_securityTokens->verifyAuth($_POST['authToken']);
		// } else {
		// 	$this->RESULT["message"] = "Request not authorised!";
		// 	exit(
		// 		json_encode($this->RESULT)
		// 	);
		// }
		// $this->RESULT["message"] = "Script Run Unsuccesfull";
	}
	function offline_payment_add()
	{
		if (
			$this->input->post('orderid',TRUE)
			&& $this->input->post('amount',TRUE)
		) {
			$this->db->insert(
				'orderTxn',
				array(
					'orderid' => $_POST['orderid'],
					'amount' => $_POST['amount'],
					'refid' => $this->refid,
					'refname' =>$this->refname,
					'from_ip' => $this->input->ip_address()
				)
			);
			$this->RESULT["status"]  = "1";
			$this->RESULT["message"] = "Offline Payment added add!";
		}else {
			$this->RESULT["message"] = "Missing param";
		}
		return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
	}

}
