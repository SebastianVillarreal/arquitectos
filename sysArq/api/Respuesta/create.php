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
include_once '../objects/Respuesta.php';
 
$database = new Database();
$db = $database->getConnection();
 
$respuesta = new Respuesta($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$respuesta->id_encuesta = $data->id_encuesta;
$respuesta->id_pregunta = $data->id_pregunta;
$respuesta->id_tipo = $data->id_tipo;
$respuesta->respuesta_desc = $data->respuesta_desc;
 
// create the product
if($respuesta->create()){
    echo '{';
        echo '"message": "respuesta was created."';
    echo '}';
}
 
// if unable to create the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to create respuesta."';
    echo '}';
}
?>