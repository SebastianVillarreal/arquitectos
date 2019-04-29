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
  <script src="funciones.js?v=<?php echo(rand()); ?>"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" onload="javascript:blanco()">
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
            <h3 class="box-title">Contratistas</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <form action="">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="">Nombre</label>
                      <input type="text" class="form-control" name="nombre" id="nombre">
                    </div>
                    <div class="col-md-4">
                      <label for="">Apellido paterno</label>
                      <input type="text" class="form-control" name="ap_paterno" id="ap_paterno"> 
                    </div>
                    <div class="col-md-4">
                      <label for="">Apellido materno</label>
                      <input type="text" class="form-control" name="ap_materno" id="ap_materno"> 
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <label>Codigo</label>
                      <input type="text" name="codigo" class="form-control" id="codigo">
                    </div>
                    <div class="col-md-4">
                      <label>Razon Social</label>
                      <input type="text" name="razon_social" class="form-control" id="razon">
                    </div>
                    <div class="col-md-4">
                      <label>Persona Moral</label>
                      <input type="text" name="persona_moral" class="form-control" id="p_moral">
                    </div>                    
                  </div>

                  <div class="row">

                  </div>
                </form>
              </div>
            </div>
          </div>  
          <div class="box-footer text-right">
            <a href="javascript:guardar_contratista()" class="btn btn-danger">Guardar</a>
          </div>
        </div>
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">Lista de contratistas</h3>
          </div>
          <div class="box-body" id="contenedor_tabla">
            <?php 
              include 'tabla_contratistas.php';
             ?>
          </div>
          <div class="box-footer"></div>
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
  <script>
    $('#lista_contratistas').DataTable( {
          'language': {"url": "../plugins/DataTables/Spanish.json"},
          "paging":   true,
          });
 </script>
</body>
</html>
