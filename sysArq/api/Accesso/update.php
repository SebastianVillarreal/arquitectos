<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Accesso.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$accesso = new Accesso($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
    $accesso->id_accesso = $data->id_accesso;
    $accesso->id_usuario = $data->id_usuario;
    $accesso->id_usuarioto = $data->id_usuarioto;
    $accesso->id_encuesta = $data->id_encuesta;
    $accesso->id_estatus = $data->id_estatus;

$string = $accesso->id_accesso.$accesso->id_usuario.$accesso->id_usuarioto.$accesso->id_encuesta.$accesso->id_estatus;
//echo $string;
  
// update the product
if($accesso->update()){
    echo '{';
        echo '"message": "status was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update status."';
    echo '}';
}
?>