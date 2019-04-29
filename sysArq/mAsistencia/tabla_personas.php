<?php 	 
	// include database and object files
	include_once '../api/config/database.php';
	include_once '../api/objects/rayas.php';
	include '../global_settings/conexion.php';
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
	date_default_timezone_set('America/Monterrey');
	$fecha = date('Y-m-d');
 	// initialize object
	$rayas = new rayas($db);
	$rayas->contratista = $data->contratista;
	$rayas->fecha_i = $fecha;
	//print_r($rayas);
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
	                <th>Obra</th>
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
							<td>
								<select class="form-control" name="obra[]">
									<option value="0" selected>Seleccione...</option>
									<?php 
										$sql = "SELECT id, nombre FROM proyectos";
										$exSql = mysqli_query($conexion, $sql);
										while ($row_obra = mysqli_fetch_row($exSql)) {
											echo "<option value=$row_obra[0]>$row_obra[1]</option>";
										}
									 ?>
								</select>
						</td>
						</tr>
					<?php 
					}
					 ?>
	        	</tbody>  	        	
	        

		</table>
	</div>