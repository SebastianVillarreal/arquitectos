<?php 
	  session_name("sysOrigen");
	  session_start();
	  $usr_name = $_SESSION['usr_login'];
	  $id_contrato = $_SESSION["id_contrato"];
	  $perfil = $_SESSION["usr_groupid"];
	include '../global_settings/conexion.php';
	include_once '../api/config/database.php';
	include_once '../api/objects/detalle_contrato.php';
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	$select = mysqli_query($conexion, "SELECT tipo_contrato FROM contratos WHERE id = '$id_contrato'");
	$r_s = mysqli_fetch_row($select);
	$tipo_contrato = $r_s[0];
	// initialize object
	$detalle_contrato = new detalle_cont($db);
	$detalle_contrato->id_contrato = $id_contrato;
	$stmt2 = $detalle_contrato->read();



 ?>
	    <script>
    		$('#lista_detalle_contrato').DataTable( {
          	'language': {"url": "../plugins/DataTables/Spanish.json"},
          	"paging":   true,
          	});
 		</script>
	<div class="table-responsive">
        <table id="lista_detalle_contrato" class="table  table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>Tipo</th>
	                <th>Cons</th>
	                <th>Contr</th>
	                <th>Desc. Partida</th>
	                <th><a href="javascript:modal(<?php echo $id_contrato ?>, <?php echo $tipo_contrato ?>)">Concepto</a></th>
	                <th>Descripcion Larga</th>
	                <th>Unidad</th>
	                <th>Gen</th>
	                <th>Cantidad</th>
	                <th>Cantidad O.C</th>
	                <th>Costo Actual</th>
	                <th>Costo Tope</th>
	                <th>Importe</th>
	                <th>Total contratos</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
	        			$sql = "SELECT MAX(consecutivo)FROM contratos WHERE id = '$row[13]'";
	        			$exSql = mysqli_query($conexion, $sql);
	        			$r = mysqli_fetch_row($exSql);
					?>
					<?php if ($r[0] == $row[3]) {
						echo "<tr>";
					}else{
						echo "<tr bgcolor='#ecf0f1'>";
					} ?>
					
						<td>
							<?php echo $row[1] ?>
						</td>
						<td><?php echo $row[2] ?></td>
						<td><?php echo $row[3] ?></td>
						<td>
							<?php echo $row[4]; ?>
						</td>
						<td><?php echo $row[5] ?></td>
						 <td><label data-toggle="tooltip" data-placement="right" title="<?php echo $row[6] ?>"><?php echo substr($row[6], 0, 15); ?></label></td> 
						<td align="center"><?php echo $row[7] ?></td>
						<td align="center"><a href=""><i class="fas fa-calculator fa-2x"></i></a></td>
						<?php 
							if ($r[0] == $row[3]) {?>
								<td>
									<input onchange="javascript:agregar_cantidad_concepto(<?php echo $row[0] ?>, $(this).val(), '<?php echo $row[1] ?>', <?php echo $perfil ?>)" type="text" class="form-control" value="<?php echo $row[8] ?>">
								</td>
								<?php 
								
									echo "<td>$row[9]</td>";
								 ?>
								<td>							
									<input onchange="javascript:modificar_costo(<?php echo $row[0] ?>, $(this).val(), '<?php echo $row[1] ?>', <?php echo $perfil ?>)" type="text" class="form-control" value="<?php echo $row[10] ?>">
								</td>
							<? }else{?>
									<td> 
										<?php echo $row[8] ?>
									</td>
									<?php 
										echo "<td>$row[9]</td>";
									 ?>
									
									<td><?php echo $row[10] ?></td>
							<? }
						 ?>
						<td><?php echo $row[11] ?></td>
						<td><?php echo $row[12] ?></td>
						<td class="text-center">
							<?php echo "$". $row[14] ?>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>
	<script>
		$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
	</script>

