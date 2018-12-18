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
include_once '../objects/importes.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$importes = new importes($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
$usr = $_SESSION['usr_login'];
$id_contrato = $_SESSION['id_contrato'];
$p_anticipo = $_POST['p_anticipo'];
$p_iva = $_POST['p_iva'];
$p_pendiente = $_POST['m_pendiente'];
$m_anticipo = $_POST['m_anticipo'];
$m_iva = $_POST['m_iva'];
$m_fondo = $_POST['m_fondo'];
$p_fondo = $_POST['p_fondo'];
$m_pendiente = $_POST['m_pendiente'];
//$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$importes->id_contrato = $id_contrato;
$importes->p_anticipo = $p_anticipo;
$importes->p_iva = $p_iva;
$importes->p_fondo = $p_fondo;
$importes->p_pendiente = $p_pendiente;
$importes->m_anticipo = $m_anticipo;
$importes->m_iva = $m_iva;
$importes->m_fondo = $m_fondo;
$importes->m_pendiente = $m_pendiente;
 
// create the product
if($importes->create()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>