<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Respuesta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$respuesta = new Respuesta($db);
 
// set ID property of product to be edited
$respuesta->id_encuesta = isset($_GET['ide']) ? $_GET['ide'] : die();
$respuesta->id_pregunta = isset($_GET['idp']) ? $_GET['idp'] : die();
$respuesta->id_respuesta = isset($_GET['idr']) ? $_GET['idr'] : die();


// read the details of product to be edited
$respuesta->readOne();
 
// create array
$respuesta_arr = array(
    "IDEncuesta" =>  $respuesta->id_encuesta,
    "Encuesta" => $respuesta->encuesta_name,
    "IDPregunta" => $respuesta->id_pregunta,
    "Pregunta" => $respuesta->pregunta_desc,
    "IDRespuesta" => $respuesta->id_respuesta,
    "Respuesta" => $respuesta->respuesta_desc,
    "IDTipo" => $respuesta->id_tipo
 
);
 
// make it json format
print_r(json_encode($respuesta_arr));
?>