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
include_once '../objects/proyectos.php';
//include '../../global_seguridad/verificar_sesion.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$proyecto= new proyectos($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
$usr = $_SESSION["usr_id"];
$fecha = $_POST['fecha'];
$nombre = $_POST['nombre'];

//$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$proyecto->nombre = $nombre;
$proyecto->fecha = $fecha;
$proyecto->usuario = $usr;
 
// create the product
if($proyecto->create_date()){
	echo "1";
}
 
// if unable to create the product, tell the user
else{
	echo "0";
}
?>