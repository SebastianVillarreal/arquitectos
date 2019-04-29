<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/proyectos.php';
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
	$rayas = new proyectos($db);
	$rayas->fecha_i = $data->fecha_inicial;
	$rayas->fecha_fin = $data->fecha_final;
	$rayas->obra = $data->obra;
	//print_r($rayas);

	$stmt2 = $rayas->select_fechas();

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>Folio</th>
	            	<th>Fecha</th>
	            	<th>Descripcion</th>
	            	<th>Usuario</th>
	            	<th>Editar</th>
	            	<th>Eliminar</th>
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
								<?php echo $row[1]?>
							</td>
							<td><?php echo $row[2] ?></td>
							<td><?php echo $row[3] ?></td>
							<td></td>
							<td></td>
						</tr>
					<?php 
					}
					 ?>
	        	</tbody>  	        	
	        

		</table>
	</div>