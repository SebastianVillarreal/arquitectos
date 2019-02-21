<?php 
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
	include_once '../config/database.php';
	include_once '../objects/estimacion.php';
	session_name("sysOrigen"); 
	session_start();
	$database = new Database();
	$db = $database->getConnection();
	$estimacion = new estimacion($db);
	$data = json_decode(file_get_contents("php://input"));
	$estimacion->id = $data->id_estimacion;
	$estimacion->cantidad_devolucion = $data->cantidad;

	$st = $estimacion->insertar_devolucion();
	$row = $st->fetch(PDO::FETCH_NUM);
	echo "$row[0]";
 ?>