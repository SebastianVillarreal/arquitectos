<?php
  include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';

 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; 
  date_default_timezone_set('America/Monterrey');
$fecha=date("Y-m-d");
$nuevafecha = strtotime ( '-1 day' , strtotime ( $fecha ) ) ;
$nuevafecha = date ( 'Y-m-d' , $nuevafecha );
$fecha_uno = strtotime ( '-8 day' , strtotime ( $fecha ) );
$fecha_uno = date('Y-m-d', $fecha_uno);
$hora=date ("h:i:s");
  ?>

  <script src="funciones.js"></script>
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
            <h3 class="box-title">Reporte de asistencia</h3>
            <br>
            <br>
            <form action="reporte.php" method="POST">
              <div class="row">
                <div class="col-md-3">
                    <label>Contratista</label>
                    <select class="form-control" id="cmbContratistas" name="contratista">
                      <option></option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label>Fecha Inicial</label>
                    <input type="date" name="fecha_inicial" class="form-control" value="<?php echo $fecha_uno ?>">
                </div>
                <div class="col-md-3">
                    <label>Fecha Final</label>
                    <input type="date" value="<?php echo $nuevafecha ?>" name="fecha_final" class="form-control">
                </div>
              </div>
              <br>
              <input type="submit" value="Reporte detallado" class="btn btn-danger">
            </form>
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
 </script>
</body>
</html>
