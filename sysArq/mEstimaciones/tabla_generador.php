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
  	$id_renglon = $_SESSION['id_renglon'];
  	$id_estimacion = $_SESSION['id_estimacion'];
	 
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	 
	// initialize object
	$estimacion = new estimacion($db);
	$estimacion->id_renglon = $id_renglon;
	$estimacion->id = $id_estimacion;
	$stmt2 = $estimacion->read_generador();

 ?>

	<div class="table-responsive">
        <table id="lista_contrato" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>#</th>
	            	<th>Zona</th>
	                <th>Area</th>
	                <th>Cuarto</th>
	                <th>Total</th>
	                <th>% Estimado</th>
	                <th>Estimar</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	$n = 1;
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
	        		if (is_null($row[5])) {
	        			$row[5] = 0;
	        		}else{
	        			$row[5] = $row[5];
	        		}
					?>
					<tr>
						<td align="center">
							<?php echo $n ?>
						</td>
						<td align="center">
							<?php echo $row[3] ?>
						</td>
						<td><?php echo $row[2] ?></td>
						<td align="center">
							<?php echo $row[1]; ?>
						</td>
						<td align="center">
							<?php echo $row[6]?>
						</td>
						<td align="center"><?php echo $row[9] ?>%</td>
						<td align="right">

							<?php if (is_null($row[10])) {
								$read = "";
							}else{
								$read = "readonly";
							} ?>
							<input value="<?php echo $row[10] ?>" <?php echo $read ?> type="text" onchange="javascript:estimar_generador(<?php echo $id_renglon ?>, $(this).val(), <?php echo $row[11] ?>, <?php echo $row[12] ?>, <?php echo $id_estimacion ?>)" class="form-control" name="" >
						</td>
					</tr>
				<?php
				$n = $n + 1; 
				}
				 ?>
	        </tbody>  
		</table>
	</div>