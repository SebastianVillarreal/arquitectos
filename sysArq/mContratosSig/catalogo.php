<?php
  //include '../global_seguridad/verificar_sesion.php';
 ?>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
        <div class="box box-danger">
          <div class="box-header">
            <h1 class="box-title">Catalogo de componentes</h1>
          </div>
          <div class="box-body">
            <div class="col-md-6">
              <h3>Elementos</h3>
              <form method="POST" id="form_datos">
                <div class="col-md-12">
                  <label for="">Campo de texto</label>
                  <input type="text" class="form-control" placeholder="Campo de ejemplo">
                </div>
                <div class="col-md-12">
                  <label for="">Radios</label><br>
                  <input type="radio" name="sexo">Hombre
                  <input type="radio"  name="sexo">Mujer
                </div>
                <div class="col-md-12">
                  <label for="">Checkbox</label>
                  <input type="checkbox">
                </div>
                <div class="col-md-12">
                  <label for="">Seleccion</label>
                  <select name="" id="" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="">Opcion Uno</option>
                    <option value="">Opcion Dos</option>
                    <option value="">Opcion Tres</option>
                    <option value="">Opcion Cuatro</option>
                  </select>
                </div>
              </form>
            </div>
            <div class="col-md-6">
              <h3>Botones</h3>
              <div class="col-md-12 form-group">
                <button type="button" class="btn btn-primary">Primary</button>
                <button type="button" class="btn btn-secondary">Secondary</button>
                <button type="button" class="btn btn-success">Success</button>
                <button type="button" class="btn btn-danger">Danger</button>
                <button type="button" class="btn btn-warning">Warning</button>
                <button type="button" class="btn btn-info">Info</button>
                <button type="button" class="btn btn-light">Light</button>
                <button type="button" class="btn btn-dark">Dark</button>
                <button type="button" class="btn btn-link">Link</button>
              </div>
            </div>

          </div>
          <div class="box-footer text-right">
            <button type="submit" class="btn btn-warning" id="guardar">Guardar</button>
          </div>
          
        </div>
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Acciones</h3>
          </div>
          <div class="box-body">
            <form action="">
              <div class="row">
                <div class="col-md-12">
                  <a href="" class="fa fa-print color-icono fa-4x"></a>
                  <a href="" class="fa fa-check fa-4x"></a>
                  <a href="" class="fa fa-trash fa-4x"></a>
                  <a href="" class="fa fa-archive fa-4x"></a>
                  <a href="" class="fas fa-arrow fa-4x"></a>
                </div>
              </div>
            </form>
          </div>
          <div class="box-footer text-right">
            <!-- <button type="submit" class="btn btn-warning" id="guardar">Guardar</button> -->
          </div>
        </div>
        <div class="box box-danger">
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
            <button type="submit" class="btn btn-warning" id="guardar">Guardar</button>
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
