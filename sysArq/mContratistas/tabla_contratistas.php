<?php 
	include_once '../api/config/database.php';
	include_once '../api/objects/contratistas.php';
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$conceptos = new Contratistas($db);
	$stmt2 = $conceptos->read();
 ?>
	<div class="table-responsive">
        <table id="lista_contratistas" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>#</th>
	                <th>Nombre</th>
	                <th>Editar</th>
	                <th>Eliminar</th>
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
						<td><?php echo $row[1] ?></td>
						<td><a href="#" class="btn btn-danger text-center">Editar</a></td>
						<td class="text-center"><a href="#" class="btn btn-danger">Eliminar</a></td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>