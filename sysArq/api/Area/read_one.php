<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Area.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$area = new Area($db);
 
// set ID property of product to be edited
$area->id_area = isset($_GET['id']) ? $_GET['id'] : die();


// read the details of product to be edited
$area->readOne();
 
// create array
$respuesta_arr = array(
    "IDArea" =>  $area->id_area,
    "Nombre" => $area->name,
    "Estatus" => $area->estatus
 
);
 
// make it json format
print_r(json_encode($area_arr));
?>