<?php 
session_name("sysAdMision"); 
session_start(); 

// antes de hacer los cálculos, compruebo que el usuario está logueado 
// utilizamos el mismo script que antes 
if (!isset($_SESSION["sysAdMision_autenticado"]) || $_SESSION["sysAdMision_autenticado"] != "SI") 
{ 
    //si no está logueado lo envío a la página de autentificación 
    echo"<script language=\"javascript\">window.location=\"../mLogin/index.php\"</script>";
} 
else 
{ 
	//se manda llamar la conexion
	include "datos_usuario_acceso.php";

   if ($acceso_modulo != 1) {
   		echo"<script language=\"javascript\">window.location=\"../mPanel_control/index.php\"</script>";
   }else{

   	$cadena_solo_sucursal = "SELECT solo_sucursal FROM detalle_usuario WHERE id_usuario = '$id_usuario' AND id_modulo = '$id_modulo'";
   	$consulta_solo_sucursal = mysqli_query($conexion, $cadena_solo_sucursal);
   	$row_sucursal = mysqli_fetch_array($consulta_solo_sucursal);
   	$solo_sucursal = $row_sucursal[0];
   }
}
?>