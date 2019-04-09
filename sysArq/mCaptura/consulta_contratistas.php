<?php 

	include '../global_settings/conexion.php';
	$id_zona = $_POST['id_zona'];

	if(!isset($_POST['searchTerm'])){
  		$sql = "SELECT id, CONCAT(nombre, ' ',  IFNULL(ap_paterno, ''), ' ', IFNULL(ap_materno, '')) FROM contratistas";
	}else{
  		$search = $_POST['searchTerm'];
  		$sql = "SELECT id, CONCAT(nombre, ' ',  IFNULL(ap_paterno, ''), ' ', IFNULL(ap_materno, '')) FROM contratistas WHERE nombre LIKE '%".$search."%'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$data = array();
	while ($row = mysqli_fetch_row($exSql)) {
		$data[] = array("id"=>$row[0], "text"=>$row[1]); 
	}
	
	echo json_encode($data);

 ?>