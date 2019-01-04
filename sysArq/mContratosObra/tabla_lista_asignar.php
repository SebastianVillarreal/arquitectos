<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/lista_contratos.php';
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
	$contratos = new lista_contrato($db);
	$stmt2 = $contratos->read();

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
	            	<th>M</th>
	            	<th>#</th>
	                <th>Nombre</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
					?>
					
					<tr>
						<td align="center">
							<input type="checkbox" name="">
						</td>
						<td align="center">
							<?php echo $row[0] ?>
						</td>
						<td align="center">
							<?php echo $row[1]; ?>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>