<?php 
	include '../global_settings/conexion.php';
	$id_obra = $_POST['obra'];
	

	if(!isset($_POST['searchTerm'])){
  		$sql = "SELECT
					contratistas.id,
					contratistas.persona_moral 
				FROM
					 contratistas
					GROUP BY 1";
	}else{
  		$search = $_POST['searchTerm'];
  		$sql = "SELECT
					contratistas.id,
					contratistas.persona_moral 
				FROM
					contratistas
				WHERE
				 contratistas.nombre LIKE '%".$search."%'";
	}
	$exSql = mysqli_query($conexion, $sql);
	$data = array();
	while ($row = mysqli_fetch_row($exSql)) {
		$data[] = array("id"=>$row[0], "text"=>$row[1]); 
	}
	
	echo json_encode($data);
 ?>