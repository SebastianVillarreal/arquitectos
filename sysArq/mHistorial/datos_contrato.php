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

	// get database connection
	$database = new Database();
	$db = $database->getConnection();
	 
	// prepare product object
	$contrato = new contrato($db);
	$contrato->id_contrato = $id_contrato;
	$stmt = $contrato->readOne();
	$row = $stmt->fetch(PDO::FETCH_NUM);
	$row = json_encode($row);
	echo "$row";


 ?>