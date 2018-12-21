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
include_once '../objects/concepto.php';
	date_default_timezone_set('America/Monterrey');
  $fecha = date('Y-m-d');
  $hora = date('H:i:s');
$database = new Database();
$db = $database->getConnection();
 
$concepto = new concepto($db);
 
// get posted data
//$data = json_decode(file_get_contents("php://input"));
$pClave = $_POST['clave'];
$pDescripcion = $_POST['descripcion'];
$pUnidad = $_POST['unidad'];
$pCantidad = $_POST['cantidad'];
$pCosto_max_sub = $_POST['costo_max_sub'];
$pCosto_max_des = $_POST['costo_max_des'];
$pFamilia = $_POST['familia'];
$pProyecto = $_POST['proyecto'];
$pGenerador = $_POST['generador'];

	$concepto->id_prpyecto = $pProyecto;
	$concepto->clave = $pClave;
	$concepto->descripcion = $pDescripcion;
	$concepto->unidad = $pUnidad;
	$concepto->cantidad_original = $pCantidad;
	$concepto->costo_maximo_subcontrato = $pCosto_max_sub;
	$concepto->costo_maximo_destajo = $pCosto_max_des;
	$concepto->id_clave = $pFamilia;
	$concepto->generador = $pGenerador;

	 
	// create the product
	if($concepto->create()){
		echo "1";
	}
	 
	// if unable to create the product, tell the user
	else{
		echo "2";
	}
?>