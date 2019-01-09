<?php
	session_name("sysOrigen");
	session_start();
	$json = json_decode(file_get_contents('php://input')); 
	$id_contrato_post = $json->id_contrato;
	$type_post = $json->type;
	$id_proyecto = $json->id_obra;
	$_SESSION["id_contrato"] = $id_contrato_post;
	$_SESSION["type"] = $type_post;
	$_SESSION["id_proyecto"] = $id_proyecto;
	$s = $_SESSION["type"];
	include'../global_settings/conexion.php';
	$p_user = $_POST['nombre_usuario'];
	//$p_contra = md5($_POST['pass']);
	$p_contra = $_POST['pass'];
	$pswd = md5($p_contra);

$consulta_usuario = "SELECT 
						usuarios.id, 
						usuarios.nombre_usuario,
						usuarios.id_persona, 
						usuarios.id_perfil, 
						CONCAT(personas.nombre,' ',personas.ap_paterno) AS 'Nombre Persona', 
						sec_groups.description 
					FROM usuarios 
					INNER JOIN personas ON usuarios.nombre_usuario='$p_user'
					INNER JOIN sec_groups ON sec_groups.group_id = usuarios.id_perfil
					AND usuarios.pass='$pswd' 
					AND usuarios.id_persona = personas.id  
					AND usuarios.activo='1' 
					AND personas.activo='1'";//echo "$consulta_usuario";


$usuario = mysqli_query($conexion, $consulta_usuario);
$row_usuario = mysqli_fetch_array($usuario);
$num_usuario = mysqli_num_rows($usuario);

if ($num_usuario==0) {
	echo "1";
}elseif ($num_usuario>0) {

	//$usr_login	 	= {login};
	$_SESSION['usr_login'] = $p_user;
	//$usr_priv_admin 	= ({rs[0][0]} == 'Y') ? TRUE : FALSE;
	//$usr_name		= {rs[0][2]};
	$_SESSION['usr_name'] = $row_usuario[1];
	//$usr_email		= {rs[0][3]};
	$_SESSION['usr_email'] = $row_usuario[3];	
	//$usr_groupid = {rs[0][4]};
	$_SESSION['usr_groupid'] = $row_usuario[3];
	//$usr_groupid_desc = {rs[0][5]};
	$_SESSION['usr_groupid_desc'] = $row_usuario[5];
	$_SESSION["sysOrigen_autenticado"] = "SI";
	$_SESSION["usr_id"] = $row_usuario[0];

	// sc_set_global($usr_login);
	// sc_set_global($usr_priv_admin);
	// sc_set_global($usr_name);
	// sc_set_global($usr_email);
	// sc_set_global($usr_groupid);
	// sc_set_global($usr_groupid_desc);
	// $cadena_perfil = "SELECT nombre FROM perfil WHERE id = '$row_usuario[3]'";
	// $consulta_perfil = mysqli_query($conexion, $cadena_perfil);
	// $row_perfil = mysqli_fetch_row($consulta_perfil);

	// $_SESSION["sysAdMision_id_usuario"] = $row_usuario[0];
	// $_SESSION["sysAdMision_id_persona"] = $row_usuario[2];
	// $_SESSION["sysAdMision_perfil"] = $row_usuario[3];
	// $_SESSION["sysAdMision_persona"]= $row_usuario[4];
	// $_SESSION["sysAdMision_sede"]= $row_usuario[5];
	// $_SESSION["sysAdmision_nombre_perfil"]= $row_perfil[0];
	// $_SESSION["sysAdMision_autenticado"] = "SI";
	echo "2";
}
 ?>