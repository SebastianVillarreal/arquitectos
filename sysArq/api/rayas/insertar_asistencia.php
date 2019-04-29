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
	include_once '../objects/rayas.php';
	//include '../../global_seguridad/verificar_sesion.php';
	session_name("sysOrigen"); 
	session_start();
	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	$database = new Database();
	$db = $database->getConnection();
	$rayas = new rayas($db);

	$marca = $_POST['cal'];

	$contratista = $_POST['contratista'];
	$c = count($marca);
	$obra = $_POST['obra'];
	//$obra = 1;
		// $rayas->obra=$obra;
		// $rayas->contratista = $contratista[$i];
		// $rayas->asiste = $marca[$i];
		// $st = $rayas->insertar_asistencia();
	for ($i=0; $i < $c; $i++) { 

		//echo $i;
		$rayas->obra=$obra[$i];
		$rayas->contratista = $contratista[$i];
		$rayas->asiste = $marca[$i];
		$rayas->fecha_i =$fecha;
		$st = $rayas->insertar_asistencia();
		

	}
	echo "1";




 ?>