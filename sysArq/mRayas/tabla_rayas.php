<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/rayas.php';
	session_name("sysOrigen");
  	session_start();
  	$usr = $_SESSION['usr_login'];
  	$id_user = $_SESSION["usr_id"];
  	$id_contrato = $_SESSION["id_contrato"];
  	$perfil_user = $_SESSION['usr_groupid'];
	 $data = json_decode(file_get_contents("php://input"));
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	
 	// initialize object
	$rayas = new rayas($db);
	$rayas->obra = 1;


	$stmt2 = $rayas->seleccionar_rayas();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>Contratos</th>
	            	<th>Contratista</th>
	            	<th>Concepto</th>
	            	<th>Subtotal</th>
	            	<th>Total</th>
	            </tr>
	        </thead>
	       
		        <tbody>
	        		<?php 
		        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
						?>
						<tr>
							<td align="center">
								<?php echo $row[1]?>
								<input type="hidden" value="<?php echo $row[0] ?>"name="contratista">
							</td>
							<td><?php echo $row[2] ?></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					<?php 
					}
					 ?>
	        	</tbody>  	        	
	        

		</table>
	</div>