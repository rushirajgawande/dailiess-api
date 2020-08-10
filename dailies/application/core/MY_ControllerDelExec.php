<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_ControllerDelExec extends CI_Controller{
	var $refid, $refname;
	public function __construct(){
		parent::__construct();
		$this->RESULT["status"] = "0";
		$this->RESULT["message"] = "Script Run Unsuccesfull";
		$this->RESULT["post_data"] = $_POST;
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
			switch ($this->uri->segment('1')) {
				// case 'deliv-add-aadharcard':
				// $this->get_important_ids();
				// break;
				// case 'deliv-add-pancard':
				// $this->get_important_ids();
				// break;
				// case 'deliv-add-pancard':
				// break;
				default:
				$this->get_important_ids();
				break;
			}
		}
		function get_important_ids(){
			$result = $this->db->get_where(
				'authTokens',
				array(
					'authToken' => $_POST['authToken']
				)
			);
			if ( $result->num_rows() > 0) {
				$this->refid = $result->row()->refid;
				$this->refname = $result->row()->refname;
			} else {
				$this->RESULT["message"] = "Request Not authorized";
				exit(
					// $this->db->last_query()
					json_encode(
						$this->RESULT
						)
					);
				}
			}
		}
