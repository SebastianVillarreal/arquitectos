<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Respuesta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$respuesta = new Respuesta($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$respuesta->id_respuesta = $data->id_respuesta;
 
// set product property values
$respuesta->id_pregunta = $data->id_pregunta;
$respuesta->id_encuesta = $data->id_encuesta;
$respuesta->id_tipo = $data->id_tipo;
$respuesta->encuesta_name = $data->encuesta_name;
$respuesta->pregunta_desc = $data->pregunta_desc;
$respuesta->respuesta_desc = $data->respuesta_desc;
 
// update the product
if($respuesta->update()){
    echo '{';
        echo '"message": "respuesta was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update respuesta."';
    echo '}';
}
?>