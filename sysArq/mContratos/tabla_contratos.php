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
	$stmt2 = $contratos->read_agrupado();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>Folio</th>
	                <th>Obra</th>
	                <th>Residente</th>
	                <th>Contratista</th>
	                <th>Nivel</th>
	                <th>Descripcion</th>
	                <th>Fecha</th>
	                <th>Seleccionar</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[0]?>
						</td>
						<td align="center">
							<?php echo $row[3]; ?>
						</td>
						<td align="center">
							<?php echo $row[2]; ?>
						</td>
						<td><?php echo $row[1] ?></td>
						<td align="center"><?php echo $row[9] ?></td>
						<td><?php echo $row[4] ?></td>
						<td bgcolor="#f1c40f">
							<?php 
								if (is_null($row[8])) {
									$date = $row[10];
								}else{
									$date = $row[8];
								}
							 ?>
							<?php echo $date; ?>
								
						</td>
						<td class="text-center">
							<a href="javascript:seleccionar_contrato(<?php echo $row[0] ?>)"><i class="far fa-arrow-alt-circle-right fa-2x"></i></a>
						</td> 
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>