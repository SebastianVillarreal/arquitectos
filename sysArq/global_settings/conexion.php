<?php
	include'credenciales.php';
	$conexion=mysqli_connect($db_host,$db_user,$db_pass,$db_name);
	mysqli_set_charset($conexion, 'utf8');
?>