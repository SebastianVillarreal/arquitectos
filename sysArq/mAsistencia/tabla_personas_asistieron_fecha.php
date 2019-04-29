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
	 date_default_timezone_set('America/Monterrey');
  	$fecha = date('Y-m-d');
  	$hora = date('H:i:s');
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	
 	// initialize object
	$rayas = new rayas($db);
	$rayas->contratista = $data->contratista;
	$rayas->fecha_i = $data->fecha;
	//print_r($rayas);
	$stmt2 = $rayas->read_asistencia();
	echo "Asistieron";

 ?>

	<div class="table-responsive">
        <table id="lista_contratos" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	            	<th>#</th>
	                <th>Persona</th>
	                <th>Puesto</th>
	                <th>Seleccionar</th>
	                <th>Obra</th>
	            </tr>
	        </thead>
	       
		        <tbody>
	        		<?php 
		        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
		        		$var = "";
		        		$value = 0;
		        		if ($row[2] == 1 || $row[2] == 0.5) {
		        			$var = checked;
		        			$value = 1;
		        		}
						?>
						<tr>
							<td align="center">
								<?php echo $row[0]?>
								<input type="hidden" value="<?php echo $row[0] ?>"	 name="contratista[]">
							</td>
							<td align="center"><?php echo $row[1] ?></td>
							<td align="center"><?php echo $row[4] ?></td>
							<td align="center">
								<input type="checkbox" <?php echo $var ?> name="marca" id="<? echo $row[0] ?>" onchange="asistir(<?php echo $row[0] ?>, this)">
								<input type="hidden" name="cal[]" id="cal_<? echo $row[0]?>" value="<?php echo $value ?>">
							</td>
							<td>
								<select class="form-control" name="obra[]" id="obra_<? echo $row[0] ?>">
									<option >Seleccione...</option>
									
									<?php 
										$sql = "SELECT id, nombre FROM proyectos";
										$exSql = mysqli_query($conexion, $sql);
										while ($row_obra = mysqli_fetch_row($exSql)) {
											$s="";
											if ($row[3] == $row_obra[0]) {
												$s = selected;
											}
											echo "<option value=$row_obra[0] $s>$row_obra[1]</option>";
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