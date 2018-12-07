<?php 
  $sql = "SELECT id, concepto FROM conceptos WHERE id_proyecto = 1 LIMIT 10";
  $exSql = mysqli_query($conexion, $sql);
  $row = mysqli_fetch_row($exSql);
 ?>
<div class="modal" id="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">Conceptos</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
          <thead>
            <th>M</th>
            <th>Concepto</th>
            <th>Tipo Conc</th>
          </thead>
          <tbody>
            <form action="" id="frmTabla">
              <?php 
                while ($row = mysqli_fetch_row($exSql)) {?>
                  <tr>
                    <td><input type="checkbox" value="<?php echo $row[0] ?>" onchange="javascript:cambiar_estado(<?php echo $row[0] ?>, this)" id="marca_<?php echo $row[0]?>">
                    <input id="concepto_<?php echo $row[0] ?>" type="hidden" value="<?php echo $row[1] ?>">
                    </td>
                    <td><?php echo $row[1] ?></td>
                    <td>
                      <select class="form-control" id="tipo_concepto_<?php echo $row[0] ?>">
                        <option value="A">A</option>
                      </select>
                    </td>
                  </tr>
                <?}
               ?>
               <input type="hidden" name="id_contrato" value="1">

           </form>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="javascript:agregar_concepto()" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>