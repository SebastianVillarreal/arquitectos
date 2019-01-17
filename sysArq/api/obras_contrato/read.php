<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/obras_contrato.php';

$data = json_decode(file_get_contents("php://input"));
$pObra = $data->obra;
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$obras_contrato = new obras_contrato($db);
 
$obras_contrato->obra = $pObra;

// query products
$stmt = $obras_contrato->read();

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
	                <th>Obra</th>
	                <th>Contrato</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt->fetch(PDO::FETCH_NUM)){
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[0] ?>
						</td>
						<td align="center">
							<?php echo $row[1]; ?>
						</td>
						<td align="center"><?php echo $row[2] ?></td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>

