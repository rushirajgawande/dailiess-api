<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Orders extends MY_Controller{
	var $RESULT,$refid,$value;
	function __construct()
	{
		parent::__construct();
	}
	function create_my_new_order(){
		$this->db->trans_start();
		$total_order_amt = 0;
		if (
			$this->input->post('custFname', TRUE)
			&& $this->input->post('custLname', TRUE)
			&& $this->input->post('custEmail', TRUE)
			&& $this->input->post('custMobile', TRUE)
			&& $this->input->post('bizid', TRUE)
			&& $this->input->post('lat', TRUE)
			&& $this->input->post('lng', TRUE)
		) {
			$orderId = date(
				"dmyhis"
			);
			if (
				$this->db->insert(
					'orders',
					array(
						'orderid' => $orderId,
						'bizid' => $this->input->post('bizid'),
						'refid' => $this->refid,
						'refname' => $this->refname,
						'lat' => $this->input->post('lat'),
						'lng' => $this->input->post('lng'),
						'custMobile' => $this->input->post('custMobile'),
						'custEmail' => $this->input->post('custEmail'),
						'custFname' => $this->input->post('custFname'),
						'custLname' => $this->input->post('custLname'),
						'from_ip' => $this->input->ip_address()
					)
					)
				) {
					$item_array = explode( '_', $_POST['item_details']);
					$item_array_qty = explode( '_', $_POST['item_details_qty']);
					$item_array_ppu = explode( '_', $_POST['item_details_ppu']);
					for ($i=0; $i < sizeof($item_array); $i++) {
						$total_order_amt = $total_order_amt + ( $item_array_qty[$i] * $item_array_ppu[$i] );
						$this->db->insert(
							'orderItem',
							array(
								'bizid' => $this->input->post('bizid'),
								'quantity' => $item_array_qty[$i],
								'refid' => $this->refid,
								'priceperunit' => $item_array_ppu[$i],
								'refname' => $this->refname,
								'itemid' => $item_array[$i],
								'orderid' => $orderId,
								'from_ip' => $this->input->ip_address()
							)
						);
					}
					$this->db->trans_commit();
					// Prepare Message : Sent Booking Confirmation Msg
					$api_key = '25C3DC47484725';
					$contacts = $_POST['custMobile'];
					$from = 'BILSAM';
					$sms_text = urlencode('Total order amount is ' . $total_order_amt . ' INR and order id is ' . $orderId . '. Thank you for your order.');
					//Submit to server
					$ch = curl_init();
					curl_setopt($ch, CURLOPT_URL, "https://www.logonutility.in/app/smsapi/index.php");
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
					curl_setopt($ch, CURLOPT_POST, 1);
					curl_setopt($ch, CURLOPT_POSTFIELDS, "key=" . $api_key . "&campaign=1&routeid=20&type=text&contacts=" . $contacts . "&senderid=" . $from . "&msg=" . $sms_text);
					$response = ENVIRONMENT == 'production' ? curl_exec($ch) : "Dev-Sent";
					// $response = curl_exec($ch);
					curl_close($ch);

					// $this->RESULT["sms_status"]  = $response;
				
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Order placed Successfully!";
				}
			}
			return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
		}
		function fetch_biz_orders()
		{
			if (
				$this->input->post('bizid')
			) {
				$results = $this->db->get_where(
					'orders',
					array(
						'bizid' => $_POST['bizid']
					)
				);
				if (
					$results->num_rows() > 0
				) {
					$this->RESULT["status"]  = "1";
					$this->RESULT["data"] = $results->result() ;
				}else {
					$this->RESULT["message"] = "Order Not found" ;
				}
			}else {
				$this->RESULT["message"] = "Missing Param" ;
			}
			return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
		}
		function fetch_biz_orders_details()
		{
			if (
				$this->input->post('bizid')
				&& $this->input->post('orderid')
			) {
				$results = $this->db->get_where(
					'orderItem',
					array(
						'bizid' => $_POST['bizid'],
						'orderid' => $_POST['orderid']
					)
				);
				if (
					$results->num_rows() > 0
				) {
					$this->RESULT["status"]  = "1";
					$this->RESULT["data"] = array(
						'order-details' => $this->db->where('bizid',$_POST['bizid'])->get(
							'orders'
						)->row(),
						'order-items' => $results->result()) ;
					}else {
						$this->RESULT["message"] = "Order Not found" ;
					}
				}else {
					$this->RESULT["message"] = "Missing Param" ;
				}
				return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
			}
		}
