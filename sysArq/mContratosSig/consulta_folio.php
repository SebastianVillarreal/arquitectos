<?php 
	include '../global_settings/conexion.php';
	$sql = "SELECT MAX(id) FROM contratos";
	$exSql = mysqli_query($conexion, $sql);
	$row = mysqli_fetch_row($exSql);
	echo "$row[0]";
 ?>