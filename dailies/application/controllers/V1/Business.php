<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Business extends MY_Controller
{
   var $RESULT, $refid, $value;
   function __construct()
   {
      parent::__construct();
   }
   function api_get_business_list_user()
   {
      $results = $this->db->get_where(
         'clientBizDetails',
         array(
            'bizOwnerId' => $this->refid
         )
      );
      if ($results->num_rows() > 0)
      {
         $this->RESULT["status"] = "1";
         $this->RESULT["message"] = "Script Run Succesfull";
         $this->RESULT["details"] = $results->row();
      }
      else
      {
         $this->RESULT["message"] = "Script Run Unsuccesfull check params";
      }
      return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
   }
   function api_update_biz_owner()
   {
      if (
         $this->input->post('fname', true)
         && $this->input->post('lname', true)
         && $this->input->post('email', true))
         {
            $this->db->update(
               'bizOwner',
               array(
                  'fname' => $this->input->post('fname') ,
                  'lname' => $this->input->post('lname') ,
                  'email' => $this->input->post('email') ,
                  'from_ip' => $this->input->ip_address()
               ),
               array(
                  'bizOwnerId' => $this->refid
               )
            );
            $this->RESULT["status"] = "1";
            $this->RESULT["date"] = date("d M Y");
            $this->RESULT["message"] = "profile updated succesfully";
         }
         else
         {
            $this->RESULT["message"] = "Script Run Unsuccesfull check params";
         }
         return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
      }
      function api_update_biz_owner_biz_detail()
      {
         if (
            $this->input->post('bizName', true)
            && $this->input->post('bizid', true)
            && $this->input->post('bizDetails', true) 
            && $this->input->post('lat', true)
            && $this->input->post('lng', true)
            && $this->input->post('email', true)
            && $this->input->post('mobile', true)
            && $this->input->post('pincode', true)
            && $this->input->post('city', true)
            && $this->input->post('state', true)
            && $this->input->post('country', true)
            && $this->input->post('countrycode', true)
            && $this->input->post('address', true)
            && $this->input->post('landmark', true))
            {
               $this
               ->db
               ->update('clientBizDetails', array(
                  'bizName' => $this
                  ->input
                  ->post('bizName') ,
                  'bizDetails' => $this
                  ->input
                  ->post('bizDetails') ,
                  'lat' => $this
                  ->input
                  ->post('lat') ,
                  'lng' => $this
                  ->input
                  ->post('lng') ,
                  'email' => $this
                  ->input
                  ->post('email') ,
                  'mobile' => $this
                  ->input
                  ->post('mobile') ,
                  'pincode' => $this
                  ->input
                  ->post('pincode') ,
                  'city' => $this
                  ->input
                  ->post('city') ,
                  'state' => $this
                  ->input
                  ->post('state') ,
                  'country' => $this
                  ->input
                  ->post('country') ,
                  'countrycode' => $this
                  ->input
                  ->post('countrycode') ,
                  'address' => $this
                  ->input
                  ->post('address') ,
                  'landmark' => $this
                  ->input
                  ->post('landmark')
               ),array(
                  'bizid' => $_POST['bizid']
               ));
               $this->RESULT["status"] = "1";
               $this->RESULT["date"] = date("d M Y");
               $this->RESULT["message"] = "profile updated succesfully";
            }
            else
            {
               $this->RESULT["message"] = "Script Run Unsuccesfull check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_insert_bizinoutlogger()
         {
            if ($this
            ->input
            ->post('bizid', true) && $this
            ->input
            ->post('refid', true) && $this
            ->input
            ->post('refname', true) && $this
            ->input
            ->post('lat', true) && $this
            ->input
            ->post('lng', true))
            {
               $results = $this
               ->db
               ->Limit(1)
               ->order_by('addedon', 'DESC')
               ->select('type')
               ->where(array(
                  'bizid' => $_POST['bizid'],
                  'bizOwnerId' => $this->refid
               ) , array(
                  'addedon' == date('dmyhis')
               ))
               ->get('bizInOutLogger');
               if ($results->num_rows() == 0)
               {
                  $this
                  ->db
                  ->insert('bizInOutLogger', array(
                     'bizid' => $this
                     ->input
                     ->post('bizid') ,
                     'bizOwnerId' => $this->refid,
                     'refid' => $this
                     ->input
                     ->post('refid') ,
                     'refname' => $this
                     ->input
                     ->post('refname') ,
                     'lat' => $this
                     ->input
                     ->post('lat') ,
                     'lng' => $this
                     ->input
                     ->post('lng') ,
                     'type' => 'OPEN'
                  ));
                  $this->RESULT["status"] = "1";
                  $this->RESULT["message"] = "Type Added Succesfully";
               }
               elseif ($results->num_rows() == 1 && $results->row()->type === 'OPEN')
               {
                  $this
                  ->db
                  ->insert('bizInOutLogger', array(
                     'bizid' => $this
                     ->input
                     ->post('bizid') ,
                     'bizOwnerId' => $this->refid,
                     'refid' => $this
                     ->input
                     ->post('refid') ,
                     'refname' => $this
                     ->input
                     ->post('refname') ,
                     'lat' => $this
                     ->input
                     ->post('lat') ,
                     'lng' => $this
                     ->input
                     ->post('lng') ,
                     'type' => 'CLOSE'
                  ));
                  $this->RESULT["status"] = "1";
                  $this->RESULT["message"] = "Type Added Succesfully";
               }
               else
               {
                  $this
                  ->db
                  ->insert('bizInOutLogger', array(
                     'bizid' => $this
                     ->input
                     ->post('bizid') ,
                     'bizOwnerId' => $this->refid,
                     'refid' => $this
                     ->input
                     ->post('refid') ,
                     'refname' => $this
                     ->input
                     ->post('refname') ,
                     'lat' => $this
                     ->input
                     ->post('lat') ,
                     'lng' => $this
                     ->input
                     ->post('lng') ,
                     'type' => 'OPEN'
                  ));
                  $this->RESULT["status"] = "1";
                  $this->RESULT["message"] = "Type Added Succesfully";
               }
            }
            else
            {
               $this->RESULT["message"] = "Failed check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function insert_business_working_staff()
         {
            if ($this
            ->input
            ->post('bizid', true) && $this
            ->input
            ->post('fname', true) && $this
            ->input
            ->post('lname', true) && $this
            ->input
            ->post('email', true) && strlen($this
            ->input
            ->post('mobile', true)) == 10 && $this
            ->input
            ->post('refid', true) && $this
            ->input
            ->post('refname', true))
            {
               $this
               ->db
               ->insert('clientBizUsers', array(
                  'bizid' => $this
                  ->input
                  ->post('bizid') ,
                  'fname' => $this
                  ->input
                  ->post('fname') ,
                  'lname' => $this
                  ->input
                  ->post('lname') ,
                  'email' => $this
                  ->input
                  ->post('email') ,
                  'mobile' => $this
                  ->input
                  ->post('mobile') ,
                  'refid' => $this
                  ->refid ,
                  'refname' => $this
                  ->input
                  ->post('refname')
               ));
               $this->RESULT["status"] = "1";
               $this->RESULT["message"] = "Business Staff added Succesfully";
            }
            else
            {
               $this->RESULT["message"] = "Failed check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_enable_business_staff()
         {
            if ($this
            ->input
            ->post('bizid', true))
            {
               $this
               ->db
               ->update('clientBizUsers', array(
                  'status' => 'ACTIVE'
               ) , array(
                  'bizid' => $this
                  ->input
                  ->post('bizid')
               ));
               $this->RESULT["status"] = "1";
               $this->RESULT["message"] = "Business Staff status Succesfully";
            }
            else
            {
               $this->RESULT["message"] = "Failed check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_disable_business_staff()
         {
            if ($this
            ->input
            ->post('bizid', true))
            {
               $this
               ->db
               ->update('clientBizUsers', array(
                  'status' => 'INACTIVE'
               ) , array(
                  'bizid' => $this
                  ->input
                  ->post('bizid')
               ));
               $this->RESULT["status"] = "1";
               $this->RESULT["message"] = "Business Staff status Succesfully";
            }
            else
            {
               $this->RESULT["message"] = "Failed check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_block_business_staff()
         {
            if ($this
            ->input
            ->post('bizid', true))
            {
               $this
               ->db
               ->update('clientBizUsers', array(
                  'status' => 'BLOCKED'
               ) , array(
                  'bizid' => $this
                  ->input
                  ->post('bizid')
               ));
               $this->RESULT["status"] = "1";
               $this->RESULT["message"] = "Business Staff status Succesfully";
            }
            else
            {
               $this->RESULT["message"] = "Failed check params";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_get_biz_staff()
         {
            $results = $this
            ->db
            ->get('clientBizUsers');
            if ($results->num_rows() > 0)
            {
               $this->RESULT["status"] = "1";
               $this->RESULT["message"] = "Business Staff feteched Succesfully";
               $this->RESULT["client_roles"] = $results->result();
            }
            else
            {
               $this->RESULT["message"] = "Failed";
            }
            return $this
            ->output
            ->set_status_header(200)
            ->set_output(json_encode($this->RESULT));
         }
         function api_upload_attribute()
         {
            switch ($this
            ->input
            ->post('name'))
            {
               case 'IMAGE':
               if (
                  file_exists($_FILES['myfile']['tmp_name']))
                  {
                     if ($this
                     ->input
                     ->post('details') && $this
                     ->input
                     ->post('bizid'))
                     {
                        $newFileName = 'IMG' . date("dmyhis") . '.' . pathinfo($_FILES['myfile']['name'], PATHINFO_EXTENSION);
                        $newFileName_url = base_url() . 'images/' . $newFileName;
                        $config['upload_path'] = './images/';
                        $config['allowed_types'] = 'gif|jpg|png|jpeg';
                        $config['file_name'] = $newFileName;
                        $this
                        ->load
                        ->library('upload', $config);
                        if (!$this
                        ->upload
                        ->do_upload('myfile'))
                        {
                           $this->RESULT["error"] = array(
                              'error' => $this
                              ->upload
                              ->display_errors()
                           );
                        }
                        else
                        {
                           if ($this
                           ->db
                           ->insert('clientBizAttributes', array(
                              'name' => 'IMAGE',
                              'details' => $_POST['details'],
                              'value' => $newFileName_url,
                              'refid' => $this->refid,
                              'refname' => $this->refname,
                              'bizid' => $_POST['bizid']
                           )))
                           {
                              $this->RESULT["status"] = "1";
                              $this->RESULT["message"] = "Script run Succesfull File uploaded";
                              $this->RESULT["upload_data"] = array(
                                 'upload_data' => $this
                                 ->upload
                                 ->data()
                              );
                           }
                        }
                     }
                     else
                     {
                        $this->RESULT["message"] = "missing params";
                     }
                  }
                  else
                  {
                     $this->RESULT["message"] = 'File not found....';
                  }
                  break;
                  case 'TAG':
                  if ($this
                  ->input
                  ->post('details') && $this
                  ->input
                  ->post('bizid') && $this
                  ->db
                  ->insert('clientBizAttributes', array(
                     'name' => 'TAG',
                     'details' => $_POST['details'],
                     'value' => $_POST['value'],
                     'refid' => $this->refid,
                     'refname' => $this->refname,
                     'bizid' => $_POST['bizid']
                  )))
                  {
                     $this->RESULT["status"] = "1";
                     $this->RESULT["message"] = "Uploaded Successfully!";
                  }
                  else
                  {
                     $this->RESULT["message"] = "Missing params!";
                  }
                  break;
                  default:
                  $this->RESULT["message"] = 'Invalid attribute type....';
                  break;
               }
               return $this
               ->output
               ->set_status_header(200)
               ->set_output(json_encode($this->RESULT));
            }
            function api_kyc()
            {
               if (file_exists($_FILES['KYC_DOCUMENT']['tmp_name']) && $this
               ->input
               ->post('bizid', true))
               {
                  $newFileName1 = 'KYC' . date("dmyhis") . '.' . pathinfo($_FILES['KYC_DOCUMENT']['name'], PATHINFO_EXTENSION);
                  switch ($_POST['KYC_DOCUMENT_TYPE'])
                  {
                     case 'KYC_AADHAR':
                     $config['upload_path'] = './images/aadhar/';
                     $newFileName_url = base_url() . 'images/aadhar/' . $newFileName1;
                     break;
                     case 'KYC_PAN':
                     $config['upload_path'] = './images/pan/';
                     $newFileName_url = base_url() . 'images/pan/' . $newFileName1;
                     break;
                     case 'KYC_SHOP_ACT':
                     $config['upload_path'] = './images/shop_act/';
                     $newFileName_url = base_url() . 'images/shop_act/' . $newFileName1;
                     break;
                     case 'KYC_INC_CERT':
                     $config['upload_path'] = './images/inc_cert/';
                     $newFileName_url = base_url() . 'images/inc_cert/' . $newFileName1;
                     break;
                     default:
                     exit('error');
                  }
                  $config['allowed_types'] = 'gif|jpg|png|jpeg';
                  $config['allowed_types'] = 'gif|jpg|png|pdf';
                  $config['file_name'] = $newFileName1;
                  $this
                  ->load
                  ->library('upload', $config);
                  if (!$this
                  ->upload
                  ->do_upload('KYC_DOCUMENT'))
                  {
                     $this->RESULT["error"] = array(
                        'error' => $this
                        ->upload
                        ->display_errors()
                     );
                  }
                  else
                  {
                     if ($this
                     ->db
                     ->where(array(
                        'bizid' => $_POST['bizid']
                     ))->insert('clientBizAttributes', array(
                        'kyc_status' => 'Approved',
                     )))
                     {
                        $this->RESULT["status"] = "1";
                        $this->RESULT["message"] = "Script run Succesfull File uploaded";
                        $this->RESULT["upload_data"] = array(
                           'upload_data' => $this
                           ->upload
                           ->data()
                        );
                     }
                     else
                     {
                        $this
                        ->db
                        ->where(array(
                           'bizid' => $_POST['bizid']
                        ))->insert('clientBizAttributes', array(
                           'kyc_status' => 'Pending',
                        ));
                     }
                  }
               }
               else
               {
                  $this->RESULT["message"] = 'File not found....';
               }
               return $this
               ->output
               ->set_status_header(200)
               ->set_output(json_encode($this->RESULT));
            }
            // function biz_open_or_close()
            // {
            // 	if ($this
            // 	->input
            // 	->post('bizid', true))
            // 	{
            // 		$res = $this
            // 		->db
            // 		->Limit(1)
            // 		->order_by('addedon', 'DESC')
            // 		->select('type')
            // 		->where('bizid', $_POST['bizid'])->where('bizOwnerId', $this->bizOwnerId)
            // 		->get('bizInOutLogger');
            // 		if ($res->num_rows() > 0 && $res->row()->type == 'OPEN')
            // 		{
            // 			$this->RESULT["status"] = "1";
            // 			$this->RESULT["message"] = "Shop is OPEN";
            // 		}
            // 		else
            // 		{
            // 			$this->RESULT["status"] = "1";
            // 			$this->RESULT["message"] = "Shop is CLOSED";
            // 		}
            // 	}
            // 	else
            // 	{
            // 		$this->RESULT["message"] = "Missing params..!";
            // 	}
            // 	return $this
            // 	->output
            // 	->set_status_header(200)
            // 	->set_output(json_encode($this->RESULT));
            // }
            // For Home
            function get_biz_details()
            {
               $res = $this->db->get_where('clientBizDetails', array('bizid' => $_POST['bizid']));
               if ( $res->num_rows() > 0)
               {
                  $this->RESULT["status"] = "1";
                  $this->RESULT["message"] = "Business Found Succesful";
                  $this->RESULT["data"] = array(
                     "bizdetails" => $res->row(),
                     'todays_online_orders' => $this->db->where('accepted_by_id', $_POST['bizid'])->where('DATE(addedon) = CURDATE()')->get(
                        'customer_orders'
                     )->result(),
                     'todays_offline_orders' => $this->db->where('bizid', $_POST['bizid'])->where('DATE(addedon) = CURDATE()')->get(
                        'orders'
                     )->result()
                  );
                  $results_status = $this->db->Limit(1)->order_by('addedon', 'DESC')->select('type')->where('bizid', $_POST['bizid'])->where('bizOwnerId', $this->bizOwnerId)
                  ->get('bizInOutLogger');
                  $this->RESULT["biz_status"] = $results_status->num_rows() > 0 ? $results_status->row()->type : 'CLOSE';
               }
               return $this
               ->output
               ->set_status_header(200)
               ->set_output(json_encode($this->RESULT));
            }
            function add_coupon()
            {
               if (file_exists($_FILES['myfile']['tmp_name']) && $this
               ->input
               ->post('couponcode', true) && $this
               ->input
               ->post('couponamt', true) && $this
               ->input
               ->post('aouponamttype', true) && $this
               ->input
               ->post('maxamt', true) && $this
               ->input
               ->post('maxperuser', true) && $this
               ->input
               ->post('quantity', true) && $this
               ->input
               ->post('title', true) && $this
               ->input
               ->post('details', true) && $this
               ->input
               ->post('start_date', true)
               // && $start_date = date('Y-m-d', strtotime($this->input->post('start_date',TRUE)))
               && $this
               ->input
               ->post('end_date', true))
               {
                  $start_date = date(
                     'Y-m-d',
                     strtotime(
                        $this->input->post('start_date')
                        )
                     );
                     $end_date = date(
                        'Y-m-d',
                        strtotime(
                           $this->input->post('end_date')
                           )
                        );
                        $newFileName = 'IMG' . date("dmyhis") . '.' . pathinfo($_FILES['myfile']['name'], PATHINFO_EXTENSION);
                        $newFileName_url = base_url() . 'images/' . $newFileName;
                        $config['upload_path'] = './images/';
                        $config['allowed_types'] = 'gif|jpg|png|jpeg';
                        $config['file_name'] = $newFileName;
                        $this
                        ->load
                        ->library('upload', $config);
                        if (!$this
                        ->upload
                        ->do_upload('myfile'))
                        {
                           $this->RESULT["error"] = array(
                              'error' => $this
                              ->upload
                              ->display_errors()
                           );
                        }
                        else
                        {
                           if ($this
                           ->db
                           ->insert(
                              'coupons',
                              array(
                                 'couponcode' => $_POST['couponcode'],
                                 'couponamt' => $_POST['couponamt'],
                                 'aouponamttype' => $_POST['aouponamttype'],
                                 'maxamt' => $_POST['maxamt'],
                                 'maxperuser' => $_POST['maxperuser'],
                                 'quantity' => $_POST['quantity'],
                                 'title' => $_POST['title'],
                                 'details' => $_POST['details'],
                                 'refid' => $this->refid,
                                 'refname' => $this->refname,
                                 'start_date' => $start_date,
                                 'end_date' => $end_date,
                                 'from_ip' => $this
                                 ->input
                                 ->ip_address() ,
                                 'image' => $newFileName_url,
                              )))
                              {
                                 $this->RESULT["status"] = "1";
                                 $this->RESULT["message"] = "Script run Succesfull File uploaded";
                                 $this->RESULT["data"] = array(
                                    'upload_data' => $this
                                    ->upload
                                    ->data()
                                 );
                              }
                           }
                        }
                        else
                        {
                           $this->RESULT["message"] = "Missing params..";
                        }
                        return $this
                        ->output
                        ->set_status_header(200)
                        ->set_output(json_encode($this->RESULT));
                     }
                     function fetch_coupons()
                     {
                        $res = $this
                        ->db
                        ->distinct()
                        ->select('couponcode')
                        ->get('coupons');
                        if ($res->num_rows() > 0)
                        {
                           $this->RESULT['status'] = '1';
                           $this->RESULT['message'] = 'Coupons fetch Succesfully';
                           $this->RESULT['coupons'] = $res->result();
                        }
                        else
                        {
                           $this->RESULT['message'] = 'Coupons Not found';
                        }
                        return $this
                        ->output
                        ->set_status_header(200)
                        ->set_output(json_encode($this->RESULT));
                     }
                     function add_business_owner()
                     {
                        if ($this
                        ->input
                        ->post('nameInitials') && $this
                        ->input
                        ->post('fname') && $this
                        ->input
                        ->post('lname') && $this
                        ->input
                        ->post('mobile') && strlen($this
                        ->input
                        ->post('mobile')) > 10 && $this
                        ->input
                        ->post('email') && $this
                        ->input
                        ->post('refid') && $this
                        ->input
                        ->post('refname'))
                        {
                           if ($this
                           ->db
                           ->insert('bizOwner', array(
                              'nameInitials' => $_POST['nameInitials'],
                              'fname' => $_POST['fname'],
                              'lname' => $_POST['lname'],
                              'mobile' => $_POST['mobile'],
                              'email' => $_POST['email'],
                              'refid' => $this->refid,
                              'refname' => $this->refname,
                              'from_ip' => $this
                              ->input
                              ->ip_address()
                           )))
                           {
                              $this->RESULT['status'] = '1';
                              $this->RESULT['message'] = 'Biz Owner Added succesfully!!';
                           }
                           else
                           {
                              $this->RESULT['message'] = 'Error not added!';
                           }
                        }
                        else
                        {
                           $this->RESULT['message'] = 'Owner Not found';
                        }
                        return $this
                        ->output
                        ->set_status_header(200)
                        ->set_output(json_encode($this->RESULT));
                     }
                     function add_client_biz_details()
                     {
                        if (
                           $this->input->post('bizName')
                           && $this->input->post('bizDetails')
                           && $this->input->post('bizType')
                           && $this->input->post('lat')
                           && $this->input->post('lng')
                           && $this->input->post('email')
                           && $this->input->post('mobile')
                           && strlen($this->input->post('mobile')) == 10
                           && $this->input->post('pincode')
                           && $this->input->post('city')
                           && $this->input->post('state')
                           && $this->input->post('country')
                           && $this->input->post('countrycode')
                           && $this->input->post('address')
                           && $this->input->post('landmark')
                           )
                           {
                              if ($this
                              ->db
                              ->insert(
                                 'clientBizDetails',
                                 array(
                                    'bizName' => $this
                                    ->input
                                    ->post('bizName') ,
                                    'bizDetails' => $this
                                    ->input
                                    ->post('bizDetails') ,
                                    'bizType' => $this
                                    ->input
                                    ->post('bizType') ,
                                    'refid' => $this
                                    ->refid ,
                                    'refname' => $this
                                    ->refname ,
                                    'lat' => $this
                                    ->input
                                    ->post('lat') ,
                                    'lng' => $this
                                    ->input
                                    ->post('lng') ,
                                    'email' => $this
                                    ->input
                                    ->post('email') ,
                                    'mobile' => $this
                                    ->input
                                    ->post('mobile') ,
                                    'bizOwnerId' => $this
                                    ->bizOwnerId ,
                                    'pincode' => $this
                                    ->input
                                    ->post('pincode') ,
                                    'city' => $this
                                    ->input
                                    ->post('city') ,
                                    'state' => $this
                                    ->input
                                    ->post('state') ,
                                    'country' => $this
                                    ->input
                                    ->post('country') ,
                                    'countrycode' => $this
                                    ->input
                                    ->post('countrycode') ,
                                    'address' => $this
                                    ->input
                                    ->post('address') ,
                                    'landmark' => $this
                                    ->input
                                    ->post('landmark') ,
                                    'from_ip' => $this
                                    ->input
                                    ->ip_address()
                                 )))
                                 {
                                    $this->RESULT['status'] = '1';
                                    $this->RESULT['message'] = 'Client Biz Details Added succesfully!!';
                                 }
                                 else
                                 {
                                    $this->RESULT['message'] = 'Error not added!';
                                 }
                              }
                              else
                              {
                                 $this->RESULT['message'] = 'Not found';
                              }
                              return $this
                              ->output
                              ->set_status_header(200)
                              ->set_output(json_encode($this->RESULT));
                           }
                           function insert_business_User()
                           {
                              if ($this
                              ->input
                              ->post('fname', true) && $this
                              ->input
                              ->post('lname', true) && $this
                              ->input
                              ->post('bizid', true) && $this
                              ->input
                              ->post('refid', true) && $this
                              ->input
                              ->post('refname', true) && $this
                              ->input
                              ->post('email', true) && $this
                              ->input
                              ->post('mobile', true))
                              {
                                 $res1 = $this
                                 ->db
                                 ->get_where('clientBizDetails', array(
                                    'bizid' => $_POST['bizid'],
                                    'status' => 'ACTIVE'
                                 ));
                                 if ($res1->num_rows() > 0)
                                 {
                                    $this
                                    ->db
                                    ->insert('clientBizUsers', array(
                                       'fname' => $_POST['fname'],
                                       'lname' => $_POST['lname'],
                                       'bizid' => $_POST['bizid'],
                                       'refid' => $this->refid,
                                       'refname' => $this->refname,
                                       'email' => $_POST['email'],
                                       'mobile' => $_POST['mobile']
                                    ));
                                    $this->RESULT['status'] = '1';
                                    $this->RESULT['message'] = 'Client Biz user Added succesfully!!';
                                 }
                                 else
                                 {
                                    $this->RESULT['message'] = 'not found!';
                                 }
                              }
                              else
                              {
                                 $this->RESULT['message'] = 'Error check param!';
                              }
                              return $this
                              ->output
                              ->set_status_header(200)
                              ->set_output(json_encode($this->RESULT));
                           }
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
                           function api_start_my_business(){
                              if (
                                 $this->db->insert(
                                    'bizInOutLogger',
                                    array(
                                       'bizOwnerId' => $this->bizOwnerId,
                                       'type' => 'OPEN',
                                       'refid' => $this->refid,
                                       'refname' => $this->refname,
                                       'from_ip' => $this->input->ip_address(),
                                       'lat' => $_POST['lat'],
                                       'lng' => $_POST['lng'],
                                       'bizid' => $_POST['bizid']
                                    )
                                    )
                                 ) {
                                    $this->RESULT['status'] = '1';
                                 }
                                 return $this
                                 ->output
                                 ->set_status_header(200)
                                 ->set_output(json_encode($this->RESULT));
                              }
                              function api_close_my_business(){
                                 if (
                                    $this->db->insert(
                                       'bizInOutLogger',
                                       array(
                                          'bizOwnerId' => $this->bizOwnerId,
                                          'type' => 'CLOSE',
                                          'refid' => $this->bizOwnerId,
                                          'refname' => $this->refname,
                                          'from_ip' => $this->input->ip_address(),
                                          'lat' => $_POST['lat'],
                                          'lng' => $_POST['lng'],
                                          'bizid' => $_POST['bizid']
                                       )
                                       )
                                    ) {
                                       $this->RESULT['status'] = '1';
                                    } else {
                                       $this->RESULT['message'] = 'Failed to insert record!';
                                    }
                                    return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
                                 }
                                 function biz_my_open_orders()
                                 {
                                    $result = $this->db->where(
                                       'status','ACCEPTED'
                                       )->where(
                                          'accepted_by_id', $_POST['bizid']
                                          )->get(
                                             'customer_orderItem'
                                          );
                                          if (
                                             $result->num_rows() > 0
                                          ) {
                                             $this->RESULT["status"]  = "1";
                                             $this->RESULT["message"] = "Script run succesfully";
                                             $this->RESULT["data"] = $result->result();
                                          }else {
                                             $this->RESULT["message"] = "Not found any records";
                                          }
                                          return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
                                       }
                                       function biz_set_order_item_prepared()
                                       {
                                          if (
                                             $this->input->post('custorderid',TRUE)
                                             && $this->input->post('orderitemid',TRUE)
                                             // && $this->input->post('bizid',TRUE)
                                          ){
                                             $result = $this->db->get_where(
                                                'customer_orderItem',
                                                array(
                                                   'custorderid' => $_POST['custorderid'],
                                                   'orderitemid'=> $_POST['orderitemid']
                                                )
                                             );
                                             if (
                                                $result->num_rows() > 0
                                             ) {
                                                $this->db->where(
                                                   'custorderid',$_POST['custorderid']
                                                   )->where(
                                                      'orderitemid',$_POST['orderitemid']
                                                      )->update(
                                                         'customer_orderItem',
                                                         array(
                                                            'status' => 'PREPARED'
                                                         )
                                                      );
                                                      $this->RESULT["status"]  = "1";
                                                      $this->RESULT["message"] = "Your Order ITEM is Succesfully Picked";
                                                   }else {
                                                      $this->RESULT["message"] = "Your Order is already Picked/Delivererd";
                                                   }
                                                }else {
                                                   $this->RESULT["message"] = "Failed check params";
                                                }
                                                return $this->output->set_status_header(200)->set_output(json_encode($this->RESULT));
                                             }
                                          }
