<?php 	
	session_name("sysOrigen");
  	session_start(); 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/contrato.php';

	$id_user = $_SESSION["usr_id"];
  	$id_proyecto = $_SESSION["id_proyecto"];
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$contratos = new contrato($db);
	$contratos->id_proyecto = $id_proyecto;
	$contratos->id_user = $id_user;
	$stmt2 = $contratos->read_siguientes();

 ?>
 	    <script>
		   $(document).ready(function() {
		     $('#lista_contratos').dataTable({
		       "language": {
		         "url": "../assets/js/Spanish.json"
		       }
		     });
		   });
		 </script>
	<div class="table-responsive">
        <table id="lista_contratos" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>#</th>
	                <th>Nombre</th>
	                <th>Marcar</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[0]; ?>
						</td>
						<td align="center">
							<?php echo $row[1]?>
						</td>
						<td align="center">
							<input value="<?php echo $row[0] ?>" onchange="javascript:update($(this).val())" type="checkbox" name="marca_"<?php echo $row[0] ?>>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>