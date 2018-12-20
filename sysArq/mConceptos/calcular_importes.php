<?php 
	include '../global_settings/conexion.php';
  	session_name("sysOrigen");
  	session_start();
  	$id_contrato = $_SESSION['id_contrato'];
	$s = "SELECT total_contrato FROM contratos WHERE id = '$id_contrato'";
	$exS = mysqli_query($conexion, $s);
	$row = mysqli_fetch_row($exS);

	$total_contrato = $row[0];
	$p_anticipo = "." . $_POST['p_anticipo'];
	$p_iva = ".". $_POST['p_iva'];
	$p_garantia = "." . $_POST['p_fondo'];
	//$p_pendiente = "1." . $_POST['p_pendiente'];

	$m_iva = $total_contrato * $p_iva;
	$m_garantia = $total_contrato * $p_garantia;
	//$m_pendiente = $total_contrato * $p_pendiente;
	$m_anticipo = $total_contrato * $p_anticipo;

	$array = array(
		$m_iva, 
		$m_garantia,
		$m_anticipo
	);
	echo json_encode($array);

 ?>