<?php 
	include '../global_settings/conexion.php';
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->id;
	$update = "UPDATE obras_contratos SET activo = 0 WHERE id = '$id'";
	$exUpdate = mysqli_query($conexion, $update);
 ?>