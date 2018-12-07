<?php 
	
	include_once '../api/config/database.php';
	include_once '../api/objects/detalle_contrato.php';
	// instantiate database and product object
	$database = new Database();
	$db = $database->getConnection();
	$json = json_decode(file_get_contents('php://input')); 
	$id_contrato = $json->id_contrato;
	// initialize object
	$detalle_contrato = new detalle_cont($db);
	$detalle_contrato->id_contrato = $id_contrato;
	$stmt2 = $detalle_contrato->read();

 ?>
	        <thead>
	            <tr>
	                <th width="5%" colspan="3">Renglon(Contrato)</th>
	                <th>Desc. Partida</th>
	                <th><a href="javascript:modal()">Concepto</a></th>
	                <th>Descripcion Larga</th>
	                <th>Unidad</th>
	                <th width="10%">Cantidad</th>
	                <th>Cantidad O.C</th>
	                <th>Costo Actual</th>
	                <th>Costo</th>
	                <th>Importe</th>
	                <th>Total contratos</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while ($row = $stmt2->fetch(PDO::FETCH_NUM)){	
					?>
					
					<tr>
						<td>
							<?php echo $row[1]; ?>
						</td>
						<td>
							<?php echo $row[2]?>
						</td>
						<td>
							<?php echo $row[3]; ?>
						</td>
						<td>
							<?php echo $row[4]; ?>
						</td>
						<td><?php echo $row[5] ?></td>
						<td><?php echo $row[6] ?></td>
						<td><?php echo $row[7] ?></td>
						<td><?php echo $row[8] ?></td>
						<td><?php echo $row[9] ?></td>
						<td><?php echo $row[10] ?></td>
						<td><?php echo $row[11] ?></td>
						<td><?php echo $row[12] ?></td>
						<td class="text-center">
							
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		
	