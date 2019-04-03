<?php 
include '../global_settings/conexion.php';
	$cadena_modulos = "SELECT id, folio_erp, concepto, total, fecha FROM captura_rayas_Extras";
	//Restricción para una sola verificación
	//AND lista_proyectos.verificado='0'

	$consulta = mysqli_query($conexion, $cadena_modulos);
 ?>
 <script type="text/javascript">
 	  function estilo_tablas () {
    $('#lista_categorias').DataTable({
      'paging'    : true,
      'lengthChange'  : true,
      'searching'   : true,
      'ordering'    : true,
      'info'      : true,
      'autoWidth'   : true,
      'language'    : {"url": "../plugins/DataTables/Spanish.json"}
    })
   } 
 </script>
	<div class="table-responsive">
        <table id="lista_categorias" class="table table-striped table-bordered" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th width="5%">#</th>
	                <th>Folio ERP</th>
	                <th>Concepto</th>
	                <th>Total</th>
	                <th>Fecha</th>
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
							<?php echo $row[4] ?>
						</td>
					</tr>
				<?php 
				}
				 ?>
	        </tbody>  
		</table>
	</div>