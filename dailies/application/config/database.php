<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = ENVIRONMENT;
$query_builder = TRUE;

$db[ENVIRONMENT] = array(
	'dsn'	=> '',
	'hostname' => 'localhost',
	'username' => 'dailies_dev_db_user',
	'password' => 'ZILr5sa!f',
	'database' => 'dailiess',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
