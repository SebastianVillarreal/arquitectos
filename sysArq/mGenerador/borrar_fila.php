<?php 
	include '../global_settings/conexion.php';
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->id;
	$id_concepto = $data->id_concepto;
	$id_detalle  = $data->id_detalle;
	$call = "CALL sp_update_cantidades('$id', '$id_concepto', '$id_detalle')";
	//echo "$call";
	$stmt = mysqli_query($conexion, $call);
	//header("Location:../mGenerador/index.php");
	

 ?>