<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/Area.php';
 
$database = new Database();
$db = $database->getConnection();
 
$area = new Area($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$area->name = $data->name;
 
// create the product
if($area->create()){
    echo '{';
        echo '"message": "area was created."';
    echo '}';
}
 
// if unable to create the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to create area."';
    echo '}';
}
?>