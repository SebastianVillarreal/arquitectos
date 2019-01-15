<?php 
	include '../global_settings/conexion.php';
	session_name("sysOrigen"); 
	session_start(); 
	$id_contrato = $_SESSION['id_contrato'];
	$usr_login = $_SESSION['usr_login'];
	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	$sql = "UPDATE contratos SET consecutivo = consecutivo + 1, status = 1 WHERE id = '$id_contrato'";
	$exSql = mysqli_query($conexion, $sql);
	//insertar registro en fecha_contratos
	$insert = "INSERT INTO fecha_contratos (id_contrato, consecutivo_contrato) VALUES (id_c, consecutivo)";
	$exInsert = mysqli_query($conexion, $insert);
	echo "$sql";
	


?>