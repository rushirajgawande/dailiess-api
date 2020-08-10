<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class BusinessItems extends MY_Controller{
	var $RESULT,$refid,$value;
	function __construct()
	{
		parent::__construct();
	}
	function insert_biz_items()
	{
		if (
			$this->input->post('iteminvid',TRUE)
			&& $this->input->post('bizid',TRUE)
		) {
			$results = $this->db->get_where(
				'clientBizDetails',
				array('bizid' => $_POST['bizid'])
			);
			if (
				$results->num_rows() > 0
			) {
				$this->db->insert(
					'bizItems',
					array(
						'bizid' =>$this->input->post('bizid'),
						'refid' =>$this->refid,
						'refname' =>$this->refname,
						'iteminvid' =>$this->input->post('iteminvid')
					)
				);
				$this->RESULT["status"]  = "1";
				$this->RESULT["message"] = "Item Added Succesfully";
			}else {
				$this->RESULT["message"] = "Not found";
			}
		}else {
			$this->RESULT["message"] = "Error Check params!!";
		}
		return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
	}
	function remove_biz_items()
	{
		if (
			$this->input->post('itemid',TRUE)
		) {
			if (
				$this->db->where('itemid',$_POST['itemid'])->update(
					'bizItems',
					array(
						'bizItemsStatus' => 'REMOVED'
					)
					)
				) {
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Item Deleted Succesfully";
				}
			}
			return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
		}
		function update_biz_items()
		{
			if (
				$this->input->post('itemName',TRUE)
				&&  $this->input->post('itemDetails',TRUE)
				&&  $this->input->post('itemUnit',TRUE)
				&&  $this->input->post('itemUnitValue',TRUE)
				&&  $this->input->post('itemPrice',TRUE)
				&&  $this->input->post('bizid',TRUE)
			){
				$results = $this->db->get_where(
					'clientBizDetails',
					array(
						'bizid' => $_POST['bizid']
					)
				);
				if (
					$results->num_rows() > 0
				) {
					$this->db->where('bizid', $this->input->post('bizid'))->update(
						'bizItems',
						array(
							'itemName'=>$this->input->post('itemName'),
							'itemDetails'=>$this->input->post('itemDetails'),
							'itemUnit'=>$this->input->post('itemUnit'),
							'itemUnitValue'=>$this->input->post('itemUnitValue'),
							'itemPrice'=>$this->input->post('itemPrice'),
							'bizid'=>$this->input->post('bizid'),
							'refid'=>$this->refid,
							'refname'=>$this->refname
						)
					);
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Item Updated Succesfully";
				}else{
					$this->RESULT["message"] = "Script Run Unsuccesfull";
				}
			}else {
				$this->RESULT["message"] = "Script run Unsuccesfull Check param";
			}
			return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
		}
		function api_get_biz_items()
		{
			$this->RESULT["status"]  = "1";
			$this->RESULT["message"] = "All items succesfully feteched";
			$this->RESULT["Items"] = $this->db->get(
				'bizItems'
				)->result();
				return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
			}
			function get_all_available_items()
			{
				if (
					$this->input
					->post('bizid', TRUE))
					{
						$res = $this->db->get_where(
							'bizItems',
							array(
								'bizid' => $_POST['bizid']
							)
						);
						if (
							$res->num_rows() > 0
							)
							{
								$this->RESULT["status"] = "1";
								$this->RESULT["data"] = $res->result() ;
							}
							else
							{
								$this->RESULT["message"] = "Not Found!!";
							}
						}
						else
						{
							$this->RESULT["message"] = "Missing params";
						}
						return $this
						->output
						->set_status_header(200)
						->set_output(json_encode($this->RESULT));
					}
				}
