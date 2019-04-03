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
    <script src="funciones.js"></script>
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
            <h3 class="box-title">Personal por Contratista</h3>
          </div>
          <div class="box-body">
            <form method="POST" id="form_datos">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="nombre">*Nombre</label>
                  <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingresa un nombre">
                  <input type="hidden" name="id" id="id">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_paterno">*Ap. Paterno</label>
                  <input type="text" name="ap_paterno" id="ap_paterno" class="form-control" placeholder="Ingresa un apellido">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_materno">*Ap. Materno</label>
                  <input type="text" name="ap_materno" id="ap_materno" class="form-control" placeholder="Ingresa un apellido">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_materno">*Sueldo diario</label>
                  <input type="number" name="salario" id="sueldo" class="form-control" placeholder="Salario diario">
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="ap_materno">*Puesto</label>
                  <select name="puesto" id="puesto" class="form-control select2">
                    <option value="">Seleccione una opcion...</option>
                    <?php
                    $cadena_perfiles = "SELECT id, nombre FROM puestos";
                    $consulta_perfiles = mysqli_query($conexion, $cadena_perfiles);
                    while ($row_perfiles=mysqli_fetch_array($consulta_perfiles)) {
                    ?>
                    <option value="<?php echo $row_perfiles[0] ?>"><?php echo $row_perfiles[1] ?></option>
                    <?php
                     } 
                     ?>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label for="id_perfil">*Contratista asignado</label>
                  <select name="contratista" id="contratista" class="form-control select2">
                    <option value="">Seleccione una opcion...</option>
                    <?php
                    $cadena_perfiles = "SELECT id, CONCAT(nombre, ' ', ap_paterno) FROM contratistas";
                    $consulta_perfiles = mysqli_query($conexion, $cadena_perfiles);
                    while ($row_perfiles=mysqli_fetch_array($consulta_perfiles)) {
                    ?>
                    <option value="<?php echo $row_perfiles[0] ?>"><?php echo $row_perfiles[1] ?></option>
                    <?php
                     } 
                     ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="box-footer text-right">
            <a href="#" onclick="javascript:dirigir()" class="btn btn-danger">Guardar</a>
          </div>
          </form>
        </div>
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Lista de Usuarios Existentes</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-md-12" id="tabla">
                <?php include 'tabla_personal.php'; ?>
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
<!--   <script>
  $(function () {
    $('.select2').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es'
    })
  })

</script> -->
</body>
</html>
