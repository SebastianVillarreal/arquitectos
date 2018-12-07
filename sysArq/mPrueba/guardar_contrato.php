<?php 
	include '../global_settings/conexion.php';
	$pProyecto = $_POST[];
	$pContratista = $_POST[];
	$pResidente = $_POST[];
	$pDescripcion = $_POST[];
	$pFolio = $_POST[];
	$pTipoContrato = $_POST[];

	$sql = "INSERT INTO contratos ( nombre, contratista, residente, descripcion, tipo_contrato)
			VALUES
			('$pProyecto', '$pContratista', '$pResidente', '$pDescripcion', '$pTipoContrato')";
	$exSql = mysqli_query($conexion, $sql);
 ?>