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
include_once '../objects/Encuesta.php';
 
$database = new Database();
$db = $database->getConnection();
 
$encuesta = new Encuesta($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$encuesta->name = $data->name;
$encuesta->estatus = $data->estatus;
$encuesta->fecha_limite = $data->fecha_limite;
$encuesta->id_area = $data->id_area;
$encuesta->id_usuario = $data->id_usuario;
 
// create the product
if($encuesta->create()){
    echo '{';
        echo '"message": "Encuesta was created."';
    echo '}';
}
 
// if unable to create the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to create encuesta."';
    echo '}';
}
?>