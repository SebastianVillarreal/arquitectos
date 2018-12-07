<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/Respuesta_Usuario.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$respuesta_usuario = new Respuesta_Usuario($db);
 
// query products
$stmt = $respuesta_usuario->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $respuesta_usuario_arr=array();
    $respuesta_usuario_arr["records"]=array();
    $respuesta_usuario_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $respuesta_usuario_item=array(
            "IDEncuesta" => $IDEncuesta,
            "Encuesta" => $Encuesta,
            "IDPregunta" => $IDPregunta,
            "Pregunta" => $Pregunta,            
            "IDRespuesta" => $IDRespuesta,
            "Respuesta" => $Respuesta,
            "IDRespuestaUsuario" => $IDRespuestaUsuario,            
            "RespuestaUsuario" => $RespuestaUsuario,
            "IDUsuario" => $IDUsuario
        );
 
        array_push($respuesta_usuario_arr["records"], $respuesta_usuario_item);
    }
 
 
    // include paging
    $total_rows=$respuesta_usuario->count();
    $page_url="{$home_url}Respuesta_Usuario/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $respuesta_usuario_arr["paging"]=$paging;
 
    echo json_encode($respuesta_usuario_arr);
}
 
else{
    echo json_encode(
        array("message" => "No respuestas usuario found.")
    );
}
?>