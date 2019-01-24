<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
	 session_name("sysOrigen");
  	session_start();
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/generador.php';
	date_default_timezone_set('America/Monterrey');
  $fecha = date('Y-m-d');
  $hora = date('H:i:s');
$database = new Database();
$db = $database->getConnection();
 
$generador = new generador($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
$id_contrato = $_SESSION['id_contrato'];
echo "$id_contrato";
$id_renglon = $_SESSION['id_renglon'];
$id_area = $data->id_cuarto;
$largo = $data->largo;
$ancho = $data->ancho;
$total = $data->total;

$generador->id_contrato = $id_contrato;
$generador->id_renglon = $id_renglon;
$generador->id_area = $id_area;
$generador->largo = $largo;
$generador->ancho = $ancho;
$generador->total = $total;
$generador->usuario = $usuario;
if ($generador->create()) {
	echo "insertado";
}else{
	echo "no insertado";
}

?>