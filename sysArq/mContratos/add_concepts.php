<?php 
	include '../global_settings/conexion.php';
	session_name("sysOrigen"); 
	session_start(); 
	$id_contrato = $_SESSION['id_contrato'];
	$usr_login = $_SESSION['usr_login'];
	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	$sql = "UPDATE contratos SET consecutivo = consecutivo + 1, estatus = 1 WHERE id = '$id_contrato'";
	$exSql = mysqli_query($conexion, $sql);


?>