<?php
  //include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';
  session_name("sysOrigen");
  session_start();
  $id_contrato = $_SESSION['id_contrato'];
  $s = "SELECT id, p_anticipo, p_iva, p_fondo_garantia, t_iva, t_anticipo, t_fondo_garantia FROM importes WHERE id_contrato = '$id_contrato' ORDER BY id DESC LIMIT 1";
  $exS = mysqli_query($conexion, $s);
  $row = mysqli_fetch_row($exS);
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
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">Dias festivos</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <form action="" id="frmDatos">
                  <div class="col-md-6">
                    <label>Fecha</label>
                    <input type="date" name="fecha" class="form-control">
                  </div>
                  <div class="col-md-6">
                    <label for="">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                  </div>
                </form>
              </div>
            </div>
          </div>  
          <div class="box-footer text-right">
            <a href="javascript:guardar_fecha()" class="btn btn-danger">Guardar</a>
          </div>
        </div>
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">Lista de dias festivos</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <div id="contenedor_tabla">
                  <?php include 'tabla_fechas.php'; ?>
                </div>
              </div>
            </div>
          </div>  
          <div class="box-footer text-right">
            <a href="javascript:guardar_fecha()" class="btn btn-danger">Guardar</a>
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
     $('.input-group.date').datepicker({format: "dd/mm/yyyy"});
    $("#cmb_proyecto").select2({
      allowClear: true
    });
    $("#cmb_contratista").select2({
      allowClear: true
    });
    $("#cmb_residente").select2({
      allowClear: true
    });
  </script>
</body>
</html>
