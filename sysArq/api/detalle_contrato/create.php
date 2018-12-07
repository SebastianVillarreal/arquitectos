<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/detalle_contrato.php';
	date_default_timezone_set('America/Monterrey');
  $fecha = date('Y-m-d');
  $hora = date('H:i:s');
$database = new Database();
$db = $database->getConnection();
 
$detalle_contrato = new detalle_cont($db);
 
// get posted data
//$data = json_decode(file_get_contents("php://input"));
$pId_contrato = $_POST['id_contrato'];
$pConcepto = $_POST['marca'];
$pTipoConcepto = $_POST['tipo_concepto'];
$pClaveConcepto = $_POST['concepto'];
$marca = $_POST['marca'];
$c = count($marca);


for ($i=0; $i < $c; $i++) { 
	// set product property values
	$detalle_contrato->id_contrato = $pId_contrato;
	$detalle_contrato->concepto = $pConcepto[$i];
	$detalle_contrato->tipo_concepto = $pTipoConcepto[$i];
	$detalle_contrato->clave_concepto = $pClaveConcepto[$i];
	$detalle_contrato->fecha = $fecha;

	 
	// create the product
	if($detalle_contrato->create()){
		echo "Insertado";
	}
	 
	// if unable to create the product, tell the user
	else{
		echo "No insertado";
	}
}


 

?>