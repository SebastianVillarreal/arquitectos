<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Area.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$area = new Area($db);
 
// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of product to be edited
$area->id_area = $data->id_area;
 
// set product property values
$area->name = $data->name;
$area->estatus = $data->estatus;
 
// update the product
if($area->update()){
    echo '{';
        echo '"message": "area was updated."';
    echo '}';
}
 
// if unable to update the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to update area."';
    echo '}';
}
?>