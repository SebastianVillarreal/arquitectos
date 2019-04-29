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
include_once '../objects/contratistas.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$contratista = new Contratistas($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
  	$data = json_decode(file_get_contents("php://input"));
$usr = $_SESSION['usr_id'];

$usuario_m = $usr;
$usr_registro = $usr;

if ($perfil == 1) {
	$tipo_rayas = 1;
}else{
	$tipo_rayas = 2;
}

 
// set product property values
$contratista->nombre = $data->nombre;
$contratista->ap_paterno = $data->ap_paterno;
$contratista->ap_materno = $data->ap_materno;
$contratista->codigo = $data->codigo;
$contratista->razon_social = $data->razon;
$contratista->persona_moral = $data->p_moral;
$contratista->usr = $usr;

 
// create the product
if($contratista->create()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>