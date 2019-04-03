<?php
include '../global_seguridad/verificar_sesion.php';
$nombre = $_POST['nombre'];
$ap_paterno = $_POST['ap_paterno'];
$ap_materno = $_POST['ap_materno'];
$id_sucursal = $_POST["id_sucursal"];
$perfil_usuario = $_POST["id_perfil"];

date_default_timezone_set('America/Monterrey');
$fecha=date("Y-m-d"); 
$hora=date ("h:i:s");

$cadena_insertar = "INSERT INTO personas (nombre, ap_paterno, ap_materno, fecha, hora, activo, usuario, id_sede) VALUES ('$nombre','$ap_paterno','$ap_materno','$fecha','$hora','1','$id_usuario','$id_sucursal')";

$insertar_persona = mysqli_query($conexion, $cadena_insertar);

//Id de persona recien ingresada
$cadena_consulta = "SELECT MAX(id) FROM personas";
$consulta_persona = mysqli_query($conexion, $cadena_consulta);
$row_persona = mysqli_fetch_array($consulta_persona);

$nombre_usuario = strtoupper($nombre[0].$ap_paterno);
$pass = MD5("123456789");

$cadena_insertar_usuario = "INSERT INTO usuarios (id_persona, nombre_usuario, pass, id_perfil, registros_sede, fecha, hora, activo, usuario)VALUES('$row_persona[0]','$nombre_usuario','$pass','$perfil_usuario','0','$fecha','$hora','1','$id_usuario')";
$insertar_usuario = mysqli_query($conexion, $cadena_insertar_usuario);
//echo $cadena_insertar_usuario;

$cadena_usuario = "SELECT MAX(id) FROM usuarios";
$consulta_usuario = mysqli_query($conexion, $cadena_usuario);
$row_usuario = mysqli_fetch_array($consulta_usuario);

//Extraer información de los módulos 
$cadena_modulos = "SELECT modulos.id, modulos.nombre, modulos.categoria FROM modulos INNER JOIN detalle_perfil WHERE modulos.id = detalle_perfil.id_modulo AND detalle_perfil.id_perfil = '$perfil_usuario'";

$consulta_modulos = mysqli_query($conexion, $cadena_modulos);
while ($row_modulos = mysqli_fetch_array($consulta_modulos)) {
	$cadena_detalle = "INSERT INTO detalle_usuario (id_usuario, id_modulo, id_categoria, fecha, hora, activo, usuario)VALUES('$row_usuario[0]','$row_modulos[0]','$row_modulos[2]','$fecha','$hora','1','$id_usuario')";

	$insertar_detalle = mysqli_query($conexion, $cadena_detalle);
}

echo "ok";
 ?>