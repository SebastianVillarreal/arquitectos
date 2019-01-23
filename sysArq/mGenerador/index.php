<?php
  //include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';
  session_name("sysOrigen");
  session_start();
  $id_renglon = $_SESSION['id_renglon'];
  $id_contrato = $_SESSION['id_contrato'];


 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
  <script src="funciones.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" onload="javascript:cargar_combo_zona()">
<div class="wrapper">

  <header class="main-header">
    <?php include '../header.php'; ?>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <?php include 'menuV.php'; ?>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Generador</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <!-- <a href="javascript:validar($('#txtTotal').val(), $('#cmbCuartos').val(), $('#txtLargo').val(), $('#txtAncho').val())" class="btn btn-danger" id="btnNew">Nuevo</a> -->
                <button class="btn btn-danger" onclick="javascript:validar($('#txtTotal').val(), $('#cmbCuartos').val(), $('#txtLargo').val(), $('#txtAncho').val()" id="btnNew" >Nuevo</button>
              </div>
            </div>
            <br>
            <div class="row" id="frmGenerador">
              <form id="frmDatos">
                <div class="col-md-2">
                    <label>Zona</label>
                    <select onchange="javascript:cargar_combo_area($(this).val())" name="zona" id="cmbZona" class="form-control">
                      <option></option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Area</label>
                    <select onchange="javascript:cargar_combo_cuarto($(this).val())" name="area" id="cmbArea" class="form-control">
                      <option></option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Cuarto</label>
                    <select name="cuarto" id="cmbCuartos" class="form-control">
                      <option></option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Largo</label>
                    <input type="text" id="txtLargo" name="txtLargo" class="form-control">
                </div>
                <div class="col-md-2">
                    <label>Ancho</label>
                    <input type="text" onchange="javascript:calcular_area($('#txtLargo').val(), $(this).val())" id="txtAncho" name="txtAncho" class="form-control">
                </div>
                <div class="col-md-2">
                  <label>Total</label>
                  <input type="text" onblur="javascript:validar()" name="txtTotal" id="txtTotal" class="form-control" readonly>
                </div>
              </form>
            </div>
            <br>
            <hr>
            <div class="row">
              <div class="col-md-12" id="tabla">
                <?php include 'tabla_contratos.php'; ?>
              </div>
            </div>
          </div>
        </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <?php include '../footer2.php'; ?>

  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<?php include '../footer.php'; ?>
    <script>
   $(document).ready(function() {
     $('#lista_contratos').dataTable({
       "language": {
         "url": "../assets/js/Spanish.json"
       }
     });
   });
 </script>
<!--  <script>
  $(function () {
    $('#proveedor').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_proveedores.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term // search term
      };
     },
     processResults: function (response) {
       return {
          results: response
       };
     },
     cache: true
    }
    })
  })
</script>
 --></body>
</html>
