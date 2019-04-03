<?php 
	include '../global_settings/conexion.php';
	$sql = "SELECT MAX(id), nombre FROM contratos";
	$exSql = mysqli_query($conexion, $sql);
	$row = mysqli_fetch_row($exSql);
	echo json_encode($row[0]);
 ?>