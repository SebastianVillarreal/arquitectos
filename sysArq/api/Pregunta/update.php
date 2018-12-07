<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Pregunta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$pregunta = new Pregunta($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$pregunta->id_pregunta = $data->id_pregunta;
 
// set product property values
$pregunta->id_encuesta = $data->id_encuesta;
$pregunta->encuesta_name = $data->encuesta_name;
$pregunta->pregunta_desc = $data->pregunta_desc;
 
// update the product
if($pregunta->update()){
    echo '{';
        echo '"message": "pregunta was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update pregunta."';
    echo '}';
}
?>