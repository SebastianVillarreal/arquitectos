<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/Pregunta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
$pregunta = new Pregunta($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$pregunta->id_pregunta = $data->id_pregunta;
$pregunta->id_encuesta = $data->id_encuesta;
 
// delete the product
if($pregunta->delete()){
    echo '{';
        echo '"message": "pregunta was deleted."';
    echo '}';
}
 
// if unable to delete the product
else{
    echo '{';
        echo '"message": "Unable to delete object."';
    echo '}';
}
?>