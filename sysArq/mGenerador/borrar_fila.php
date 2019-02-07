<?php 
	include '../global_settings/conexion.php';
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->id;
	$call = "CALL sp_delete_generador('$id')";
	//echo "$call";
	$stmt = mysqli_query($conexion, $call);
	//header("Location:../mGenerador/index.php");
	

 ?>