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
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">CONTRATOS DE PROVEEDORES</h3>
          </div>
          <div class="box-body">
            <div class="col-md-6">
              <form id="form_datos">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="nombre">*Proyecto:</label>
                    <select name="proyecto" onchange="javascript:cargar_descripcion(1)" class="form-control" id="cmb_proyecto">
                      <option value="">Seleccione...</option>
                        <?php 
                          $sql = "SELECT id, nombre FROM proyectos WHERE activo = 1";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value='$row[0]'>$row[1]</option>";
                          }
                         ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-8">
                  <br>
                  <input type="text" id="txt_proyecto" class="form-control" readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                      <label class = "" for="">*Contratista:</label>
                      <select onchange="javascript:cargar_descripcion(2)" class="form-control" name="contratista" id="cmb_contratista">
                        <option value="">Seleccione...</option>
                        <?php 
                          $sql = "SELECT id, codigo FROM contratistas WHERE activo = 1;";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value='$row[0]'>$row[1]</option>";
                          }
                         ?>
                      </select>
                  </div>
                </div>
                <div class="col-md-8">
                  <br>
                  <input readonly type="text" class="form-control" id="txt_contratista">
                </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="ap_materno">*Residente</label>
                    <select name="residente" id="cmb_residente" onchange="javascript:cargar_descripcion(3)" class="form-control">
                      <option value="">Seleccione...</option>
                        <?php 
                          $sql = "SELECT id, codigo FROM residentes WHERE activo = 1;";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value='$row[0]'>$row[1]</option>";
                          }
                        ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-8">
                  <br>
                  <input type="text" id="txt_residente" class="form-control" readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="id_sucursal">*Descripcion</label>
                    <input name="descripcion" type="text" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="">Usuario</label>
                    <input readonly type="text" class="form-control"> 
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
                    <input  type="radio" name="tipo_c">Contrato mano de obra <br>
                    <input type="radio" name="tipo_c">Sub-contrato
                  </div>
                </div>
                <div class="col-md-4">
                  <label for="">Fecha</label>
                  <div class="input-group date" data-date-format="dd.mm.yyyy">
                      <input  type="text" class="form-control" placeholder="dd.mm.yyyy">
                      <div class="input-group-addon" >
                        <span class="glyphicon glyphicon-th"></span>
                      </div>
                  </div>
 <!--                  <div class="form-group">
                    <label for="">Fecha</label>
                    <input type="date" class="form-control">
                  </div> -->
                </div>
              </div>
              <div class="row">
                <div class="col-md-9 ">
                </div>
              </div>
              </div>
              <div class="col-md-2"></div>
              <div class="col-md-4">
                <div class="col-md-12">
                  <div class="form-group form-inline">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Tipo</th>
                          <th>Contratos</th>
                          <th>Saldo</th>
                          <th>%</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            A
                          </td>
                          <td>Cto.normal</td>
                          <td>$355,000</td>
                          <td>25%</td>
                        </tr>
                        <tr>
                          <td>B</td>
                          <td>Cto. Extra Cliente</td>
                          <td>$90,000</td>
                          <td>15%</td>
                        </tr>
                        <tr>
                          <td>C</td>
                          <td>Cto. Extra Of</td>
                          <td>$50,000</td>
                          <td>20%</td>
                        </tr>
                        <tr bgcolor="#e74c3c" style="font-size:25px">
                          <td>D</td>
                          <td>Cto. Excedido</td>
                          <td>$10,000</td>
                          <td>10%</td>
                        </tr>
                        <tr style="font-size: 20px">
                          <td></td>
                          <td></td>
                          <td>$1,000,000</td>
                          <td>100%</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          <div class="box-footer">
            <div class="">
              <button type="button" class="btn btn-danger">
                    Desautorizado <span class="badge badge-light"></span>
              </button>
              <a href="#" class="btn btn-success">Imprimir</a>
              <a href="" class="btn btn-success">Aplicar</a>
              <a href="" class="btn btn-success">Anexos</a>
              <a href="" class="btn btn-success">Autorizar</a>
              <a href="" class="btn btn-success">Finiquitar</a>
              <a href="" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="text-right">
              <a href="javascript:guardar_contrato()" class="btn btn-warning">Guardar</a>
            </div>
          </div>
          </form>
        </div>
        <div class="box box-success" id="cnt_detalle_contrato">
          <div class="box-header">
            <h3 class="box-title">Renglones del contrato</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="tabla">
              </div>
            </div>
          </div>
          <div class="box-footer">
            <div class="row">
              <div class="col-md-8">
              </div>
              <div class="col-md-4">
                <table class="table table-striped">
                  <tr>
                    <th>Subtotal:</th>
                    <td align="center">$500,000</td>

                  </tr>
                  <tr>
                    <th>IVA:</th>
                    <td align="center">$80,000</td>
                  </tr>
                  <tr>
                    <th>Total:</th>
                    <td align="center">$580,000</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6"></div>
              <div class="col-md-6">
                <table class="table">
                  <tr>
                    <th bgcolor="#2ecc71">GRAN TOTAL PRESUPUESTO</th>
                    <td style="font-size: 20px" bgcolor="#2ecc71" align="center">$500,000</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
<!--         <div class="box box-success">
          <div class="box-header">
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-8"></div>
              <div class="col-md-4">
                <table class="table table-striped">
                  <tr>
                    <th>Subtotal:</th>
                    <td align="center">$500,000</td>

                  </tr>
                  <tr>
                    <th>IVA:</th>
                    <td align="center">$80,000</td>
                  </tr>
                  <tr>
                    <th>Total:</th>
                    <td align="center">$580,000</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6"></div>
              <div class="col-md-6">
                <table class="table">
                  <tr>
                    <th bgcolor="#2ecc71">GRAN TOTAL PRESUPUESTO</th>
                    <td style="font-size: 20px" bgcolor="#2ecc71" align="center">$500,000</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div> -->
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title"></h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-5">
                <form id="frmComents">
                  <label for="">Comentarios</label>
                  <input type="text" class="form-control">
                </form>
                <table class="table table-striped">
                  <tr>
                    <th>#</th>
                    <th>Coments</th>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>Comentario de prueba</td>
                  </tr>
                </table>
              </div>
              <div class="col-md-1"></div>
              <div class="col-md-6">
                <table  class="table table-striped">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col" colspan="6" bgcolor="#2ecc71">Resumen</th>
                    </tr>
                  </thead>
                  <tr>
                    <td>ANTICIPO</td>
                    <td></td>
                    <td align="center" style="font-size: 18px" bgcolor="#e67e22">10</td>
                    <td>%</td>
                    <td></td>
                    <td>$4,105</td>
                  </tr>
                  <tr>
                    <td colspan="2">ESTIMADO</td>
                    <td></td>
                    <td></td>
                    <td bgcolor="#f1c40f">$41,500</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td colspan="4">AMORTIZADO</td>
                    <td style="color: red">-$4,105</td>
                    <td> $ 36,945.00 </td>
                  </tr>
                  <tr>
                    <td colspan="2">RETENCIÓN</td>
                    <td align="center" style="font-size: 18px" bgcolor="#e67e22">5</td>
                    <td>%</td>
                    <td></td>
                    <td  style="color: red">-$ 2,052.50 </td>
                  </tr>
                  <tr>
                    <td colspan="5">SUB-TOTAL</td>
                    <td> $ 38,997.50 </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <th>Pago sobre retenido</th>
                    <td> $ 2,052.50 </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td> $ 41,050.00 </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <th>IVA</th>
                    <td> $ 6,568.00 </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <th>TOTAL</th>
                    <td> $ 47,618.00 </td>
                </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="box-footer text-right">
            <!-- <a class="btn btn-warning" href="javascript:guardar_contrato()">Guardar</a> -->
            <!-- <button type="submit" class="btn btn-warning" id="guardar">Guardar</button> -->
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
