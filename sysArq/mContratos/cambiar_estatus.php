<?php 
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: access");
	header("Access-Control-Allow-Methods: GET");
	header("Access-Control-Allow-Credentials: true");
	header('Content-Type: application/json');
	 session_name("sysOrigen");
  	session_start();
  	$id_contrato = $_SESSION['id_contrato'];
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/contrato.php';
	$json = json_decode(file_get_contents('php://input'));
	$tipo = $json->valor;
	echo "$tipo";
	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	// get database connection
	$database = new Database();
	$db = $database->getConnection();
	 
	// prepare product object
	$contrato = new contrato($db);
	$contrato->id_contrato = $id_contrato;
	$contrato->tipo = $tipo;
	$contrato->fecha = $fecha;
	$stmt = $contrato->update();
	echo "$stmt";
 ?>