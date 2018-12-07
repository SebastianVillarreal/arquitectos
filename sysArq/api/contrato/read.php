<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Encuesta.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$encuesta = new Encuesta($db);
 

$encuesta->id_encuesta = isset($_GET['ide']) ? $_GET['ide'] : die();
$encuesta->id_pregunta = isset($_GET['idp']) ? $_GET['idp'] : die();

// query products
$stmt = $encuesta->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $encuesta_arr=array();
    $encuesta_arr["records"]=array();
 
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
            "Nombre" => $Nombre,
            "Estatus" => $Estatus,
            "IDAreas" => $IDArea,
            "IDUsuario" => $IDUsuario,
            "Fecha_Alta" => $Fecha_Alta,
            "Fecha_Limite" => $Fecha_Limite
        );
 
        array_push($encuesta_arr["records"], $encuesta_item);
    }
 
    echo json_encode($encuesta_arr);
}
 
else{
    echo json_encode(
        array("message" => "No encuestas found.")
    );
}
?>