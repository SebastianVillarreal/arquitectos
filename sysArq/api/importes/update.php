<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Encuesta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$encuesta = new Encuesta($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$encuesta->id_encuesta = $data->id_encuesta;
 
// set product property values
$encuesta->name = $data->name;
$encuesta->estatus = $data->estatus;
$encuesta->fecha_limite = $data->fecha_limite;
$encuesta->fecha_alta = $data->fecha_alta;
$encuesta->id_area = $data->id_area;
$encuesta->id_usuario = $data->id_usuario;
 
// update the product
if($encuesta->update()){
    echo '{';
        echo '"message": "encuesta was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update encuesta."';
    echo '}';
}
?>