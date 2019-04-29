<?php
  include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';

 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
  <script src="funciones.js?v=<?php echo(rand()); ?>"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" onload="javascript:cargar_contratistas()">
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
            <h3 class="box-title">Lista de asistencia</h3>
            <br>
            <br>
            <div class="row">
              <div class="col-md-6">
                  <label>Contratista</label>
                  <select class="form-control" id="cmbContratistas" onchange="cargar_empleados_asis($(this).val())">
                    <option></option>
                  </select>
              </div>
            </div>
            <br>
            
          </div>
          <div class="box-body">
            <div class="row">
              <form id="frmDatos">
                <div class="col-md-12" id="tabla">
                    <?php include 'tabla_personas.php'; ?>
                </div>
              </form>
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

 function cargar_empleados_asis(contratista){
    var url = "tabla_personas_asistieron.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "contratista": contratista
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#tabla').html(text);
        });
    });
}
 </script>
</body>
</html>
