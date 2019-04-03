<?php 
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
	include_once '../config/database.php';
	include_once '../objects/contrato.php';
	session_name("sysOrigen"); 
	session_start();
	$id_contrato = $_SESSION['id_contrato'];
	$database = new Database();
	$db = $database->getConnection();
	$contrato = new contrato($db);
	$contrato->id_contrato = $id_contrato;
	$stmt = $contrato->add_concepts();
	$row = $stmt->fetch(PDO::FETCH_NUM);
	echo "$row[0]";




 ?>