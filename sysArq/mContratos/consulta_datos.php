<?php 
	include '../global_settings/conexion.php';
	$json = json_decode(file_get_contents('php://input')); 
	$tipo = $json->tipo;
	$dato = $json->dato;



	if ($tipo == 1) {
		$sql = "SELECT nombre FROM proyectos WHERE id = '$dato'";
	}elseif($tipo == 2){
		$sql = "SELECT CONCAT(nombre,' ', ap_paterno, ' ', ap_materno) FROM contratistas WHERE id = '$dato';";
	}elseif($tipo == 3){
		$sql = "SELECT CONCAT(nombre, ' ',ap_paterno, ' ',ap_materno) FROM personas INNER JOIN usuarios ON usuarios.id_persona = personas.id WHERE usuarios.id = '$dato'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$row = mysqli_fetch_row($exSql);
	$array = array($row[0], $tipo);
	echo json_encode($array);
 ?>