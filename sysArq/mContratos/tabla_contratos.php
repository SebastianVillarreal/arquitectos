<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/contrato.php';
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$contratos = new contrato($db);
	$contratos->grupo = $grupo;
	$contratos->User_r = $usr;
	$stmt2 = $contratos->read();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>Proyecto</th>
	                <th>Residente</th>
	                <th>Contratista</th>
	                <th>Descripcion</th>
	                <th>Total</th>
	                <th>Usuario</th>
	                <th>Seleccionar</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
	        		extract($row);
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[1]; ?>
						</td>
						<td align="center">
							<?php echo $row[2]?>
						</td>
						<td align="center">
							<?php echo $row[3]; ?>
						</td>
						<td align="center">
							<?php echo $row[4]; ?>
						</td>
						<td align="center"><?php echo $row[5] ?></td>
						<td align="center"><?php echo $row[6] ?></td>
						<td class="text-center">
							<i class="far fa-arrow-alt-circle-right fa-2x"></i>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>