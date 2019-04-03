
<div class="modal" id="modal_conceptos" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">Conceptos</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  id="frmTabla2">
           <input type="hidden" name="id_contrato" id="id_contrato">
           <input type="hidden" name="tipo_contrato" id="tipo_contrato">
           <div id="tabla"></div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="javascript:agregar_concepto()" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
