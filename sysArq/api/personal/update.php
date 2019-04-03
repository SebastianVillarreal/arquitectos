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
include_once '../objects/personal.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$personal = new personal($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
$nombre = $_POST['nombre'];
$ap_paterno = $_POST['ap_paterno'];
$ap_materno = $_POST['ap_materno'];
$salario = $_POST['salario'];
$contratista = $_POST['contratista'];
$puesto = $_POST['puesto'];
$id = $_POST['id'];

//$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$personal->nombre = $nombre;
$personal->id_contratista = $contratista;
$personal->ap_paterno = $ap_paterno;
$personal->ap_materno = $ap_materno;
$personal->salario = $salario;
$personal->puesto = $puesto;
$personal->id_empleado = $id;
print_r($personal);
 
// create the product
if($personal->update_data()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>