<?php 
  session_name("sysOrigen");
  session_start();
    include '../global_settings/conexion.php';
  $usr_name = $_SESSION['usr_login'];
  $id_contrato = $_SESSION["id_contrato"];
  $perfil = $_SESSION['usr_groupid'];
  $id_proyecto = $_POST["id_referencia"];

  $s_p = "SELECT nombre FROM contratos WHERE id = '$id_contrato'";
  $exS = mysqli_query($conexion, $s_p);
  $row_p = mysqli_fetch_row($exS);

  $sql = "SELECT id, descripcion_larga FROM conceptos WHERE id_proyecto = '$row_p[0]'  AND cantidad_original > 0 ORDER BY descripcion_partida";
  //echo "$sql";
  $exSql = mysqli_query($conexion, $sql);
  $row = mysqli_fetch_row($exSql);
 ?>
   <script>
    $('#lista_conceptos').DataTable( {
          'language': {"url": "../plugins/DataTables/Spanish.json"},
          "paging":   true,
          });
 </script>
          <table class="table" id="lista_conceptos">
            <thead>
              <th>M</th>
              <th>Concepto</th>
              <th>Tipo Conc</th>
            </thead>
            <tbody>
              
                <?php 
                  while ($row = mysqli_fetch_row($exSql)) {?>
                    <tr>
                      <td><input type="checkbox" value="<?php echo $row[0] ?>" onchange="javascript:cambiar_estado(<?php echo $row[0] ?>, this)" id="marca_<?php echo $row[0]?>">
                      </td>
                      <td><?php echo $row[1] ?></td>
                      <td>
                        <select class="form-control" id="tipo_concepto_<?php echo $row[0] ?>">
                          <option value="A">A</option>
                          <option value="B">B</option>
                          <option value="C">C</option>
                          <option value="D">D</option>
                        </select>
                      </td>
                    </tr>
                  <?}
                 ?>

            </tbody>
          </table>