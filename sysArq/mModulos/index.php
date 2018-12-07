<?php
  include '../global_seguridad/verificar_sesion.php';
 ?>
<!DOCTYPE html>
<html>
<head>
  <?php include '../head.php'; ?>
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
            <h3 class="box-title">Registro de M&oacute;dulos del Sistema</h3>
          </div>
          <div class="box-body">
            <form method="POST" id="form_datos">
            <div class="row">
              <div class="col-md-3">
                <div class="form-group">
                  <label for="nombre_modulo">*Nombre del M&oacute;dulo</label>
                  <input type="text" name="nombre_modulo" id="nombre_modulo" class="form-control" placeholder="Nombre del m&oacute;dulo">
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label for="nombre_carpeta">*Nombre de la carpeta</label>
                  <input type="text" name="nombre_carpeta" id="nombre_carpeta" class="form-control" placeholder="Nombre de la carpeta">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="descripcion_modulo">*Descripci&oacute;n</label>
                  <input type="text" name="descripcion_modulo" id="descripcion_modulo" class="form-control" placeholder="A&ntilde;ade una descripci&oacute;n">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="id_categoria">*Categoría</label>
                  <select name="id_categoria" id="id_categoria" class="form-control select2">
                    <option value=""></option>
                    <?php
                      $cadena_categoria = "SELECT id, nombre FROM categorias_modulos WHERE activo = '1'";
                      $consulta_categoria = mysqli_query($conexion, $cadena_categoria);
                      while ($row_categoria = mysqli_fetch_row($consulta_categoria)) {
                      ?>
                      <option value="<?php echo $row_categoria[0] ?>"><?php echo $row_categoria[1] ?></option>
                      <?php
                       } 
                    ?>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="icono">*Icono</label>
                  <input type="text" name="icono" id="icono" class="form-control" placeholder="ej. ion-document-text">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="tema">*Tema</label>
                  <select name="tema" id="tema" class="form-control select2">
                    <option value=""></option>
                    <option value="bg-green">Verde</option>
                    <option value="bg-aqua">Aqua</option>
                    <option value="bg-red">Rojo</option>
                    <option value="bg-yellow">Amarillo</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3">
                <div class="form-group">
                  <label>
                    <input type="checkbox" name="panel_control" id="panel_control" class="minimal-red" value="1" checked>
                    Mostrar en Panel de Control
                  </label>
                </div>
              </div>
            </div>
          </div>
           <div class="box-footer text-right">
            <button type="submit" class="btn btn-warning" id="guardar">Guardar</button>
          </div>
          </form>
        </div>
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Lista de Módulos Existentes</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="tabla">
                <?php include 'tabla_modulos.php'; ?>
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
<script>
  function estilo_tablas () {
    $('#lista_modulos').DataTable({
      'paging'    : true,
      'lengthChange'  : true,
      'searching'   : true,
      'ordering'    : true,
      'info'      : true,
      'autoWidth'   : false,
      'language'    : {"url": "../plugins/DataTables/Spanish.json"}
    })
   }  
  $(function (){
   estilo_tablas();
  })
    $.validator.setDefaults( {
      submitHandler: function () {
        var url = "insertar_modulo.php"; // El script a dónde se realizará la petición.
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
                  $("#lista_modulos").fnDestroy();
                  $("#tabla").load("tabla_modulos.php");
                  estilo_tablas();
                 }
               });
          // Evitar ejecutar el submit del formulario.
          return false;
      }
    });
    $( document ).ready( function () {
      $( "#form_datos" ).validate( {
        rules: {
          nombre_modulo: "required",
          nombre_carpeta: "required",
          descripcion_modulo: "required"
        },
        messages: {
          nombre_modulo: "Campo requerido",
          nombre_carpeta: "Campo requerido",
          descripcion_modulo: "Campo requerido",
          id_categoria: "Campo requerido"
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
          $( element ).parents( ".col-md-3" ).addClass( "has-error" ).removeClass( "has-success" );
          $( element ).parents( ".col-md-4" ).addClass( "has-error" ).removeClass( "has-success" );
          $( element ).parents( ".col-md-6" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
          $( element ).parents( ".col-md-3" ).addClass( "has-success" ).removeClass( "has-error" );
          $( element ).parents( ".col-md-4" ).addClass( "has-success" ).removeClass( "has-error" );
          $( element ).parents( ".col-md-6" ).addClass( "has-success" ).removeClass( "has-error" );
        }
      });
    });
  </script>
  <script>
  $(function () {
    $('.select2').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es'
    })
  })

</script>
</body>
</html>
