<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// session_name("sysAdMision");
// session_start();

 
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/estimacion.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 $user = $_SESSION["usr_id"];
$database = new Database();
$db = $database->getConnection();
 
$estimacion = new estimacion($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
	$data = json_decode(file_get_contents("php://input"));
	$id_contrato = $data->id_contrato;
 
// set product property values
$estimacion->folio_erp = $data->folio;
$estimacion->concepto = $data->concepto;
$estimacion->total = $data->total;
$estimacion->usuario = $user;
//create product
 if($st = $estimacion->captura()){
 	echo "1";
 }else{
 	echo "0";
 }
?>