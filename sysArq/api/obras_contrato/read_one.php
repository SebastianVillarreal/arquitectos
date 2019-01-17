<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Encuesta.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$encuesta = new Encuesta($db);
 
// set ID property of product to be edited
$encuesta->id_usuario = isset($_POST['idu']) ? $_POST['idu'] : die();
 
// read the details of product to be edited
$stmt = $encuesta->readOne();

$encuesta_arr=array();
$encuesta_arr["records"]=array();

 while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
 extract($row);
// create array
$encuesta_item = array(
    "IDEncuesta" =>  $IDEncuesta,
    "Nombre" => $Nombre,
    "Estatus" => $Estatus,
    "Fecha_Alta" => $Fecha_Alta,
    "Fecha_Limite" => $Fecha_Limite,
    "IDUsuario" => $IDUsuario,
    "IDUsuarioTo" => $IDUsuarioTo,
    "Para" => $Para,
    "IDAccesso" =>$IDAccesso
 
);
     
array_push($encuesta_arr["records"], $encuesta_item);
     
 }
 
// make it json format
print_r(json_encode($encuesta_arr));
?>