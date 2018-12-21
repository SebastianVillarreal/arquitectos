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
            <h3 class="box-title">Conceptos</h3>
          </div>
          <div class="box-body" id="div_formulario">
            <div class="row">
              <div class="col-lg-6">
                <form action="" id="frmDatos">
                  <div class="row">
                    <div class="col-lg-6">
                      <label for="">Clave</label>
                      <input type="text" class="form-control" name="clave">
                    </div>
                    <div class="col-lg-6">
                      <label for="">Descripcion Larga</label>
                      <input type="text" class="form-control" name="descripcion">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <label for="">Unidad</label>
                      <input type="text" class="form-control" name="unidad">
                    </div>
                    <div class="col-lg-6">
                      <label for="">Cantidad Original</label>
                      <input type="text" class="form-control" name="cantidad">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <label for="">Costo Max. Subcontrato</label>
                      <input type="text" class="form-control" name="costo_max_sub">
                    </div>
                    <div class="col-lg-6">
                      <label for="">Costo Max. Destajo</label>
                      <input type="text" class="form-control" name="costo_max_des">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <label for="">Familia</label>
                      <select name="familia" id="cmb_familia" class="form-control">
                        <option value="" selected disabled>Seleccione....</option>
                        <?php 
                          $sql ="SELECT id, descripcion FROM familias";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value=$row[0]>$row[1]</option>";
                          }
                         ?>
                      </select>
                    </div>
                    <div class="col-lg-6">
                      <label for="">Proyecto</label>
                      <select name="proyecto" id="cmb_proyecto" class="form-control">
                        <option value="" selected disabled>Seleccione...</option>
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
                  <div class="row">
                    <div class="col-lg-6">
                      <label for="">Generador</label> <br>
                      <input name="generador" type="radio" value="0">Sin Generador <br>
                      <input type="radio" value="1" name="generador">Con Generador  
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="box-body" id="div_importar">
            <div class="row">
              <div class="col-lg-12">
                <form action="" id="importa">
                  <label for="">Importar</label>
                  <input type="file" name="excel">
                  <br>
                  <a href="javascript:subir_excel()" class="btn btn-danger">Guardar</a>
                </form>
              </div>
            </div>
          </div>   
          <div class="box-footer text-right">
            <a href="javascript:guardar_concepto()" class="btn btn-danger">Guardar</a>
            <a href="javascript:mostrar_importar()" class="btn btn-danger">Importar</a>
          </div>
        </div>
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">Conceptos</h3>
          </div>
          <div class="box-body">
            <?php 
              include 'tabla_conceptos.php';
             ?>  
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
    $("#cmb_familia").select2({
      allowClear: true
    });
    $("#cmb_proyecto").select2({
      allowClear: true
    });
  </script>
  <script>
    $('#lista_conceptos').DataTable( {
          'language': {"url": "../plugins/DataTables/Spanish.json"},
          "paging":   true,
          });
 </script>
</body>
</html>
