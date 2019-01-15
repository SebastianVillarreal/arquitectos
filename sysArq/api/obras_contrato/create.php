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
include_once '../objects/obras_contrato.php';
session_name("sysOrigen"); 
session_start(); 
 
$database = new Database();
$db = $database->getConnection();
 
$obras_contrato = new obras_contrato($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
// get posted data
	$marca = $_POST['marca'];
	$c = count($marca);
	$pIdProyecto = $_POST['proyecto'];
	echo "$pIdProyecto";
	$pIdContrato = $_POST['contrato'];
	$usr = $_SESSION['usr_login'];
// $data = json_decode(file_get_contents("php://input"));
 
// set product property values

 
for ($i=0; $i < $c; $i++) { 
	// set product property values
	$obras_contrato->obra = $pIdProyecto;
	$obras_contrato->contrato_lista = $pIdContrato[$i];

	 
	// create the product
	if($obras_contrato->create()){
		echo "Insertado";
	}
	 
	// if unable to create the product, tell the user
	else{
		echo "No insertado";
	}
}
?>