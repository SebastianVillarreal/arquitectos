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
include_once '../objects/Usuario.php';
 
$database = new Database();
$db = $database->getConnection();
 
$usuario = new Usuario($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$usuario->name = $data->name;
$usuario->apellido_paterno = $data->apellido_paterno;
$usuario->apellido_materno = $data->apellido_materno;
$usuario->direccion = $data->direccion;
$usuario->colonia = $data->colonia;
$usuario->municipio = $data->municipio;
$usuario->ciudad = $data->ciudad;
$usuario->pais = $data->pais;
$usuario->telefono = $data->telefono;
$usuario->correo = $data->correo;
$usuario->contraseña = $data->contraseña;
$usuario->fecha_nacimiento = $data->fecha_nacimiento;
$usuario->id_rol = $data->id_rol;
$usuario->id_area = $data->id_area;

 
// create the product
if($usuario->create()){
    echo '{';
        echo '"message": "Usuario was created."';
    echo '}';
}
 
// if unable to create the product, tell the user
else{
    echo '{';
        echo '"message": "Unable to create usuario."';
    echo '}';
}
?>