<?php 
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");	
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
	// include database and object files
	include_once '../config/database.php';
	include_once '../objects/generador.php';
 	session_name("sysOrigen"); 
	session_start();
	$id_renglon = $_SESSION['id_renglon'];
	$id_contrato = $_SESSION['id_contrato'];
	//variables post
	$data = json_decode(file_get_contents("php://input"));
	$total = $data->total;
	$id_area = $data->id_cuarto;
	$largo = $data->largo;
	$ancho = $data->ancho;
	// get database connection
	$database = new Database();
	$db = $database->getConnection();

	$generador = new generador($db);
	$generador->total = $total;
	$generador->id_renglon = $id_renglon;
	$generador->id_contrato = $id_contrato;
	$generador->id_area = $id_area;
	$generador->largo = $largo;
	$generador->ancho = $ancho;
	$generador->total = $total;
	$generador->usuario = $usuario;

	$stmt = $generador->validar_cantidad();
	$row = $stmt->fetch(PDO::FETCH_NUM);
	echo "$row[0]";

 ?>