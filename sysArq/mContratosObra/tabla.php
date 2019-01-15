<?php 
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
 
	// include database and object files
	include_once '../config/database.php';
	include_once '../objects/obras_contrato.php';

	$data = json_decode(file_get_contents("php://input"));
	$pObra = $data->obra;
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$obras_contrato = new obras_contrato($db);
	 
	$obras_contrato->obra = $pObra;

	// query products
	$stmt = $obras_contrato->read();
	 $row = $stmt->fetch(PDO::FETCH_NUM);
	echo json_encode($row);
 ?>