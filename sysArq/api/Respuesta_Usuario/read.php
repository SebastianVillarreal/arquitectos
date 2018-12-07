<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Respuesta_Usuario.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$respuesta_usuario = new Respuesta_Usuario($db);
 
// query products
$stmt = $respuesta_usuario->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $respuesta_usuario_arr=array();
    $respuesta_usuario_arr["records"]=array();
 
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
 
    echo json_encode($respuesta_usuario_arr);
}
 
else{
    echo json_encode(
        array("message" => "No respuesta usuario found.")
    );
}
?>