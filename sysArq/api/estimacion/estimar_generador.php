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
 
	$database = new Database();
	$db = $database->getConnection();
 
	$estimacion = new estimacion($db);
 	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	// get posted data
	$data = json_decode(file_get_contents("php://input"));

	// set product property values
	$estimacion->id = $data->id_estimacion;
	$estimacion->porcentaje = $data->porcentaje;
	$estimacion->id_renglon = $data->id_renglon;
	$estimacion->valor = $data->total;
	$estimacion->id_cuarto = $data->cuarto;
	$st = $estimacion->estimar_generador();
	$row = $st->fetch(PDO::FETCH_NUM);
	echo $row[0];
?>