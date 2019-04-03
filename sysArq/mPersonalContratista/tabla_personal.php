<?php 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/personal.php';
	session_name("sysOrigen");
  	session_start();
	$database = new Database();
	$db = $database->getConnection();
  	$usr = $_SESSION['usr_login'];
  	$id_user = $_SESSION["usr_id"];
  	$id_contrato = $_SESSION["id_contrato"];
  	$perfil_user = $_SESSION['usr_groupid'];
  	$personal = new personal($db);
  	$stmt = $personal->read();
 ?>
	<div class="table-responsive">
        <table id="lista_categorias" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th width="5%">#</th>
	                <th>Nombre</th>
	                <th>Sueldo diario</th>
	                <th>Contratista</th>
	                <th>Editar</th>
	                <th width="10%">Activo</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while($row = $stmt->fetch(PDO::FETCH_NUM))
				{	
					?>
					
					<tr>
						<td>
							<?php echo $row[0]; ?>
						</td>
						<td>
							<?php echo $row[1]?>
						</td>
						<td>
							<?php echo $row[2]; ?>
						</td>
						<td>
							<?php echo $row[3]; ?>
						</td>
						<td align="center">
							<a href="#" onclick="javascript:editar(<?php echo "$row[0]"; ?>)" class="btn btn-danger">Editar Datos</a>
						</td>
						<td class="text-center">
							<?php if ($row[5] == 1) {
								$s = checked;
							} else{
								$s="";
							}
								?>
							<input type="checkbox" onchange="javascript:cambiar_estado(<?php echo $row[0] ?>,this)" <?php echo $s ?>  name="">
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>