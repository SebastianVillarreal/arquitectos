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
include_once '../objects/contrato.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysAdMision"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$contrato = new contrato($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
$usr = $_SESSION['usr_login'];
$id_proyecto = $_POST['proyecto'];
$contratista = $_POST['contratista'];
$tipo = $_POST['tipo_c'];
$residente = $_POST['residente'];
$descripcion = $_POST['descripcion'];
$usuario_m = $usr;
$usr_registro = $usr;
//$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$contrato->nombre = $id_proyecto;
$contrato->contratista = $contratista;
$contrato->fecha = $fecha;
$contrato->tipo = $tipo;
$contrato->residente = $residente;
$contrato->Usuario_m = $usuario_m;
$contrato->User_r = $usr_registro;
$contrato->descripcion = $descripcion;
 
// create the product
if($contrato->create()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>