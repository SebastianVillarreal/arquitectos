<?php
  include '../global_seguridad/verificar_sesion.php';
 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
  <script type="text/javascript" src="funciones.js?v=<?php echo(rand());?>"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" onload="">
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
            <h3 class="box-title">Captura de estimaciones</h3>
          </div>
          <div class="box-body">
            <form method="POST" id="form_datos">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="nombre">*Folio contrato ERP</label>
                  <input type="text" name="folio" id="folio" class="form-control" placeholder="Ingresa un folio">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_paterno">*Concepto</label>
                  <input type="text" name="concepto" id="concepto" class="form-control" placeholder="Ingresa un concepto">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_materno">*Total</label>
                  <input type="text" name="total" id="total" class="form-control" placeholder="Ingresa un total">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                <label>Proyecto</label>
                <select class="form-control" name="proyecto" id="cmbProyectos">
                  <option disabled selected>Seleccione...</option>
                  <?php 
                    $sql = "SELECT id, nombre FROM proyectos WHERE activo = 1";
                    $exSQl=mysqli_query($conexion, $sql);
                    while ($row = mysqli_fetch_row($exSQl)) {
                      echo "<option value='$row[0]'>$row[1]</option>";
                    }
                   ?>
                </select>
              </div>
              <div class="col-md-4">
                <label>Contratista</label>
                <select class="form-control" name="contratista" id="cmbContratistas">
                  <option disabled selected>Seleccione...</option>
                  <?php 
                    $sql2 = "SELECT id, CONCAT(nombre, ' ',  IFNULL(ap_paterno, ''), ' ', IFNULL(ap_materno, '')) FROM contratistas";
                    $exSQl2= mysqli_query($conexion, $sql2);
                    while ($row = mysqli_fetch_row($exSQl2)) {
                      echo "<option value=$row[0]>$row[1]</option>";
                    }
                   ?>
                </select>
              </div>
              <div class="col-md-4">
                <label>Fecha</label>
                <input type="date" name="fecha" class="form-control" id="fecha">
              </div>
            </div>
          </div>
          <div class="box-footer text-right">
            <a href="#" class="btn btn-warning" id="btnAutorizar" disabled>Autorizar</a>
            <a href="#" onclick="guardar_registro();" id="btnGuardar" class="btn btn-warning">Guardar</a>
          </div>
          </form>
        </div>
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Pendientes de autorizar</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="tabla">
                <?php include 'tabla_categorias.php'; ?>
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
<!-- Page script -->
 <script type="text/javascript">
    function estilo_tablas () {
    $('#lista_categorias').DataTable({
      'paging'    : true,
      'lengthChange'  : true,
      'searching'   : true,
      'ordering'    : true,
      'info'      : true,
      'autoWidth'   : true,
      'language'    : {"url": "../plugins/DataTables/Spanish.json"}
    })
   } 
   </script>
<script>
 
  $(function (){
   estilo_tablas();
  })
    $.validator.setDefaults( {
      submitHandler: function () {
        var url = "insertar_personal.php"; // El script a dónde se realizará la petición.
          $.ajax({
                 type: "POST",
                 url: url,
                 data: $("#form_datos").serialize(), // Adjuntar los campos del formulario enviado.
                 success: function(respuesta)
                 {
                  if (respuesta=="ok") {
                    alertify.success("Registro guardado correctamente");
                  }else if(respuesta=="duplicado"){
                    alertify.error("El registro ya existe");
                  }else {
                    alertify.error("Ha ocurrido un error");
                  }
                  $(":text").val(''); //Limpiar los campos tipo Text
                  $("#lista_categorias").DataTable().destroy();
                  $("#tabla").load("tabla_categorias.php");
                  $("#lista_categorias").DataTable();
                 }
               });
          // Evitar ejecutar el submit del formulario.
          return false;
      }
    });
    $( document ).ready( function () {
      $( "#form_datos" ).validate( {
        rules: {
          nombre: "required",
          ap_paterno: "required",
          ap_materno: "required"
        },
        messages: {
          nombre: "Campo requerido",
          ap_paterno: "Campo requerido",
          ap_materno: "Campo requerido"
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
          // Add the `help-block` class to the error element
          error.addClass( "help-block" );

          if ( element.prop( "type" ) === "checkbox" ) {
            error.insertAfter( element.parent( "label" ) );
          } else {
            error.insertAfter( element );
          }
        },
        highlight: function ( element, errorClass, validClass ) {
          $( element ).parents( ".col-md-4" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
          $( element ).parents( ".col-md-4" ).addClass( "has-success" ).removeClass( "has-error" );
        }
      });
    });
  </script>
</body>
</html>
