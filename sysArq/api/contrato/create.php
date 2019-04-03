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
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$contrato = new contrato($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
$usr = $_SESSION['usr_login'];
$perfil = $_SESSION['usr_groupid'];
$id_proyecto = $_POST['proyecto'];
$contratista = $_POST['contratista'];
$tipo = $_POST['tipo_c'];
$residente = $_POST['residente'];
$descripcion = $_POST['descripcion'];
$folio_erp = $_POST['folio_erp'];
$usuario_m = $usr;
$usr_registro = $usr;

if ($perfil == 1) {
	$tipo_rayas = 1;
}else{
	$tipo_rayas = 2;
}
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
$contrato->tipo_rayas = $tipo_rayas;
$contrato->folio_erp = $folio_erp;
 
// create the product
if($contrato->create()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>