<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Respuesta_Usuario.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$respuesta_usuario = new Respuesta_Usuario($db);
 
// set ID property of product to be edited
$respuesta_usuario->id_encuesta = isset($_GET['ide']) ? $_GET['ide'] : die();
$respuesta_usuario->id_pregunta = isset($_GET['idp']) ? $_GET['idp'] : die();
$respuesta_usuario->id_respuesta = isset($_GET['idr']) ? $_GET['idr'] : die();
$respuesta_usuario->id_respuesta_usuario = isset($_GET['idru']) ? $_GET['idru'] : die();


// read the details of product to be edited
$respuesta_usuario->readOne();
 
// create array
$respuesta_usuario_arr = array(
    "IDRespuestaUsuario" =>  $respuesta_usuario->id_respuesta_usuario,  
    "IDEncuesta" =>  $respuesta_usuario->id_encuesta,    
    "IDPregunta" => $respuesta_usuario->id_pregunta,
    "IDRespuesta" => $respuesta_usuario->id_respuesta,
    "RespuestaUsuario" => $respuesta_usuario->respuesta_usuario_desc,
    "IDUsuario" => $respuesta_usuario->id_usuario
 
);
 
// make it json format
print_r(json_encode($respuesta_usuario_arr));
?>