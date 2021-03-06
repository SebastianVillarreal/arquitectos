<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/Pregunta.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$pregunta = new Pregunta($db);
 
// query products
$stmt = $pregunta->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $pregunta_arr=array();
    $pregunta_arr["records"]=array();
    $pregunta_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $pregunta_item=array(
            "IDEncuesta" => $IDEncuesta,
            "Encuesta" => $Encuesta,
            "IDPregunta" => $IDPregunta,
            "Pregunta" => $Pregunta
        );
 
        array_push($pregunta_arr["records"], $pregunta_item);
    }
 
 
    // include paging
    $total_rows=$encuesta->count();
    $page_url="{$home_url}Pregunta/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $pregunta_arr["paging"]=$paging;
 
    echo json_encode($pregunta_arr);
}
 
else{
    echo json_encode(
        array("message" => "No preguntas found.")
    );
}
?>