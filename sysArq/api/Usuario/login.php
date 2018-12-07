<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/Usuario.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$usuario = new Usuario($db);
$usuario->email = isset($_POST['email']) ? $_POST['email'] : die();
$usuario->pass = isset($_POST['pass']) ? $_POST['pass'] : die();

// query products
$stmt = $usuario->login();

    // products array
    $usuario_arr=array();
    $usuario_arr["records"]=array();
 
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // create array
    $usuario_item = array(
        "Exists" =>  $row['Exist'],
        "ID" => $row["ID"]
    );
 
   array_push($usuario_arr["records"], $usuario_item);
    
 
    echo json_encode($usuario_arr);
    //echo $num;


?>