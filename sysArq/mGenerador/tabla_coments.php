<?php 
	session_name("sysOrigen"); 
	session_start(); 
	include '../global_settings/conexion.php';
	$id_contrato = $_SESSION['id_contrato'];
	$sql = "SELECT id, comentario, usuario FROM comentarios_contrato WHERE id_contrato ='$id_contrato' AND comentario <> '' ORDER BY id DESC";
	$exSql = mysqli_query($conexion, $sql);
 ?>
	 <table class="table table-striped">
	  <tr>
	    <th>#</th>
	    <th>Usuario</th>
	    <th>Coments</th>
	  </tr>
	  <?php 
	  	while ($row = mysqli_fetch_row($exSql)) {?>
	  		<tr>
	  			<td><?php echo $row[0] ?></td>
	  			<td><?php echo $row[2] ?></td>
	  			<td><?php echo $row[1] ?></td>
	  		</tr>
	  	<?}
	   ?>
	</table>