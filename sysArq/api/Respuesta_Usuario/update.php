<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Respuesta_Usuario.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$respuesta_usuario = new Respuesta_usuario($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$respuesta_usuario->id_respuesta_usuario = $data->id_respuesta_usuario;
 
// set product property values
$respuesta_usuario->id_pregunta = $data->id_pregunta;
$respuesta_usuario->id_encuesta = $data->id_encuesta;
$respuesta_usuario->id_respuesta = $data->id_respuesta;
$respuesta_usuario->id_usuario = $data->id_usuario;
$respuesta_usuario->respuesta_usuario_desc = $data->respuesta_usuario_desc;
 
// update the product
if($respuesta_usuario->update()){
    echo '{';
        echo '"message": "respuesta usuario was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update respuesta usuario."';
    echo '}';
}
?>