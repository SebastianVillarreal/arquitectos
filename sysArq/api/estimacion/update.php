<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/estimacion.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$estimacion = new estimacion($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$estimacion->id = $data->id_estimacion;
$estimacion->id_renglon = $data->id_renglon;
$estimacion->cantidad = $data->cantidad_nueva;
 
// set product property values
 $st = $estimacion->update();
 $row = $st->fetch(PDO::FETCH_NUM);
 echo "$row[0]";
?>