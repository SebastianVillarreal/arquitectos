<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/estimacion.php';
	session_name("sysOrigen");
  	session_start();
  	$usr = $_SESSION['usr_login'];
  	$id_user = $_SESSION["usr_id"];
  	$id_contrato = $_SESSION["id_contrato"];
  	$perfil_user = $_SESSION['usr_groupid'];
  	$data = json_decode(file_get_contents("php://input"));
  	$id_contrato = $data->id_contrato;
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$estimaciones = new estimacion($db);
	$estimaciones->id_contrato = $id_contrato;
	$stmt2 = $estimaciones->read();

 ?>

	<div class="table-responsive">
        <table id="lista_estimaciones" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>Folio</th>
	                <th>Total</th>
	                <th>Anticipo</th>
	                <th>Garantia</th>
	                <th>IVA</th>
	                <th>Estatus</th>
	                <th>Fecha Aut</th>
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
							<?php echo $row[0] ?>
						</td>
						<td align="center">
							$<?php echo $row[1]; ?>
						</td>
						<td align="center">
							$<?php echo $row[4]?>
						</td>
						<td align="center">
							$<?php echo $row[5]; ?>
						</td>
						<td align="center">
							$<?php echo $row[6]; ?>
						</td>
						<td><?php echo $row[2] ?></td>
						<td><?php echo $row[7] ?></td>
						<td class="text-center">
							<a href="javascript:seleccionar_estimacion(<?php echo $row[0] ?>)"><i class="far fa-arrow-alt-circle-right fa-2x"></i></a>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>

	    <script>
   $(document).ready(function() {
     $('#lista_estimaciones').dataTable({
       "language": {
         "url": "../assets/js/Spanish.json"
       }
     });
   });
 </script>