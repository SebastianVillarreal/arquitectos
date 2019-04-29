<?php 

	include '../global_settings/conexion.php';
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->id;
	$select = "SELECT id, folio_erp, concepto, total, fecha, id_contratista, id_proyecto FROM captura_rayas_extras WHERE id ='$id'";
	$exSel = mysqli_query($conexion, $select);
	$row = mysqli_fetch_row($exSel);
	echo json_encode($row);

 ?>