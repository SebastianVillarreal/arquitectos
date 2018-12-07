<?php 
include '../global_settings/conexion.php';

//Extraigo el ID de Usuario
$id_usuario = $_SESSION["sysAdMision_id_usuario"];
$id_persona = $_SESSION["sysAdMision_id_persona"];
$perfil_usuario = $_SESSION["sysAdMision_perfil"];
$nombre_perfil = $_SESSION["sysAdmision_nombre_perfil"];
$nombre_persona = $_SESSION["sysAdMision_persona"];
$id_sede = $_SESSION["sysAdMision_sede"];

include 'obtener_carpeta.php';
//Compruebo si tiene acceso al módulo en cuestión
$cadena = "SELECT modulos.id, modulos.nombre FROM modulos INNER JOIN detalle_perfil ON modulos.id =detalle_perfil.id_modulo AND detalle_perfil.id_perfil = '$perfil_usuario' AND modulos.nombre_carpeta ='$nombre_modulo' AND detalle_perfil.activo='1'";
$consulta = mysqli_query($conexion, $cadena) or die(mysqli_error());
$acceso_modulo =  mysqli_num_rows($consulta);

$row_modulo = mysqli_fetch_array($consulta);
$id_modulo = $row_modulo[0];

 ?>