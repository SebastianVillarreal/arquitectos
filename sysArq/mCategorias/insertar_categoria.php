<?php
include '../global_settings/conexion.php';

$nombre_categoria = $_POST['nombre_categoria'];
$descripcion_categoria = $_POST['descripcion_categoria'];

$cadena_duplicado = "SELECT * FROM categorias_modulos WHERE nombre = '$nombre_categoria'";
$consulta_duplicado = mysqli_query($conexion, $cadena_duplicado);
$cont_duplicado = mysqli_num_rows($consulta_duplicado);

if ($cont_duplicado>0) {
	echo "duplicado";
}elseif ($cont_duplicado==0) {
	
//Fecha y hora actual
date_default_timezone_set('America/Monterrey');
$fecha=date("Y-m-d");
$hora=date ("h:i:s");

$cadena_insertar = "INSERT INTO categorias_modulos (nombre, descripcion, fecha, hora, activo, usuario) VALUES ('$nombre_categoria','$descripcion_categoria','$fecha','$hora','1','$id_usuario')";

$insertar_categoria = mysqli_query($conexion, $cadena_insertar);

echo "ok";
}
?>
