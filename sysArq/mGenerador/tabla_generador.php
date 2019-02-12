<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/generador.php';
	session_name("sysOrigen");
  	session_start();
  	$usr = $_SESSION['usr_login'];
  	$id_user = $_SESSION["usr_id"];
  	$id_contrato = $_SESSION["id_contrato"];
  	$perfil_user = $_SESSION['usr_groupid'];
  	$id_renglon = $_SESSION['id_renglon'];
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$generador = new generador($db);
	$generador->id_renglon = $id_renglon;
	$stmt2 = $generador->read();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>#</th>
	            	<th>Zona</th>
	                <th>Area</th>
	                <th>Cuarto</th>
	                <th>Largo</th>
	                <th>Ancho</th>
	                <th>Total</th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
	        		extract($row);
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[0] ?>
						</td>
						<td align="center">
							<?php echo $row[3] ?>
						</td>
						<td align="center">
							<?php echo $row[2]; ?>
						</td>
						<td align="center">
							<?php echo $row[1]?>
						</td>
						<td align="right">
							<?php echo $row[4]; ?>
						</td>
						<td align="right">
							<?php echo $row[5]; ?>
						</td>
						<td align="right">
							<?php echo $row[6] ?>
						</td>
						<td align="center"><a href="javascript:eliminar_renglon(<?php echo $row[0]; ?>, <?php echo $row[7]; ?>, <?php echo $row[8]; ?>)"><button type="button" class="btn btn-danger">Eliminar</button></a></td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>