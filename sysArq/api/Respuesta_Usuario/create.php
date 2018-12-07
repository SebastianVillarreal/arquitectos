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
include_once '../objects/Respuesta_Usuario.php';

$database = new Database();
$db = $database->getConnection();

$respuesta_usuario = new Respuesta_Usuario($db);

// get posted data
$data = json_decode(file_get_contents("php://input"),true);
print_r ($data);


if(array_key_exists("Vision",$data["result"]))
foreach($data["result"]["Vision"] as $key => $value)
{
    echo $value;
    echo $key;

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $key;
    $respuesta_usuario->id_respuesta = $value;
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = "";



        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta vision was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta vision."';
            echo '}';
        }
}

if(array_key_exists("Relaciones",$data["result"]))
foreach($data["result"]["Relaciones"] as $key => $value)
{
    echo $value;
    echo $key;

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $key;
    $respuesta_usuario->id_respuesta = $value;
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = "";

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Relaciones was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Relaciones."';
            echo '}';
        }
}

if(array_key_exists("Cambio",$data["result"]))
foreach($data["result"]["Cambio"] as $key => $value)
{
    echo $value;
    echo $key;

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $key;
    $respuesta_usuario->id_respuesta = $value;
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = "";

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Cambio was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Cambio."';
            echo '}';
        }
}

if(array_key_exists("Liderazgo",$data["result"]))
foreach($data["result"]["Liderazgo"] as $key => $value)
{
    echo $value;
    echo $key;

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $key;
    $respuesta_usuario->id_respuesta = $value;
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = "";

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Liderazgo was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Liderazgo."';
            echo '}';
        }
}

if(array_key_exists("Ejecucion",$data["result"]))
foreach($data["result"]["Ejecucion"] as $key => $value)
{
    echo $value;
    echo $key;

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $key;
    $respuesta_usuario->id_respuesta = $value;
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = "";

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Ejecucion was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Ejecucion."';
            echo '}';
        }
}

if(array_key_exists("Fortalezas",$data["result"]))
{

    $id="";
    if($data["id_encuesta"] == "1")
    $id = "106";
    if($data["id_encuesta"] == "2")
    $id = "109";
    if($data["id_encuesta"] == "3")
    $id = "112";

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $id;
    $respuesta_usuario->id_respuesta = "0";
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = $data["result"]["Fortalezas"];

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Fortalezas was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Fortalezas."';
            echo '}';
        }
}
if(array_key_exists("Debilidades",$data["result"]))
{
    $id="";
    if($data["id_encuesta"] == "1")
    $id = "107";
    if($data["id_encuesta"] == "2")
    $id = "110";
    if($data["id_encuesta"] == "3")
    $id = "113";

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $id;
    $respuesta_usuario->id_respuesta = "0";
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = $data["result"]["Debilidades"];

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Debilidades was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Debilidades."';
            echo '}';
        }
}
if(array_key_exists("Recomendaciones",$data["result"]))
{
    $id="";
    if($data["id_encuesta"] == "1")
    $id = "108";
    if($data["id_encuesta"] == "2")
    $id = "111";
    if($data["id_encuesta"] == "3")
    $id = "114";

    // set product property values
    $respuesta_usuario->id_encuesta = $data["id_encuesta"];
    $respuesta_usuario->id_pregunta = $id;
    $respuesta_usuario->id_respuesta = "0";
    $respuesta_usuario->id_usuario = $data["id_usuario"];
    $respuesta_usuario->id_usuario_to = $data["id_usuario_to"];
    $respuesta_usuario->respuesta = $data["result"]["Recomendaciones"];

        // create the product
        if($respuesta_usuario->create()){
            echo '{';
                echo '"message": "respuesta Recomendaciones was created."';
            echo '}';
        }
        // if unable to create the product, tell the user
        else{
            echo '{';
                echo '"message": "Unable to create respuesta Recomendaciones."';
            echo '}';
        }
}
?>
