<?php 
//include '../global_seguridad/verificar_sesion.php';
	$cadena_modulos = "SELECT id, nombre, nombre_carpeta, descripcion FROM modulos";
	//Restricción para una sola verificación
	//AND lista_proyectos.verificado='0'

	$consulta = mysqli_query($conexion, $cadena_modulos);
 ?>
	<div class="table-responsive">
        <table id="lista_modulos" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th width="5%">#</th>
	                <th>Nombre</th>
	                <th>Nombre de la Carpeta</th>
	                <th>Descripción</th>
	                <th>Editar</th>
	            </tr>
	        </thead>
	        <tbody>
	        <?php 
	        	while($row = mysqli_fetch_row($consulta))
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
						<td class="text-center">
							<a href="editar_modulo.php?id=<?php echo $row[0] ?>" class="btn btn-danger text-center">Editar</a>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>