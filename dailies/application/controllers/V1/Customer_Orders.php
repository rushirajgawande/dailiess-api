<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Customer_Orders extends MY_Controller{
	var $RESULT;
	public function __construct()
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
	function customer_create_order()
	{
		$this->db->trans_start();
		if (
			$this->input->post('lat',TRUE)
			&& $this->input->post('lng',TRUE)
			// && $this->input->post('custid',TRUE)
			&& $this->input->post('addrid',TRUE)
			&& $this->input->post('amount',TRUE)
			&& $this->input->post('item_details',TRUE)
			&& $this->input->post('item_details_qty',TRUE)
			&& $this->input->post('item_details_ppu',TRUE)
		) {
			$custorderId = date(
				"dmyhis"
			);
			if (
				$this->db->insert(
					'customer_orders',
					array(
						'custorderid'=> $custorderId,
						'refid' => $this->refid,
						'refname' => $this->refname,
						'lat' => $this->input->post('lat'),
						'lng' => $this->input->post('lng'),
						'custid' => $this->refid,
						'addrid' => $this->input->post('addrid'),
						'from_ip' => $this->input->ip_address()
					)
					)
				) {
					$item_array = explode( '_', $_POST['item_details'] );
					$item_array_qty = explode( '_', $_POST['item_details_qty']);
					$item_array_ppu = explode( '_', $_POST['item_details_ppu']);
					for ($i=0; $i < sizeof($item_array); $i++) {
						$this->db->insert(
							'customer_orderItem',
							array(
								'quantity' => $item_array_qty[$i],
								'priceperunit' => $item_array_ppu[$i],
								'refid' => $this->refid,
								'refname' => $this->refname,
								'itemid' => $item_array[$i],
								'custorderid' => $custorderId,
								'from_ip' => $this->input->ip_address()
							)
						);
					}
					$this->db->insert(
						'customer_orderTxn',
						array(
							'amount'=> $_POST['amount'],
							'refid' => $this->refid,
							'refname' => $this->refname,
							'custorderid' => $custorderId,
							'from_ip' => $this->input->ip_address()
						)
					);
					$this->db->trans_commit();
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Order placed Successfully!";
				}else {
					$this->RESULT["message"] = "Failed check params";
				}
			}
			return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
		}
		function display_orders()
		{
			if (
				$this->input->post('custid',TRUE)
			) {
				$res = $this->db->get_where(
					'customer_orders',
					array(
						'custid' => $_POST['custid']
					)
				);
				$custorderid = $res->row()->custorderid;
				$custorders = $this->db->get_where(
					'customer_orderItem',
					array(
						'custorderid' => $custorderid
					)
				);
				$this->RESULT["status"]  = "1";
				$this->RESULT["message"] = "Your Orders!";
				$this->RESULT["orders"] = $custorders->result();
			}else {
				$this->RESULT["message"] = "Failed check params";
			}
			return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
		}
		function customer_orders_status()
		{
			if (
				$this->input->post('orderitemid',TRUE)
				&& $this->input->post('custorderid',TRUE)
			) {
				$res = $this->db->get_where(
					'customer_orderItem',
					array(
						'orderitemid'=> $_POST['orderitemid'],
						'custorderid'=>$_POST['custorderid']
					)
				);
				if (
					$res->num_rows() > 0
				) {
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Your Order Status for the orderitemid!";
					$this->RESULT["orders-status"] = $res->row()->status;
				}else {
					$this->RESULT["message"] = "No item found";
				}
			}else {
				$this->RESULT["message"] = "Failed check params";
			}
			return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
		}
		function cancel_order()
		{
			if (
				$this->input->post('orderitemid',TRUE)
				&& $this->input->post('custorderid',TRUE)
			) {
				$this->db->where(
					'orderitemid',$_POST['orderitemid']
					)->where(
						'custorderid',$_POST['custorderid']
						)->update(
							'customer_orderItem',
							array(
								'status' => 'CANCELLED'
							)
						);
						$this->RESULT["status"]  = "1";
						$this->RESULT["message"] = "Your Order is succesfully cancelled!";
					}else {
						$this->RESULT["message"] = "Failed check params";
					}
					return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
				}
				function like_a_product()
				{
					if (
						$this->input->post('itemid')
						&& $this->input->post('custid')
						&& $this->input->post('like_by')
					) {
						$result = $this->db->get_where(
							'bizItems_rrl',
							array(
								'itemid'=>$_POST['itemid'],
								'custid'=>$_POST['custid']
							)
						);
						if (
							$result->num_rows() > 0
						) {
							$this->RESULT["status"]  = "1";
							$this->RESULT["message"] = "Your Already liked!";
						}else{
							$this->db->insert(
								'bizItems_rrl',
								array(
									'itemid'=>$_POST['itemid'],
									'custid'=>$_POST['custid'],
									'like_by'=>$_POST['like_by']
								)
							);
							$this->RESULT["status"]  = "1";
							$this->RESULT["message"] = "Like successfull";
						}
					}else {
						$this->RESULT["message"] = "Check Param";
					}
					return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
				}
				function fetch_open_orders()
				{
					$res = $this->db->get_where(
						'view_open_order_items_master',
						array(
							'status' => 'OPEN'
						)
					);
					if (
						$res->num_rows() > 0
					) {
						$this->RESULT["status"]  = "1";
						$this->RESULT["message"] = "Your Order Status for the orderitemid!";
						$this->RESULT["data"] = $res->result();
					}else {
						$this->RESULT["message"] = "No item found";
					}
					return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
				}
				function order_ready_to_deliver()
				{
					if (
						$this->input->post('orderitemid',TRUE)
						&& $this->input->post('custorderid',TRUE)
					) {
						$this->db->where(
							'orderitemid',$_POST['orderitemid']
							)->where(
								'custorderid',$_POST['custorderid']
								)->update(
									'customer_orderItem',
									array(
										'status' => 'PREPARED'
									)
								);
								$this->RESULT["status"]  = "1";
								$this->RESULT["message"] = "Your Order is readty to be delivered!";
							}else {
								$this->RESULT["message"] = "Failed check params";
							}
							return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
						}
						function order_out_for_delivery()
						{
							if (
								$this->input->post('orderitemid',TRUE)
								&& $this->input->post('custorderid',TRUE)
							) {
								$this->db->where(
									'orderitemid',$_POST['orderitemid']
									)->where(
										'custorderid',$_POST['custorderid']
										)->update(
											'customer_orderItem',
											array(
												'status' => 'OUTFORDELIVERY'
											)
										);
										$this->RESULT["status"]  = "1";
										$this->RESULT["message"] = "Your Order is out of delivery!";
									}else {
										$this->RESULT["message"] = "Failed check params";
									}
									return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
								}
								function order_delivered()
								{
									if (
										$this->input->post('orderitemid',TRUE)
										&& $this->input->post('custorderid',TRUE)
									) {
										$this->db->where(
											'orderitemid',$_POST['orderitemid']
											)->where(
												'custorderid',$_POST['custorderid']
												)->update(
													'customer_orderItem',
													array(
														'status' => 'DELIVERED'
													)
												);
												$this->RESULT["status"]  = "1";
												$this->RESULT["message"] = "Your Order is succesfully delivered!";
											}else {
												$this->RESULT["message"] = "Failed check params";
											}
											return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
										}
										function pickup_api()
										{
											if (
												$this->input->post('bizuserid',TRUE)
												&& $this->input->post('custorderid',TRUE)
											){
												$res1 = $this->db->get_where(
													'clientBizUsers',
													array(
														'bizuserid'=>$_POST['bizuserid']
													)
												);
												$res2 = $this->db->get_where(
													'customer_orders',
													array(
														'custorderid' => $_POST['custorderid']
													)
												);
												if (
													$res1->num_rows() > 0
													&& $res2->num_rows() > 0
													&& $res1->row()->status != 'BLOCKED'
													&& $res2->row()->status == 'OPEN'
												) {
													$this->db->where(
														array('custorderid' => $_POST['custorderid']
													)
													)->update(
														'customer_orders',
														array(
															'accepted_by_id' => $_POST['bizuserid'],
															'status' => 'PREPARED'
														)
													);
												}
												$this->RESULT["status"]  = "1";
												$this->RESULT["message"] = "Your Order is Picked Succesfully";
											}else {
												$this->RESULT["message"] = "Failed check params";
											}
											return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
										}
										function get_all_previous_orders()
										{
											if (
												$this->input->post('custorderid')
											) {
												$res = $this->db->get_where(
													'customer_orderItem',
													array(
														'custorderid' => $_POST['custorderid']
													)
												);
												$res1 = $this->db->get_where(
													'customer_orderItem',
													array(
														'custorderid' => $_POST['custorderid'],
														'status' => 'OPEN'
													)
												);
												if (
													$res->num_rows() > 0
												) {
													$this->RESULT["status"]  = "1";
													$this->RESULT["message"] = "Your previous orders!";
													$this->RESULT["previous_orders"] = $res->result();
													$this->RESULT["open_orders"] = $res1->result();
												}else {
													$this->RESULT["message"] = "NO previous orders found!";
												}
											}else {
												$this->RESULT["message"] = "Missing params!";
											}
											return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
										}
										function pick_this_customer_order_item()
										{
											if (
												$this->input->post('custorderid',TRUE)
												&& $this->input->post('orderitemid',TRUE)
												// && $this->input->post('bizid',TRUE)
											){
												$result = $this->db->get_where(
													'view_open_order_items_master',
													array(
														'custorderid' => $_POST['custorderid'],
														'orderitemid'=> $_POST['orderitemid']
													)
												);
												if (
													$result->num_rows() > 0
													&& $this->db->where(
														'custorderid',$_POST['custorderid']
														)->where(
															'orderitemid',$_POST['orderitemid']
															)->update(
																'customer_orderItem',
																array(
																	'accepted_by_id' => $_POST['bizid'],
																	'status' => 'ACCEPTED'
																)
																)
															) {
																$this->RESULT["status"]  = "1";
																$this->RESULT["message"] = "Your Order ITEM is Succesfully Picked";
															}else {
																$this->RESULT["message"] = "Your Order is already Picked";
															}
														}else {
															$this->RESULT["message"] = "Failed check params";
														}
														return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
													}
													function customer_order_invoice()
													{
														if (
															$this->input->post('custorderid',TRUE)
															&& $this->input->post('orderitemid',TRUE)
														) {
															$result = $this->db->get_where(
																'view_ready_order_items_master',
																array(
																	'custorderid' => $_POST['custorderid'],
																	'orderitemid'=> $_POST['orderitemid']
																)
															);
															if (
																$result->num_rows() > 0
															){
																$this->RESULT["status"]  = "1";
																$this->RESULT["message"] = "Script Run succesfull";
																$this->RESULT["data"] = $result->row();
															}else {
																$this->RESULT["message"] = "Not Found";
															}
														}else {
															$this->RESULT["message"] = "Failed check params";
														}
														return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
													}
												}
