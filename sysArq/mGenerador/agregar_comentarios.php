<?php 
	include '../global_settings/conexion.php';
	session_name("sysOrigen"); 
	session_start(); 
	$id_contrato = $_SESSION['id_contrato'];
	$usr_login = $_SESSION['usr_login'];
	$data = json_decode(file_get_contents("php://input"));
	$comentarios = $data->comentarios;
	date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');

	$sql = "INSERT INTO comentarios_contrato ( id_contrato, comentario, fecha, hora, usuario )
			VALUES
				('$id_contrato', '$comentarios', '$fecha', '$hora', '$usr_login')";
	$exSql = mysqli_query($conexion, $sql);

 ?>