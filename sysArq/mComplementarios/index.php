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
  <link rel="stylesheet" href="style_tabs.css">
  <script src="style_tabs.js"></script>
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
            <h3 class="box-title">COMPLEMENTARIOS</h3>
          </div>
          <div class="box-body">
            <!-- Tab links -->
            <div class="tab">
              <button class="tablinks" onclick="openCity(event, 'importes')">IMPORTES</button>
              <button class="tablinks" onclick="openCity(event, 'plantillas')">Plantillas</button>
            </div>

            <!-- Tab content -->
            <div id="importes" class="tabcontent">
              <h3>IMPORTES</h3>
              <div class="row">
                <div class="col-md-3">
                  <form action="" id="form_datos">
                    <div class="row">
                      <div class="col-md-6">
                        <label for="">% Anticipo</label>
                        <input onchange="javascript:calcular_importes()" type="text" class="form-control" value="<?php echo $row[1] ?>" name="p_anticipo" id="p_anticipo">
                      </div>
                      <div class="col-md-6">
                        <label for="">Monto Anticipo</label>
                        <input type="text" value="<?php echo $row[5] ?>" readonly class="form-control" name="m_anticipo" id="m_anticipo">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <label for="">% Fondo Garantia</label>
                        <input type="text" onchange="javascript:calcular_importes()"  class="form-control" value="<?php echo $row[3] ?>"  name="p_fondo" id="p_fondo">
                      </div>
                      <div class="col-md-6">
                        <label for="">Monto Garantia</label>
                        <input type="text" readonly class="form-control" name="m_fondo" value="<?php echo $row[6] ?>" id="m_fondo">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <label for="">% IVA</label>
                        <input type="text" onchange="javascript:calcular_importes()" class="form-control" value="<?php echo $row[2] ?>" name="p_iva" id="p_iva">
                      </div>
                      <div class="col-md-6">
                        <label for="">Monto Iva</label>
                        <input type="text" value="<?php echo $row[4] ?>" readonly class="form-control" name="m_iva" id="m_iva">
                      </div>
                    </div>
<!--                     <div class="row">
                      <div class="col-md-6">
                        <label for="">% Pendiente</label>
                        <input type="text" name="m_pendiente" id="p_pendiente" class="form-control">
                      </div>
                      <div class="col-md-6">
                        <label for="">Monto pendiente</label>
                        <input readonly type="text" value="0" class="form-control">
                      </div>
                    </div> -->
                  </form>
                </div>
              </div>
            </div>

            <div id="plantillas" class="tabcontent">
              <h3>Plantillas</h3>
              <p>Paris is the capital of France.</p> 
            </div>
          </div>  
          <div class="box-footer text-right">
            <a href="javascript:guardar_importes()" class="btn btn-danger">Guardar</a>
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
