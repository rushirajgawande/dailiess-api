<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Customer extends MY_Controller{
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
	function customer_add_address()
	{
		if (
			$this->input->post('address',TRUE)
			&& $this->input->post('landmark',TRUE)
			&& $this->input->post('locality',TRUE)
			&& $this->input->post('city',TRUE)
			&& $this->input->post('pincode',TRUE)
			// && $this->input->post('custid',TRUE)
		) {
			$this->db->insert(
				'customer_address',
				array(
					'address' => $this->input->post('address'),
					'landmark' => $this->input->post('landmark'),
					'locality' => $this->input->post('locality'),
					'city' => $this->input->post('city'),
					'pincode' => $this->input->post('pincode'),
					'custid' => $this->refid,
					'lat' => $this->input->post('lat'),
					'lng' => $this->input->post('lng')
				)
			);
			$this->RESULT["status"]  = "1";
			$this->RESULT["message"] = "Customer address added Succesfully";
		}else {
			$this->RESULT["message"] = "Failed check params";
		}
		return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
	}
	function update_address()
	{
		if (
			$this->input->post('address',TRUE)
			&& $this->input->post('landmark',TRUE)
			&& $this->input->post('locality',TRUE)
			&& $this->input->post('city',TRUE)
			&& $this->input->post('pincode',TRUE)
			// && $this->input->post('custid',TRUE)
			&& $this->input->post('addrid',TRUE)
		) {
			$this->db->where(
				'custid', $this->refid
				)->where(
					'addrid',$_POST['addrid']
					)->update(
						'customer_address',
						array(
							'address' => $this->input->post('address'),
							'landmark' => $this->input->post('landmark'),
							'locality' => $this->input->post('locality'),
							'city' => $this->input->post('city'),
							'pincode' => $this->input->post('pincode'),
							'custid' => $this->refid,
							'lat' => $this->input->post('lat'),
							'lng' => $this->input->post('lng')
						)
					);
					$this->RESULT["status"]  = "1";
					$this->RESULT["message"] = "Customer address Updated Succesfully";
				}else {
					$this->RESULT["message"] = "Failed check params";
				}
				return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
			}
			function remove_address()
			{
				if (
					// $this->input->post('custid',TRUE)
					$this->input->post('addrid',TRUE)
				) {
					$this->db->where(
						'custid', $this->refid
						)->where(
							'addrid', $_POST['addrid']
							)->update(
								'customer_address',
								array(
									'status' => 'INACTIVE'
								)
							);
							$this->RESULT["status"]  = "1";
							$this->RESULT["message"] = "Customer address Deleted Succesfully";
						}else {
							$this->RESULT["message"] = "Failed check params";
						}
						return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
					}
					function get_customer_detail()
					{
						if (
							// $this->input->post('mobile')
							$this->input->post('custid')
						) {
							$result = $this->db->where(
								'custid', $_POST['custid']
								)->get(
									'customer'
								);
								if (
									$result->num_rows() > 0
								) {
									$this->RESULT["status"]  = "1";
									$this->RESULT["message"] = "Customer details fetch Succesfully";
									$this->RESULT["data"] = $result->row();
								}else {
									$this->RESULT["message"] = "Not Found!!";
								}
							}else {
								$this->RESULT["message"] = "Check param";
							}
							return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
						}
						function fetch_all_ACTIVE_address()
						{
							$res = $this->db->get_where(
								'customer_address',
								array(
									'custid' => $this->refid,
									'status' => 'ACTIVE'
								)
							);
							$this->RESULT["status"]  = "1";
							$this->RESULT["data"] = $res->result();
							return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
						}
						function reviews_and_rating()
						{
							if (
								$this->input->post('delivery',TRUE)
								// &&	$this->input->post('delivery') == range(0,10)
								&& $this->input->post('product',TRUE)
								// &&	$this->input->post('product') == range(0,10)
								&& $this->input->post('packaging',TRUE)
								// &&	$this->input->post('packaging') == range(0,10)
								&& $this->input->post('handling',TRUE)
								// &&	$this->input->post('handling') == range(0,10)
								// && $this->input->post('custid',TRUE)
								&& $this->input->post('custorderid',TRUE)
								// && $this->input->post('refid',TRUE)
								// && $this->input->post('refname',TRUE)
								&& $this->input->post('review_details',TRUE)
								// && $this->input->post('lat',TRUE)
								// && $this->input->post('lng',TRUE)
							) {
								if (
									$this->db->insert(
										'reviews',
										array(
											'details' => $this->input->post('review_details'),
											'custid' => $this->refid,
											'from_ip' => $this->input->ip_address(),
											'refid' => $this->refid,
											'refname' => $this->refname,
											'custorderid' => $this->input->post('custorderid'),
											'lat'=>$this->input->post('lat'),
											'lng'=>$this->input->post('lng')
										)
										)
										&&
										$this->db->insert(
											'ratings',
											array(
												'delivery'=> $this->input->post('delivery'),
												'product'=> $this->input->post('product'),
												'packaging'=> $this->input->post('packaging'),
												'handling'=> $this->input->post('handling'),
												'custid'=> $this->refid,
												'custorderid'=> $this->input->post('custorderid'),
												'refid'=> $this->refid,
												'refname'=> $this->refname,
												'from_ip'=> $this->input->ip_address(),
												'lat'=>$this->input->post('lat'),
												'lng'=>$this->input->post('lng')
											)
											)
										) {
											$this->RESULT["status"]  = "1";
											$this->RESULT["message"] = "Review and rating added Succesfully";
										}else {
											$this->RESULT["message"] = "Unsuccesfull try again";
										}
									}else {
										$this->RESULT["message"] = "Failed check params";
									}
									return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
								}
								function add_wallet_transaction()
								{
									if (
										$this->input->post('custid',TRUE)
										&&	$this->input->post('amount',TRUE)
										&&	$this->input->post('mode',TRUE)
										// &&	$this->input->post('refid',TRUE)
										// &&	$this->input->post('refname',TRUE)
										&&	$this->input->post('details',TRUE)
									) {
										if (
											$this->db->insert(
												'custWalleTxn',
												array(
													'custid' => $_POST['custid'],
													'amount' => $_POST['amount'],
													'mode' => $_POST['mode'],
													'refid' => $this->refid,
													'refname' => $this->refname,
													'details' => $_POST['details'],
													'from_ip'=> $this->input->ip_address()
												)
												)
											) {
												$this->RESULT["status"]  = "1";
												$this->RESULT["message"] = "transaction added Succesfully";
											}else {
												$this->RESULT["message"] = "transaction Unsucesfull ";
											}
										}else {
											$this->RESULT["message"] = "Failed check params";
										}
										return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
									}
									function fetch_my_transaction()
									{
										if (
											$this->input->post('custid')
										) {
											$res = $this->db->get_where(
												'custWalleTxn',
												array(
													'custid'=>$_POST['custid']
												)
											);
											if (
												$res->num_rows() > 0
											) {
												$this->RESULT['status'] = '1';
												$this->RESULT['message'] = 'transaction fetch Succesfully';
												$this->RESULT['coupons'] = $res->result();
											}else {
												$this->RESULT['message'] = 'trtransaction Not found';
											}
										}else {
											$this->RESULT['message'] = 'Check param Error!';
										}
										return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
									}
									function update_customer_detail()
									{
										if (
											$this->input->post('mobile')
											&& strlen($this->input->post('mobile')) >= 10
											&& $this->input->post('fname')
											&& $this->input->post('lname')
											&& $this->input->post('email')
											// && $this->input->post('refid')
											// && $this->input->post('refname')
										) {
											$res = $this->db->get_where(
												'customer',
												array(
													'mobile' => $_POST['mobile']
												)
											);
											if (
												$res->num_rows() > 0
											) {
												$this->db->where(
													'mobile', $_POST['mobile']
													)->where(
														'custid', $_POST['custid']
														)->update(
															'customer',
															array(
																'fname' =>   $_POST['fname'],
																'lname' =>   $_POST['lname'],
																'email' =>   $_POST['email'],
																'refid' =>   $this->refid,
																'refname' => $this->refname,
																'from_ip' => $this->input->ip_address()
															)
														);
														$this->RESULT['status'] = '1';
														$this->RESULT['message'] = 'customer profile updated successfully';
													}else {
														$this->RESULT['message'] = 'Mobile no not found!!';
													}
												}else {
													$this->RESULT['message'] = 'Error check params!!';
												}
												return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
											}
											function search_product()
											{
												if (
													$this->input->post('search')
												) {
													$res = $this->db->select('*')->from('masterBizItemInventory')->like('name', $_POST['search'])
													->or_like('details', $_POST['search'])
													->or_like('categid',$_POST['search'])
													->or_like('brandName',$_POST['search'])
													->get();
													if (
														$res->num_rows() > 0
													) {
														$this->RESULT['status'] = '1';
														$this->RESULT['message'] = 'Search results found';
														$this->RESULT['data'] = $res->result();
													}else {
														$this->RESULT['message'] = 'Not found';
													}
												}else {
													$this->RESULT['message'] = 'Error check params!!';
												}
												return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
											}
											function get_product_categories()
											{
												$this->RESULT['status'] = '1';
												$this->RESULT['message'] = 'customer profile updated successfully';
												$this->RESULT['data'] =	$this->db->distinct('categid')->get(
													'masterBizItemInventory'
												);
												return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
											}
											function search_product_by_categories()
											{
												if (
													$this->input->post('category')
												) {
													$result = $this->db->get_where(
														'masterBizItemInventory',
														array(
															'categid' => $_POST['category']
														)
													);
													if (
														$result->num_rows() > 0
													) {
														$this->RESULT['status'] = '1';
														$this->RESULT['message'] = 'Results found Succesful';
														$this->RESULT['data'] =	$result->row();
													}else {
														$this->RESULT['message'] = 'Not Found';
													}
												}else {
													$this->RESULT['message'] = 'Check Param';
												}
												return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
											}
											function cust_my_cart()
											{
												if (
													$this->input->post('itemid')
													&& $this->input->post('quantity')
													&& $this->input->post('custid')
												) {
													if (
														$this->db->get_where(
															'customer_MyCart',
															array(
																'custid' => $_POST['custid'],
																'itemid' => $_POST['itemid']
															)
															)
														){
															$this->db->set('quantity', 'quantity+'.$_POST['quantity'], FALSE)
															->where('custid', $_POST['custid'])
															->where('itemid', $_POST['itemid'])
															->update('customer_MyCart');
															$this->RESULT['status'] = '1';
															$this->RESULT['message'] = 'Item quantity updated succesfully';
														}else {
															$this->db->insert(
																'customer_MyCart',
																array(
																	'custid'=>$_POST['custid'],
																	'quantity'=>$_POST['quantity'],
																	'itemid'=>$_POST['itemid'],
																	'refid'=>$this->refid,
																	'refname'=>$this->refname,
																	'from_ip'=>$this->input->ip_address()
																)
															);
															$this->RESULT['status'] = '1';
															$this->RESULT['message'] = 'Item added to cart succesfully';
														}
													}else {
														$this->RESULT['message'] = 'Check Param';
													}
													return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
												}
												function view_my_cart()
												{
													if (
														$this->input->post('custid')
													) {
														$result = $this->db->where('custid',$_POST['custid'])->get(
															'view_custmer_card_master'
														);
														if (
															$result->num_rows() > 0
														) {
															$this->RESULT['status'] = '1';
															$this->RESULT['message'] = 'Results found Succesful';
															$this->RESULT['data'] =	$result->result();
														}else {
															$this->RESULT['message'] = 'Not Found';
														}
													}else {
														$this->RESULT['message'] = 'Check Param';
													}
													return $this->output->set_status_header()->set_output(json_encode($this->RESULT));
												}
											}
