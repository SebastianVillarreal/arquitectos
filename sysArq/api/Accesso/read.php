<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Accesso.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$accesso = new Accesso($db);
 
// query products
$stmt = $accesso->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $accesso_arr=array();
    $accesso_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $accesso_item=array(
            "IDAcceso" => $IDAccesso,
            "IDUsuario" => $IDUsuario,
            "IDRol" => $IDRol
            
        );
 
        array_push($accesso_arr["records"], $accesso_item);
    }
 
    echo json_encode($accesso_arr);
}
 
else{
    echo json_encode(
        array("message" => "No accesso found.")
    );
}
?>