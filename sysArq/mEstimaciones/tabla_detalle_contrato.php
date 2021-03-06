<?php 
	  session_name("sysOrigen");
	  session_start();
	  $usr_name = $_SESSION['usr_login'];
	  $id_contrato = $_SESSION["id_contrato"];
	  	$id_estimacion = $_SESSION['id_estimacion'];
	  $perfil = $_SESSION["usr_groupid"];
	include '../global_settings/conexion.php';
	include_once '../api/config/database.php';
	include_once '../api/objects/estimacion.php';
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	// initialize object

	$estimacion = new estimacion($db);
	$estimacion->id = $id_estimacion;
	$stmt2 = $estimacion->read_detalle_estimacion();
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
	                <th>Descripcion Partida</th>
	                <th>Renglon</th>
	                <th>Concepto</th>
	                <th>Descripcion Larga</th>
	                <th>Estimado</th>
	                <th>Unidad</th>
	                <th>Por estimar</th>
	                <th>Cantidad</th>
	                <th>Costo</th>
	                <th>Importe</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){
					 ?>
					<tr>
						<td>
							<?php echo $row[8] ?>
						</td>
						<td><?php echo $row[2] ?></td>
						<td><?php echo $row[4] ?></td>
						<td>
							<label data-toggle="tooltip" data-placement="right" title="<?php echo $row[5] ?>"><?php echo substr($row[5], 0, 15); ?></label>
						</td>
						<td><?php echo $row[12] ?></td>
						 <td align="center"><?php echo $row[3] ?></td> 
						<td align="center"><?php echo $row[13] ?></td>
						<td align="center">

							<?php 
								if ($row[11] == 0) { ?>
									<input onchange="javascript:agregar_cantidad_estimacion(<?php echo $row[9] ?>, $(this).val(), <?php echo $id_estimacion ?>, <?php echo $perfil ?>)" type="text" class="form-control" value=<?php echo $row[10] ?>>
								<?}else{ ?>
									<a href="javascript:open_generador(<?php echo $row[9] ?>, <?php echo $id_estimacion ?>, <?php echo $id_contrato ?>)">Generador</a>
								<?}
							 ?>
							
						</td>
						<td align="center"><?php echo $row[7] ?></td>
						<td align="center">$<?php echo $row[6] ?></td>
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

