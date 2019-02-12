<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/estimacion.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
$id_estimacion = 1;

// initialize object
$estimacion = new estimacion($db);
 $estimacion->id = $id_estimacion;
// query products
$stmt = $estimacion->read_one();

$row = $stmt->fetch(PDO::FETCH_NUM);
$array = array(
    $row[0],
    $row[1],
    $row[2],
    $row[3],
    $row[4],
    $row[5],
    $row[6]
);

echo json_encode($array);


?>