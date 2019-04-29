function guardar_registro() {
    var url = "../api/estimacion/captura.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#form_datos').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                alertify.success("Importe Guardado");
                $('#tabla').load('tabla_categorias.php');
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}

function cargar_combos() {
    
    $('#cmbContratistas').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_contratistas.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term // search term
      };
     },
     processResults: function (response) {

       return {
          results: response
       };
     },
     cache: true
    }
    });
    //////////////////////////////////////////
    $('#cmbProyectos').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_proyectos.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term // search term
      };
     },
     processResults: function (response) {

       return {
          results: response
       };
     },
     cache: true
    }
    });
}
function seleccionar_captura(id) {
    var url = "datos_captura.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
          "id": id
        })
    })
    .then(function(response){
        return response.text().then(function (text){
          var e = eval(text);
          $('#folio').val(e[1]);
          $('#concepto').val(e[2]);
          $('#total').val(e[3]);
          $('#cmbProyectos').val(e[6]);
          $('#cmbContratistas').val(e[5]);
          $('#fecha').val(e[4]);
          $('#btnAutorizar').removeAttr('disabled');
          $('#btnGuardar').attr('disabled', true);
        });
    });
}