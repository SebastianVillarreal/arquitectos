<?php 
	include '../global_settings/conexion.php';
	$id_obra = $_POST['obra'];
	

	if(!isset($_POST['searchTerm'])){
  		$sql = "SELECT
					contratistas.id,
					contratistas.nombre 
				FROM
					obras_contratistas
					INNER JOIN contratistas ON contratistas.id = obras_contratistas.id_contratista 
				WHERE
					obras_contratistas.id_obra = '$id_obra'";
	}else{
  		$search = $_POST['searchTerm'];
  		$sql = "SELECT
					contratistas.id,
					contratistas.nombre 
				FROM
					obras_contratistas
					INNER JOIN contratistas ON contratistas.id = obras_contratistas.id_contratista 
				WHERE
					obras_contratistas.id_obra = '$id_obra'
				AND contratistas.nombre LIKE '%".$search."%'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$data = array();
	while ($row = mysqli_fetch_row($exSql)) {
		$data[] = array("id"=>$row[0], "text"=>$row[1]); 
	}
	
	echo json_encode($data);
 ?>