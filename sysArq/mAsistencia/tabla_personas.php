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
	$rayas->contratista = $data->contratista;

	$stmt2 = $rayas->read_contratistas();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>#</th>
	                <th>Contratista</th>
	                <th>Puesto</th>
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
								<input type="hidden" value="<?php echo $row[0] ?>"	 name="contratista[]">
							</td>
							<td align="center"><?php echo $row[1] ?></td>
							<td align="center"><?php echo $row[2] ?></td>
							<td align="center">
								<input type="checkbox" name="marca" id="<? echo $row[0] ?>" onchange="asistir(<?php echo $row[0] ?>, this)">
								<input type="hidden" name="cal[]" id="cal_<? echo $row[0]?>" value="0">
							</td>
						</tr>
					<?php 
					}
					 ?>
	        	</tbody>  	        	
	        

		</table>
	</div>