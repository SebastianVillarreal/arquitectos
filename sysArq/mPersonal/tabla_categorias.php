<?php 
include '../global_settings/conexion.php';
	$cadena_modulos = "SELECT
							personas.id,
							CONCAT( personas.nombre, ' ', personas.ap_paterno, ' ', ap_materno ),
							usuarios.nombre_usuario,
							perfil.description 
						FROM
							personas
							INNER JOIN usuarios ON personas.id = usuarios.id_persona
							INNER JOIN sec_groups perfil ON usuarios.id_perfil = perfil.group_id";
	//Restricción para una sola verificación
	//AND lista_proyectos.verificado='0'

	$consulta = mysqli_query($conexion, $cadena_modulos);
 ?>
	<div class="table-responsive">
        <table id="lista_categorias" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th width="5%">#</th>
	                <th>Nombre completo</th>
	                <th>Nombre usuario</th>
	                <th>perfil</th>
	                <th width="10%">Contraseña</th>
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
							<a href="editar_modulo.php?id=<?php echo $row[0] ?>" class="btn btn-danger text-center">Restaurar</a>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>