<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/Respuesta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
$respuesta = new Respuesta($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$respuesta->id_pregunta = $data->id_pregunta;
$respuesta->id_encuesta = $data->id_encuesta;
$respuesta->id_respuesta = $data->id_respuesta;
 
// delete the product
if($respuesta->delete()){
    echo '{';
        echo '"message": "respuesta was deleted."';
    echo '}';
}
 
// if unable to delete the product
else{
    echo '{';
        echo '"message": "Unable to delete object."';
    echo '}';
}
?>