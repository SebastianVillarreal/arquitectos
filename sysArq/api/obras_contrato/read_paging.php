<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/Encuesta.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$encuesta = new Encuesta($db);
 
// query products
$stmt = $encuesta->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $encuesta_arr=array();
    $encuesta_arr["records"]=array();
    $encuesta_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $encuesta_item=array(
           "IDEncuesta" => $IDEncuesta,
            "Nombre" => $nOMBRE,
            "Estatus" => $Estatus,
            "IDAreas" => $IDArea,
            "IDUsuario" => $IDUsuario,
            "Fecha_Alta" => $Fecha_Alta,
            "Fecha_Limite" => $Fecha_Limite
        );
 
        array_push($encuesta_arr["records"], $encuesta_item);
    }
 
 
    // include paging
    $total_rows=$encuesta->count();
    $page_url="{$home_url}Encuesta/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $encuesta_arr["paging"]=$paging;
 
    echo json_encode($encuesta_arr);
}
 
else{
    echo json_encode(
        array("message" => "No encuestas found.")
    );
}
?>