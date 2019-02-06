<?php 
	include '../global_settings/conexion.php';
	$id_proyecto = $_POST['proyecto'];
	

	if(!isset($_POST['searchTerm'])){
  		$sql = "SELECT id, descripcion FROM contratos WHERE nombre = '$id_proyecto'";
	}else{
  		$search = $_POST['searchTerm'];
  		$sql = "SELECT id, descripcion FROM contratos WHERE nombre = '$id_proyecto' AND descripcion LIKE '%".$search."%'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$data = array();
	while ($row = mysqli_fetch_row($exSql)) {
		$data[] = array("id"=>$row[0], "text"=>$row[1]); 
	}
	
	echo json_encode($data);
 ?>