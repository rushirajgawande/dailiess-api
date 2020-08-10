<?php
defined('BASEPATH') or exit('No direct script access allowed');
class CoreBusiness extends MY_Controller
{
	var $RESULT, $refid, $value;
	function __construct()
	{
		parent::__construct();
	}
	// For Home
	function get_biz_list()
	{
		$res = $this
		->db
		->get_where('clientBizDetails', array(
			'bizOwnerId' => $this->bizOwnerId,
			'status' => 'ACTIVE'
		));
		$this->RESULT['status'] = '1';
		$this->RESULT['data'] = $res->result();
		return $this
		->output
		->set_status_header(200)
		->set_output(json_encode($this->RESULT));
	}
}
