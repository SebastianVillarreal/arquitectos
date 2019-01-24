<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/detalle_contrato.php';
 	session_name("sysOrigen"); 
	session_start();
	$id_contrato = $_SESSION['id_contrato'];
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$detalle_contrato = new detalle_cont($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));

 
// set ID property of product to be edited
$detalle_contrato->id_contrato = $id_contrato;
$detalle_contrato->tipo_concepto = $data->tipo_concepto;
 $stmt = $detalle_contrato->actualizar_importes();

 if ($stmt == true) {
 	echo "1";
 }else{
 	echo "0";
 }
?>