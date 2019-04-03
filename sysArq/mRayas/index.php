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
  <script src="../d_plantilla/bower_components/jquery/dist/jquery.min.js"></script>
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
            <h3 class="box-title">Módulo| Rayas</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="fechas" >
                <form id="frmFecha" method="POST" action="reporte.php">
                  <div class="row">
                    <div class="col-md-4">
                      <label>Obra</label>
                      <select class="form-control" id="obra">
                        <option value="" selected disabled>Seleccione...</option>
                        <?php 
                          $sql = "SELECT id, nombre FROM proyectos";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value='$row[0]'>$row[1]</option>";
                          }
                         ?>
                      </select>
                    </div>
                    <div class="col-md-4">
                      <label>Fecha Inicial</label>
                      <input type="date" name="fecha_inicial" id="fecha_inicial" value="<?php echo $fecha_uno ?>" class="form-control"> 
                    </div>
                    <div class="col-md-4">
                      <label>Fecha Final</label>
                      <input type="date" name="fecha_final" id="fecha_final" value="<?php echo $nuevafecha ?>" class="form-control">
                    </div>
                    <div class="col-md-4">
                      <br>
                      <a href="#" onclick="consultar()" class="btn btn-danger">Consultar</a>
                      <input type="submit" class="btn btn-danger" value="Generar Reporte" name="">
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="box-body" style="display: none" id="datos_raya">
            <div class="row">
              <div class="col-md-12" id="tabla" >
                <form id="frmDatos">
                  <?php include 'tabla_rayas.php'; ?>
                </form>
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
