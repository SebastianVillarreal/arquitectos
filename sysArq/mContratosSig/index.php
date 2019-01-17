<?php
  include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';

 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
  <script src="funciones.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini">
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
            <h3 class="box-title">Contratos Siguientes</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <label>Obra</label>
                <select onchange="javascript:filtrar($(this).val())" class="form-control" name="proyecto">
                  <option>Seleccione...</option>
                  <?php 
                    $sql = "SELECT id, nombre FROM proyectos";
                    $exSql = mysqli_query($conexion, $sql);
                    while ($row = mysqli_fetch_row($exSql)) {
                      echo "<option value=$row[0]>$row[1]</option>";
                    }
                   ?>
                </select>
              </div>
          </div>
          <br>
            <div class="row">
              <div class="col-md-12" id="tabla">
                <?php include 'tabla_blanco.php'; ?>
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
</body>
</html>
