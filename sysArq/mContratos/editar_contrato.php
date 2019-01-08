<?php
  session_name("sysOrigen");
  session_start();
  $usr_name = $_SESSION['usr_login'];
  $id_contrato = $_SESSION["id_contrato"];

   //include '../global_seguridad/verificar_sesion.php';
  include '../global_settings/conexion.php';

 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
  <script src="funciones.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" onload="javascript:datos_contrato(<?php echo $id_contrato ?>)">
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
                    <select name="proyecto" readonly onchange="javascript:cargar_descripcion(1)" class="form-control" id="cmb_proyecto">
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
                      <select readonly onchange="javascript:cargar_descripcion(2)" class="form-control" name="contratista" id="cmb_contratista">
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
                    <select readonly name="residente" id="cmb_residente" onchange="javascript:cargar_descripcion(3)" class="form-control">
                      <option value="">Seleccione...</option>
                        <?php 
                          $sql = "SELECT id, nombre_usuario FROM usuarios WHERE id_perfil = 3";
                          $exSql = mysqli_query($conexion, $sql);
                          while ($row = mysqli_fetch_row($exSql)) {
                            echo "<option value='$row[1]'>$row[1]</option>";
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
                    <input name="descripcion" readonly id="txt_descripcion" type="text" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="">Usuario</label>
                    <input readonly type="text" value="<?php echo $usr_name ?>" class="form-control"> 
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="">Folio</label>
                    <input readonly type="text" id="txtFolio" class="form-control">  
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="id_perfil">*Tipo de contrato</label><br>
                    <input value="1" id="radio_1"  type="radio" name="tipo_c">Contrato mano de obra <br>
                    <input value="2"  id="radio_2" type="radio" name="tipo_c">Sub-contrato
                  </div>
                </div>
                <div class="col-md-4">
                  <label for="">Fecha</label>
                  <div class="input-group date" data-date-format="dd.mm.yyyy">
                      <input readonly  type="text" class="form-control" id="fecha" placeholder="dd.mm.yyyy">
                      <div class="input-group-addon" >
                        <span class="glyphicon glyphicon-th"></span>
                      </div>
                  </div>
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
                          <td id="cto_normal">$</td>
                          <td id="p_normal">%</td>
                        </tr>
                        <tr>
                          <td>B</td>
                          <td>Cto. Extra Cliente</td>
                          <td id="cto_extra_cliente">$</td>
                          <td id="p_ec">%</td>
                        </tr>
                        <tr>
                          <td>C</td>
                          <td>Cto. Extra Of</td>
                          <td id="cto_extra_of">$</td>
                          <td>%</td>
                        </tr>
                        <tr bgcolor="#e74c3c" style="font-size:25px">
                          <td>D</td>
                          <td>Cto. Excedido</td>
                          <td id="cto_excedido">$</td>
                          <td id="p_ex">-%</td>
                        </tr>
                        <tr style="font-size: 20px">
                          <td></td>
                          <td></td>
                          <td id="total_si">$</td>
                          <td>100%</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          <div class="box-footer">
            <?php                    
              $sql = "SELECT estatus_contratos.descripcion FROM contratos INNER JOIN
                    estatus_contratos ON estatus_contratos.id = contratos.id = contratos.id WHERE contratos.id
                    = $id_contrato";
                    echo "$sql";
                    $estatus = mysqli_query($conexion, $sql);
                    $resultado = mysqli_fetch_row($estatus); 
            ?>

            <div class="">
              <button type="button" class="btn btn-success" >
                     <span class="badge badge-light"></span>

                    <?php 

                    echo $resultado[0];
                    ?>

              </button>
              <a href="javascript:add_concepts()" class="btn btn-success">Agregar</a>
              <a href="#" class="btn btn-success">Imprimir</a>

              <a href="" class="btn btn-success">Aplicar</a>
              <a href="../mComplementarios/" class="btn btn-success">Anexos</a>
              <a href="javascript:cambiar_estatus(1)" class="btn btn-success">Autorizar</a>
              <a href="javascript:rechazar(1)" class="btn btn-success">Rechazar</a>
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
              <div class="col-md-12" id="cont_table">
                
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
                    <td align="center" id="tdSubTotal">$</td>

                  </tr>
                  <tr>
                    <th>IVA:</th>
                    <td align="center" id="tdIva">$</td>
                  </tr>
                  <tr>
                    <th>Total:</th>
                    <td align="center" id="tdTotal">$</td>
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
                    <td id="tdGtPresupuesto" style="font-size: 20px" bgcolor="#2ecc71" align="center">$</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title"></h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-5">
               
                  <label for="">Comentarios</label>
                  <input type="text" id="comentarios" name="comentarios" onkeyup = "if(event.keyCode == 13) agregar_comentarios($(this).val())" class="form-control">
                
                <div id="tabla_coments"></div>
              </div>
              <div class="col-md-1"></div>
              <div class="col-md-6" id="contenedor_tabla_resumen">

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

<?php include '../footer.php'; 
        include 'modal.php';
?>

  <script>
    $('#lista_conceptos').DataTable( {
          'language': {"url": "../plugins/DataTables/Spanish.json"},
          "paging":   true,
          });
 </script>
</body>
</html>
