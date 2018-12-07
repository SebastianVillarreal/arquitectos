<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
include_once '../config/database.php';
include_once '../objects/Pregunta.php';
include_once '../objects/Cat_Respuesta.php';
include_once '../objects/Usuario.php';

// instantiate database and product object
$database = new Database();
$db = $database->getConnection();

// initialize object
$pregunta = new Pregunta($db);
$usuario = new Usuario($db);
$cat_respuesta = new Cat_Respuesta($db);
 //Parameters
$pregunta->id_encuesta = isset($_POST['ide']) ? $_POST['ide'] : die();
$usuario->id_usuario = isset($_POST['iduto']) ? $_POST['iduto'] : die();
// query products
$stmt = $pregunta->read();
$num = $stmt->rowCount();

$stmt2 = $cat_respuesta->read();

$usuario->readOne();

// check if more than 0 record found
if($num>0){

    // products array
    $title_arr=array();
    $pages_arr=array();
    $pages_arr["pages"]=array();
    $pregunta_arr=array();
    $pregunta_arr["questions"]=array();
    $Vision_row = array();
    $Relaciones_row = array();
    $Cambio_row = array();
    $Liderazgo_row = array();
    $Ejecucion_row = array();
    $Respuesta_row = array();



                    $title_arr[]=array(
                        "title" => "Encuesta hacia ".$usuario->name,
                        "showProgressBar" => "top"
                    );



                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    extract($row);
                    if($IDArea == "1"){
                        $Vision_row[]=array(
                            "value" => $IDPregunta,
                            "text" => $Pregunta
                        );}
                    if($IDArea == "2"){
                        $Relaciones_row[]=array(
                            "value" => $IDPregunta,
                            "text" => $Pregunta
                        );}
                    if($IDArea == "3"){
                        $Cambio_row[]=array(
                            "value" => $IDPregunta,
                            "text" => $Pregunta
                        );}
                    if($IDArea == "4"){
                        $Liderazgo_row[]=array(
                            "value" => $IDPregunta,
                            "text" => $Pregunta
                        );}
                    if($IDArea == "5"){
                        $Ejecucion_row[]=array(
                            "value" => $IDPregunta,
                            "text" => $Pregunta
                        );}
                }

                while ($row2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
                    extract($row2);
                 $Respuesta_row[]=array(
                        "value" => $IDRespuesta,
                        "text" => $Respuesta
                     );
                }

        $Vision_item=array(
                "type" => "matrix",
                "name" => "Vision",
                "title" => "Vision",
                "isRequired" => "true",
                "columns" => $Respuesta_row,
                "rows" => $Vision_row
        );
        $Relacion_item=array(
                "type" => "matrix",
                "name" => "Relaciones",
                "title" => "Relaciones",
                "isRequired" => "true",
                "columns" => $Respuesta_row,
                "rows" => $Relaciones_row
        );
        $Cambio_item=array(
                "type" => "matrix",
                "name" => "Cambio",
                "title" => "Cambio",
                "isRequired" => "true",
                "columns" => $Respuesta_row,
                "rows" => $Cambio_row
        );
        $Liderazgo_item=array(
                "type" => "matrix",
                "name" => "Liderazgo",
                "title" => "Liderazgo",
                "isRequired" => "true",
                "columns" => $Respuesta_row,
                "rows" => $Liderazgo_row
        );
        $Ejecucion_item=array(
                "type" => "matrix",
                "name" => "Ejecucion",
                "title" => "Ejecucion",
                "isRequired" => "true",
                "columns" => $Respuesta_row,
                "rows" => $Ejecucion_row
        );
        $Fortalezas_item=array(
                "type" => "text",
                "name" => "Fortalezas",
                "title" => "¿Cuáles son las principales fortalezas de este integrante que me tocan experimentar de forma directa ?",
                "isRequired" => "true"
        );
        $Debilidades_item=array(
                "type" => "text",
                "name" => "Debilidades",
                "title" => "¿Cuáles son las principales debilidades de este integrante que me tocan experimentar de forma directa?",
                "isRequired" => "true"
        );
        $Recomendaciones_item=array(
                "type" => "text",
                "name" => "Recomendaciones",
                "title" => "¿Qué le recomendaría para agregar más valor a la organización?",
                "isRequired" => "true"
        );

        array_push($pregunta_arr["questions"], $Vision_item, $Relacion_item, $Cambio_item, $Liderazgo_item,
        $Ejecucion_item,$Fortalezas_item,$Debilidades_item,$Recomendaciones_item);


    echo json_encode($pregunta_arr);
}

else{
    echo json_encode(
        array("message" => "No preguntas found.")
    );
}
?>
