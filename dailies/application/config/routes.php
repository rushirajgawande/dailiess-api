<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['send-otp'] = 'V1/SignIn/api_sendOtp';
$route['verify-otp'] = 'V1/SignIn/api_verifyOtp';

// Check BUsiness OPEN/CLOSE
$route['biz-open'] = 'V1/Business/api_start_my_business';
$route['biz-close'] = 'V1/Business/api_close_my_business';

$route['biz-details'] = 'V1/Business/api_get_business_list_user';
$route['update-biz-owner'] = 'V1/Business/api_update_biz_owner';
$route['biz-update-details'] = 'V1/Business/api_update_biz_owner_biz_detail';
$route['insert-biz-InOutLogger'] = 'V1/Business/api_insert_bizinoutlogger';
$route['insert-biz-staff'] = 'V1/Business/insert_business_working_staff';
$route['status-biz-staff-enable'] = 'V1/Business/api_enable_business_staff';
$route['upload-biz-attribute'] = 'V1/Business/api_upload_attribute';
$route['status-biz-staff-disable'] = 'V1/Business/api_disable_business_staff';
$route['status-biz-staff-block'] = 'V1/Business/api_block_business_staff';
$route['get-all-staff'] = 'V1/Business/api_get_biz_staff';
$route['kyc-status'] = 'V1/Business/api_kyc';
$route['check-biz-open'] = 'V1/Business/biz_open_or_close';
$route['biz-home'] = 'V1/Business/get_biz_details';



$route['get-all-items'] = 'V1/BusinessItems/api_get_biz_items';
$route['biz-get-all-items'] = 'V1/BusinessItems/get_all_available_items';
$route['insert-biz-items'] = 'V1/BusinessItems/insert_biz_items';
$route['update-biz-items'] = 'V1/BusinessItems/update_biz_items';
// $route['delete-biz-items'] = 'V1/BusinessItems/remove_biz_items';
$route['remove-biz-items'] = 'V1/BusinessItems/remove_biz_items';


$route['update-user-role'] = 'V1/Users/api_update_user_roles';
$route['get-all-user-role'] = 'V1/Users/api_get_all_user_roles';
$route['delete-curr-user-role'] = 'V1/Users/api_delete_curr_user_role';

$route['biz-place-new-order'] = 'V1/Orders/create_my_new_order';
$route['biz-fetch-orders'] = 'V1/Orders/fetch_biz_orders';
$route['biz-fetch-order-details'] = 'V1/Orders/fetch_biz_orders_details';


$route['cust-send-otp'] = 'V1/Customer_Signin/customer_send_otp';
$route['cust-verify-otp'] = 'V1/Customer_Signin/customer_verify_otp';

$route['cust-add-address'] = 'V1/Customer/customer_add_address';
$route['customer-create-order'] = 'V1/Customer_Orders/customer_create_order';
$route['customer-display-order'] = 'V1/Customer_Orders/display_orders';
$route['customer-order-status'] = 'V1/Customer_Orders/customer_orders_status';

$route['cancel-order'] = 'V1/Customer_Orders/cancel_order';
$route['biz-view-open-order-items'] = 'V1/Customer_Orders/fetch_open_orders';


$route['order-ready-to-deliver'] = 'V1/Customer_Orders/order_ready_to_deliver';
$route['order-out-of-delivery'] = 'V1/Customer_Orders/order_out_for_delivery';
$route['order-delivered'] = 'V1/Customer_Orders/order_delivered';
$route['pick-this-customer-order'] = 'V1/Customer_Orders/pickup_api';
$route['pick-this-customer-order-item'] = 'V1/Customer_Orders/pick_this_customer_order_item';
// $route['pick-this-customer-order-item'] = 'V1/Customer_Orders/pick_this__detailscustomer_order_item';
$route['get-all-previous-orders'] = 'V1/Customer_Orders/get_all_previous_orders';
$route['offline-payment-add'] = 'V1/Payments/offline_payment_add';


//13 march
$route['cust-update-address'] = 'V1/Customer/update_address';
$route['cust-remove-address'] = 'V1/Customer/remove_address';
$route['reviews-and-rating'] = 'V1/Customer/reviews_and_rating';
$route['cust-fetch-address'] = 'V1/Customer/fetch_all_ACTIVE_address';
$route['add-coupon'] = 'V1/Business/add_coupon';
$route['fetch-all-coupons'] = 'V1/Business/fetch_coupons';
$route['add-wallet-trx'] = 'V1/Customer/add_wallet_transaction';
$route['fetch-wallet-trx'] = 'V1/Customer/fetch_my_transaction';
//48 till now
// $route['add-business-owner'] = 'V1/Business/add_business_owner';
$route['add-clientBizDetails'] = 'V1/Business/add_client_biz_details';
$route['update-customer-profile'] = 'V1/Customer/update_customer_detail';
$route['get-customer-profile'] = 'V1/Customer/get_customer_detail';
// $route['insert-biz-User'] = 'V1/Business/insert_business_User';

//16 march
$route['get-biz-list'] = 'V1/CoreBusiness/get_biz_list';
$route['biz-my-open-orders'] = 'V1/Business/biz_my_open_orders';
$route['biz-my-open-orders'] = 'V1/Business/biz_my_open_orders';
$route['biz-set-order-item-prepared'] = 'V1/Business/biz_set_order_item_prepared';
$route['cust-order-invoice'] = 'V1/Customer_Orders/customer_order_invoice';

//delivery Exec
$route['deliv-send-otp'] = 'V1/Delivery_Exec_SignIn/deliv_exec_send_otp';
$route['deliv-verify-otp'] = 'V1/Delivery_Exec_SignIn/deliv_exec_verify_otp';

$route['deliv-exec-update-details'] = 'V1/Delivery_Exec/update_deliv_exec';
$route['deliv-add-aadharcard'] = 'V1/Delivery_Exec/deliv_add_aadharcard';
$route['deliv-add-pancard'] = 'V1/Delivery_Exec/deliv_add_pancard';
$route['deliv-add-log-location'] = 'V1/Delivery_Exec/deliv_add_log_location';
$route['deliv-pick-order-item'] = 'V1/Delivery_Exec/deliv_pick_order_item';
$route['deliv-pick-order'] = 'V1/Delivery_Exec/deliv_pick_order';
$route['deliv-set-delivered'] = 'V1/Delivery_Exec/deliv_set_delivered';
$route['deliv-set-refund'] = 'V1/Delivery_Exec/deliv_set_refund';
$route['deliv-set-return'] = 'V1/Delivery_Exec/deliv_set_return';

$route['like-a-product'] = 'V1/Customer_Orders/like_a_product';
$route['get-product-categories'] = 'V1/Customer/get_product_categories';
$route['seach-product-by-category'] = 'V1/Customer/search_product_by_categories';
$route['search-product'] = 'V1/Customer/search_product';


$route['cust-my-cart'] = 'V1/Customer/cust_my_cart';
$route['view-my-cart'] = 'V1/Customer/view_my_cart';
