<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/detalle_contrato.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$detalle_contrato = new detalle_cont($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));

 
// set ID property of product to be edited
$detalle_contrato->id_detalle = $data->id_renglon;
$detalle_contrato->costo_nuevo = $data->costo_nuevo;

 $stmt = $detalle_contrato->update_costo();
 $row = $stmt->fetch(PDO::FETCH_NUM);
 echo $row[1];




?>