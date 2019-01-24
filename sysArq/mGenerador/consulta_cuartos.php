<?php 
	include '../global_settings/conexion.php';
	$id_area = $_POST['id_area'];

	if(!isset($_POST['searchTerm'])){
  		$sql = "SELECT * FROM cuartos_generador WHERE id_area = '$id_area'";
	}else{
  		$search = $_POST['searchTerm'];
  		$sql = "SELECT id, descripcion FROM zonas_generador WHERE descripcion LIKE '%".$search."%'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$data = array();
	while ($row = mysqli_fetch_row($exSql)) {
		$data[] = array("id"=>$row[0], "text"=>$row[1]); 
	}
	
	echo json_encode($data);
 ?>