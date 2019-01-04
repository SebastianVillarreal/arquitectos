<?php 
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: access");
	header("Access-Control-Allow-Methods: GET");
	header("Access-Control-Allow-Credentials: true");
	header('Content-Type: application/json');
	 session_name("sysOrigen");
  	session_start();
  	$id_contrato = $_SESSION['id_contrato'];
  	  $perfil = $_SESSION['usr_groupid'];
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/lista_contratos.php';
	$json = json_decode(file_get_contents('php://input'));
	$tipo = $json->nombre;

	// date_default_timezone_set('America/Monterrey');
 //  	$fecha = date('Y-m-d');
 //  	$hora = date('H:i:s');
	// // get database connection
	$database = new Database();
	$db = $database->getConnection();
	 
	// // prepare product object
	 $lista = new lista_contrato($db);
	 $lista->nombre = $tipo;
	$stmt = $lista->create();
	echo "$stmt";
 // ?>