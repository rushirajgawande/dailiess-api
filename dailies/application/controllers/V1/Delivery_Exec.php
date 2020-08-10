<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once ("application/core/MY_ControllerDelExec.php");
class Delivery_Exec extends MY_ControllerDelExec
{
	var $RESULT, $refid, $value;
	public function __construct()
	{
		parent::__construct();
		$this->RESULT["status"] = "0";
		$this->RESULT["message"] = "Script Run Unsuccesfull";
	}
	function update_deliv_exec()
	{
		if ($this
		->input
		->post('fname') && $this
		->input
		->post('lname') && $this
		->input
		->post('email') && $this
		->input
		->post('execid') && $this
		->input
		->post('mobile'))
		{
			if ($this
			->db
			->where('execid', $this->refid)
			->where('mobile', $_POST['mobile'])->update('deliveryExecutives', array(
				'fname' => $_POST['fname'],
				'lname' => $_POST['lname'],
				'email' => $_POST['email'],
				'refid' => $this->refid,
				'refname' => $_POST['refname'],
				'from_ip' => $this
				->input
				->ip_address()
			)))
			{
				$this->RESULT["status"] = "1";
				$this->RESULT["message"] = "Delivery Executive details updated";
			}
			else
			{
				$this->RESULT["message"] = "Failed to update";
			}
		}
		else
		{
			$this->RESULT["message"] = "falied check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_add_aadharcard()
	{
		if (file_exists($_FILES['aadhar_front_img']['tmp_name']) && file_exists($_FILES['aadhar_back_img']['tmp_name']))
		{
			if ($this
			->input
			->post('aadhar_num')
			// && strlen($this->input->post('aadhar_num')) == 12
			// && $this->input->post('execid')
			&& $this
			->input
			->post('mobile'))
			{
				$newFileName1 = 'IMG' . date("dmyhis") . '.' . pathinfo($_FILES['aadhar_front_img']['name'], PATHINFO_EXTENSION);
				$newFileName1_url = base_url() . 'images/' . $newFileName1;
				$config['upload_path'] = './images/';
				$config['file_name'] = $newFileName1;
				$newFileName2 = 'IMG' . date("dmyhis") . '.' . pathinfo($_FILES['aadhar_back_img']['name'], PATHINFO_EXTENSION);
				$newFileName2_url = base_url() . 'images/' . $newFileName2;
				$config['upload_path'] = './images/';
				$config['file_name'] = $newFileName2;
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$this
				->load
				->library('upload', $config);
				if (!$this
				->upload
				->do_upload('aadhar_front_img') && !$this
				->upload
				->do_upload('aadhar_back_img'))
				{
					$this->RESULT["error"] = array(
						'error' => $this
						->upload
						->display_errors()
					);
				}
				else
				{
					$this
					->db
					->where('execid', $this->refid)
					->where('mobile', $_POST['mobile'])->update('deliveryExecutives', array(
						'aadhar_num' => $_POST['aadhar_num'],
						'aadhar_front_img' => $newFileName1_url,
						'aadhar_back_img' => $newFileName2_url
					));
					$this->RESULT["status"] = "1";
					// $this->RESULT["sql"] = $this->db->last_query();
					$this->RESULT["message"] = "Script run Succesfull aadharcard uploaded";
					$this->RESULT["data"] = $this
					->upload
					->data();
				}
			}
			else
			{
				$this->RESULT["message"] = "Check param file";
			}
		}
		else
		{
			$this->RESULT["message"] = "Check params";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_add_pancard()
	{
		if (file_exists($_FILES['pan_front_img']['tmp_name']))
		{
			if ($this
			->input
			->post('pan_num'))
			{
				$newFileName = 'IMG' . date("dmyhis") . '.' . pathinfo($_FILES['pan_front_img']['name'], PATHINFO_EXTENSION);
				$newFileName_url = base_url() . 'images/' . $newFileName;
				$config['upload_path'] = './images/';
				$config['file_name'] = $newFileName;
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$this
				->load
				->library('upload', $config);
				if (!$this
				->upload
				->do_upload('pan_front_img'))
				{
					$this->RESULT["error"] = array(
						'error' => $this
						->upload
						->display_errors()
					);
				}
				else
				{
					$this
					->db
					->where('execid', $this->refid)
					->where('mobile', $_POST['mobile'])->update('deliveryExecutives', array(
						'pan_num' => $_POST['pan_num'],
						'pan_front_img' => $newFileName_url,
						// 'aadhar_back_img' => $newFileName2_url

					));
					$this->RESULT["status"] = "1";
					// $this->RESULT["sql"] = $this->db->last_query();
					$this->RESULT["message"] = "Script run Succesfull aadharcard uploaded";
					$this->RESULT["data"] = $this
					->upload
					->data();
				}
			}
			else
			{
				$this->RESULT["message"] = "Check param file";
			}
		}
		else
		{
			$this->RESULT["message"] = "Check params";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_add_log_location()
	{
		if ($this
		->input
		->post('lat') && $this
		->input
		->post('lng'))
		{
			if ($this
			->db
			->insert('deliveryExecLocLogger', array(
				'lat' => $_POST['lat'],
				'lng' => $_POST['lng'],
				'execid' => $this->refid
			)))
			{
				$this->RESULT["status"] = "1";
				$this->RESULT["message"] = "Script run Succesfull";
			}
		}
		else
		{
			$this->RESULT["message"] = "Check params";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_pick_order_item()
	{
		if ($this
		->input
		->post('custorderid', true) && $this
		->input
		->post('orderitemid', true))
		{
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->where('orderitemid', $_POST['orderitemid'])->update('customer_orderItem', array(
				'delivered_by_id' => $this->refid,
				'status' => 'OUTFORDELIVERY'
			));
			$this->RESULT["status"] = "1";
			$this->RESULT["message"] = "delivery id added";
		}
		else
		{
			$this->RESULT["message"] = "Check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_pick_order()
	{
		if ($this
		->input
		->post('custorderid', true))
		{
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orders', array(
				'delivered_by_id' => $this->refid,
				'status' => 'OUTFORDELIVERY'
			));
			$this->RESULT["status"] = "1";
			$this->RESULT["message"] = "delivery id added";
		}
		else
		{
			$this->RESULT["message"] = "Check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_set_delivered()
	{
		if ($this
		->input
		->post('custorderid'))
		{
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orders', array(
				'status' => 'DELIVERED'
			));
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orderItem', array(
				'status' => 'DELIVERED'
			));
			$this->RESULT["status"] = "1";
			$this->RESULT["message"] = "Order delivered succesfull";
		}
		else
		{
			$this->RESULT["message"] = "Check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_set_refund()
	{
		if ($this
		->input
		->post('custorderid'))
		{
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orders', array(
				'status' => 'REFUNDED'
			));
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orderItem', array(
				'status' => 'REFUNDED'
			));
			$this->RESULT["status"] = "1";
					$this->RESULT["message"] = "Order refunded succesfull";
		}
		else
		{
			$this->RESULT["message"] = "Check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
	function deliv_set_return()
	{
		if ($this
		->input
		->post('custorderid'))
		{
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orders', array(
				'status' => 'RETURNED'
			));
			$this
			->db
			->where('custorderid', $_POST['custorderid'])->update('customer_orderItem', array(
				'status' => 'RETURNED'
			));
			$this->RESULT["status"] = "1";
			$this->RESULT["message"] = "Order refunded succesfull";
		}
		else
		{
			$this->RESULT["message"] = "Check param";
		}
		return $this
		->output
		->set_status_header()
		->set_output(json_encode($this->RESULT));
	}
}
