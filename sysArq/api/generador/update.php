<?php
// required headers
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

// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$generador = new generador($db);
 
// get id of product to be edited
//$data = json_decode(file_get_contents("php://input"));
$data = filter_input_array(INPUT_POST);

 $ancho = $data->ancho;
// set ID property of product to be edited
$generador->id = $data['id'];
$generador->id_renglon = $id_renglon;
$generador->ancho = $data['ancho'];
$generador->largo = $data['largo'];

 // $stmt = $detalle_contrato->update();
 // $row = $stmt->fetch(PDO::FETCH_NUM);
 // echo "$row";
 $s = $generador->update();
 print_r( $s);



?>