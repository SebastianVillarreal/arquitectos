<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/contrato.php';
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
	$contratos = new contrato($db);
	$contratos->grupo = $grupo;
	$contratos->User_r = $usr;
	$contratos->perfil_user = $perfil_user;
	$contratos->id_user = $id_user;
	$stmt2 = $contratos->read_historial();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>Folio</th>
	                <th>Obra</th>
	                <th>Residente</th>
	                <th>Contratista</th>
	                <th>Descripcion</th>
	                <th>Nivel</th>
	                <th>Inicio</th>
	                <th>VOBO Residente</th>
	                <th>VOBO Supervisor</th>
	                <th>Autorizado</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
					?>
					
					<tr>
						<td align="center">
							<?php echo $row[0] ?>
						</td>
						<td align="center">
							<?php echo $row[3]; ?>
						</td>
						<td align="center">
							<?php echo $row[2]?>
						</td>
						<td align="center">
							<?php echo $row[1]; ?>
						</td>
						<td align="center">
							<?php echo $row[4]; ?>
						</td>
						<td align="center"><?php echo $row[17] ?></td>
						<td><?php echo $row[12] ?></td>
						<?php if ($row[14] > 4) {
							echo "<td bgcolor = 'red'>$row[8]</td>";
						}else{
							echo "<td>$row[8]</td>";
						} ?><!-- Fecha Residente -->
						<?php if ($row[15] > 2) {
							echo "<td bgcolor='red'>$row[9]</td>";
						}else{
							echo "<td>$row[9]</td>";
						} ?><!-- Fecha Supervisor -->
						<?php if ($row[16] > 2){
							echo "<td bgcolor='red'>$row[10]</td>";
						}else{
							echo "<td>$row[10]</td>";
						} ?><!-- Fecha Costos o autorizado --> 
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>