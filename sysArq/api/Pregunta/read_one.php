<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Pregunta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$pregunta = new Pregunta($db);
 
// set ID property of product to be edited
$pregunta->id_encuesta = isset($_POST['ide']) ? $_POST['ide'] : die();
$pregunta->id_pregunta = isset($_POST['idp']) ? $_POST['idp'] : die();


// read the details of product to be edited
$pregunta->readOne();
 
// create array
$pregunta_arr = array(
    "IDEncuesta" =>  $pregunta->id_encuesta,
    "Encuesta" => $pregunta->encuesta_name,
    "IDPregunta" => $pregunta->id_pregunta,
    "Pregunta" => $pregunta->pregunta_desc
 
);
 
// make it json format
print_r(json_encode($pregunta_arr));
?>