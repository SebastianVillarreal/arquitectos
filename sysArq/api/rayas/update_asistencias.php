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
include_once '../objects/rayas.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$asistencia = new rayas($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
  	$asis = $_POST['asistencia'];
  	$obra  =$_POST['obra'];
  	$id = $_POST['id'];
$data = json_decode(file_get_contents("php://input"));
 
// set product property values

  	$asistencia->id_asistencia = $data->id_asisitencia;
  	$asistencia->asiste = $data->asiste;
  	$asistencia->obra = $data->id_obra;
  	print_r($asistencia);
 
// create the product
if($asistencia->update_asistencia()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>