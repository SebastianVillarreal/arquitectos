<?php 
	  session_name("sysOrigen");
	  session_start();
	  $usr_name = $_SESSION['usr_login'];
	  $id_contrato = $_SESSION["id_contrato"];
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

	<div class="table-responsive">
        <table id="lista_detalle_contrato" class="table table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>Tipo</th>
	                <th>Cons</th>
	                <th>Contr</th>
	                <th>Desc. Partida</th>
	                <th>Concepto</th>
	                <th>Descripcion Larga</th>
	                <th>Unidad</th>
	                <th>Cantidad</th>
	                <th>Costo Actual</th>
	                <th>Costo Tope</th>
	                <th>Importe</th>

	            </tr>
	        </thead>

	        <tbody>

	        <?php 

						<td><?php echo $row[12];
						 ?></td>

						
					</tr>
					<tr>
						

					</tr>
				<?php 
				$n = $n+1;
			}
				 ?>
				 <td class="text-center">
					<?php 
					echo "$" .$row[14];?>
				 </td>
	        </tbody>  
		</table>

	</div>


