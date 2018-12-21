<?php 
	include_once '../api/config/database.php';
	include_once '../api/objects/concepto.php';
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$conceptos = new concepto($db);
	$stmt2 = $conceptos->read();
 ?>
	<div class="table-responsive">
        <table id="lista_conceptos" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>#</th>
	                <th>Proyecto</th>
	                <th>Clave</th>
	                <th>Descripción</th>
	                <th>Unidad</th>
	                <th>Cantidad Original</th>
	                <th>Max. Sub-Contrato</th>
	                <th>Max Destajo</th>
	                <th>Editar</th>

	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while($row = $stmt2->fetch(PDO::FETCH_NUM))

				{	
					?>
					
					<tr>
						<td>
							<?php echo $row[0]; ?>
						</td>
						<td><?php echo $row[7] ?></td>
						<td>
							<?php echo $row[1]?>
						</td>
						<td>
							<?php echo $row[2]; ?>
						</td>
						<td><?php echo $row[3] ?></td>
						<td><?php echo $row[4] ?></td>
						<td>$<?php echo $row[5] ?></td>
						<td>$<?php echo $row[6] ?></td>
						<td class="text-center">
							<a href="editar_modulo.php?id=<?php echo $row[0] ?>" class="btn btn-danger text-center">Editar</a>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>