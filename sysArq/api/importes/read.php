<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/importes.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
$data = json_decode(file_get_contents("php://input"));
$id_contrato = $data->id_contrato;

// initialize object
$importes = new importes($db);

$importes->id_contrato = $id_contrato;
$st = $importes->read();
$row = $st->fetch(PDO::FETCH_NUM);
$array = array(
    $row[0],
    $row[1],
    $row[2],
    $row[3],
    $row[4],
    $row[5],
    $row[6],
    $row[7],
    $row[8],
    $row[9],
    $row[10]
);
echo json_encode($array);


?>