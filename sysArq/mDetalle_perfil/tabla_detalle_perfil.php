<?php 
include '../global_settings/conexion.php';
	$cadena_modulos = "SELECT
	detalle_perfil.id,
	sec_groups.description,
	modulos.nombre 
FROM
	detalle_perfil
	INNER JOIN sec_groups ON detalle_perfil.id_perfil = sec_groups.group_id
	INNER JOIN modulos ON detalle_perfil.id_modulo = modulos.id";
	//Restricción para una sola verificación
	//AND lista_proyectos.verificado='0'

	$consulta = mysqli_query($conexion, $cadena_modulos);
 ?>
	<div class="table-responsive">
        <table id="lista_perfiles" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th width="5%">#</th>
	                <th>Perfil</th>
	                <th>Módulo</th>
	                <th width="10%">Editar</th>
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