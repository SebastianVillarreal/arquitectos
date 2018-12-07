<?php
  //include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';
  include 'modal.php';
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
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">CONTRATOS DE PROVEEDORES</h3>
          </div>
          <div class="box-body">
            <div class="col-md-9">
            <form id="form_datos">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="nombre">*Proyecto:</label>
                  <select name="proyecto" class="form-control" id="">
                    <option value="">Seleccione...</option>
                    <option value="1">Amorada:</option>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                    <label class = "" for="">*Contratista:</label>
                    <select class="form-control" name="contratista" id="">
                      <option value="">Seleccione...</option>
                      <option value="1">Juan Perez</option>
                    </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="ap_materno">*Residente</label>
                  <select name="residente" id="" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="1">Luis Fernandez</option>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="id_sucursal">*Descripcion</label>
                  <input name="descripcion" type="text" class="form-control">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="">Folio</label>
                  <input readonly type="text" class="form-control">  
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="id_perfil">*Tipo de contrato</label><br>
                  <input  type="radio" value="1" name="tipo_c">Contrato mano de obra <br>
                  <input type="radio" value="2" name="tipo_c">Sub-contrato
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-9 ">
              </div>
            </div>
            </div>
            <div class="col-md-3">
              <div class="col-md-12">
                <div class="form-group form-inline">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Tipo</th>
                        <th>Descr</th>
                        <th>Valor</th>
                        <th>%</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          A
                        </td>
                        <td>Cto.normal</td>
                        <td>$<?php echo $row[0] ?></td>
                        <td>%</td>
                      </tr>
                      <tr>
                        <td>B</td>
                        <td>Cto. Extra Cliente</td>
                        <td>$<?php echo $row[1] ?></td>
                        <td>%</td>
                      </tr>
                      <tr>
                        <td>C</td>
                        <td>Cto. Extra Of</td>
                        <td>$<?php echo $row[2] ?></td>
                        <td>%</td>
                      </tr>
                      <tr>
                        <td>D</td>
                        <td>Cto. Excedido</td>
                        <td>$<?php echo $row[3] ?></td>
                        <td>%</td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                        <td>$<?php echo $row[4] ?></td>
                        <td>%</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="box-footer text-right">
            <!-- <button type="submit" class="btn btn-warning" id="guardar">Guardar</button> -->
            <a href="javascript:guardar_contrato()" class="btn btn-warning">Guardar</a>
          </div>
          </form>
        </div>
         <div class="box box-danger" id="cnt_acciones">
          <div class="box-header">
            <h3 class="box-title">Acciones</h3>
          </div>
          <div class="box-body">
            <form action ="">
              <div class="row">
                <div class="col-md-12">
                  <a href="" class="fa fa-print color-icono fa-4x"></a>
                  <a href="" class="fa fa-check fa-4x"></a>
                  <a href="" class="btn btn-danger">Finiquitar</a>
                  <a href="" class="btn btn-success">Autorizar</a>
                  <a href="" class="fa fa-times fa-2x">Cancelar contrato</a>
                  <a href="" class="btn btn-info">Complementarios</a>
                </div>
              </div>
            </form>
          </div>
          <div class="box-footer text-right">
          </div>
        </div>
        <div class="box box-danger" id="cnt_detalle_contrato">
          <div class="box-header">
            <h3 class="box-title">Renglones del contrato</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="tabla">
                <div class="table-responsive">
                  <table id="lista_detalle_contrato" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <div id="cont_table"></div>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box box-danger" id="cnt_resumen">
          <div class="box-header">
            <h3 class="box-title">Resumen</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-5">
                <table  class="table table-striped">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col" colspan="5">Resumen</th>
                    </tr>
                  </thead>
                  <tr>
                    <td>Anticipo</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</td>
                    <td>%</td>
                    <td>$</td>
                  </tr>
                  <tr>
                    <td colspan="2">Fondo de garantia</td>
                    <td>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</td>
                    <td>%</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td colspan="4">Pendiente por estimar</td>
                    <td>$500,000</td>
                  </tr>
                  <tr>
                    <td colspan="2">Impuesto al Valor Agregado</td>
                    <td>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</td>
                    <td>%</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td colspan="4">Gran Total</td>
                    <td>$1,000,000</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="box-footer text-right">
            <a class="btn btn-warning" href="javascript:guardar_contrato()">Guardar</a>
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
     $('#lista_detalle_contrato').dataTable({
       "language": {
         "url": "../assets/js/Spanish.json"
       }
     });
   });
 </script>
</body>
</html>
