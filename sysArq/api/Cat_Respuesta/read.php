<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Cat_Respuesta.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$cat_respuesta = new Cat_Respuesta($db);
 
// query products
$stmt = $cat_respuesta->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $cat_respuesta_arr=array();
    $cat_respuesta_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $cat_respuesta_item=array(
            "IDRespuesta" => $IDRespuesta,
            "Respuesta" => $Respuesta
            
        );
 
        array_push($cat_respuesta_arr["records"], $cat_respuesta_item);
    }
 
    echo json_encode($cat_respuesta_arr);
}
 
else{
    echo json_encode(
        array("message" => "No respuesta found.")
    );
}
?>