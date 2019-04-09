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
	//$data = json_decode(file_get_contents("php://input"));
	$folio = $_POST['folio'];
	$concepto = $_POST['concepto'];
	$total = $_POST['total'];
	$id_contrato = $_POST['id_contrato'];
	$contratista = $_POST['contratista'];
	$fecha = $_POST['fecha'];
	$proyecto =$_POST['proyecto'];
 
// set product property values
$estimacion->folio_erp = $folio;
$estimacion->concepto = $concepto;
$estimacion->total = $total;
$estimacion->usuario = $user;
$estimacion->id_contratista = $contratista;
$estimacion->fecha = $fecha;
$estimacion->proyecto = $proyecto;
//create product
 if($st = $estimacion->captura()){
 	echo "1";
 }else{
 	echo "0";
 }
?>