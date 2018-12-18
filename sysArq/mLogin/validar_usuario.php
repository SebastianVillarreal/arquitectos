<?php
	session_name("sysOrigen");
	session_start();
	$json = json_decode(file_get_contents('php://input')); 
	$id_contrato_post = $json->id_contrato;
	$_SESSION["id_contrato"] = $id_contrato_post;
	include'../global_settings/conexion.php';
	$p_user = $_POST['nombre_usuario'];
	//$p_contra = md5($_POST['pass']);
	$p_contra = $_POST['pass'];
	$pswd = hash("sha512", $p_contra);

$consulta_usuario = "SELECT 
						priv_admin,
						active, 
						name, 
						email,
						uG.group_id,
				        G.description
					      FROM Sec_users uS
						  INNER JOIN Sec_users_groups uG ON uS.login = uG.login
						  INNER JOIN Sec_groups G ON G.group_id = uG.group_id
					      WHERE uS.login= '$p_user'
						AND uS.pswd = '$pswd'";
//echo "$consulta_usuario";


$usuario = mysqli_query($conexion, $consulta_usuario);
$row_usuario = mysqli_fetch_array($usuario);
$num_usuario = mysqli_num_rows($usuario);

if ($num_usuario==0) {
	echo "1";
}elseif ($num_usuario>0) {

	//$usr_login		= {login};
	$_SESSION['usr_login'] = $p_user;
	//$usr_priv_admin 	= ({rs[0][0]} == 'Y') ? TRUE : FALSE;
	//$usr_name		= {rs[0][2]};
	$_SESSION['usr_name'] = $row_usuario[2];
	//$usr_email		= {rs[0][3]};
	$_SESSION['usr_email'] = $row_usuario[3];	
	//$usr_groupid = {rs[0][4]};
	$_SESSION['usr_groupid'] = $row_usuario[4];
	//$usr_groupid_desc = {rs[0][5]};
	$_SESSION['usr_groupid_desc'] = $row_usuario[5];
	$_SESSION["sysOrigen_autenticado"] = "SI";

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