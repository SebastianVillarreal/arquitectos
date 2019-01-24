<?php 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/contrato.php';
	session_name("sysOrigen");
  	session_start();
  	$usr = $_SESSION['usr_login'];
  	$id_user = $_SESSION["usr_id"];
  	$id_contrato = $_SESSION["id_contrato"];
  	$perfil_user = $_SESSION['usr_groupid'];
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$contratos = new contrato($db);
	$contratos->grupo = $grupo;
	$contratos->User_r = $usr;
	$contratos->perfil_user = $perfil_user;
	$contratos->id_user = $id_user;
	$stmt2 = $contratos->count_pend();
	$row = $stmt2->fetch(PDO::FETCH_NUM);
 ?>