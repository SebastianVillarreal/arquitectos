function cargar_concepto(id_renglon) {
    var url = "../api/generador/read.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_renglon" :id_renglon})
    })
    .then(function(response){
        return response.text().then(function (text){
          $('#h3').html(text);
        });
    });
}

function eliminar_renglon(id, id_concepto, id_detalle) {
    var url = "../mGenerador/borrar_fila.php";
     if (confirm("Esta seguro de eliminar este registro?") == true) {
      fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id": id, 
            "id_concepto": id_concepto,
            "id_detalle": id_detalle
          })
         })
       .then(function(response){
        return response.text().then(function (text){
          location.reload();
        });
    });
             return true;
           }

           else{
            return false;
           }        
}

function validar(total, id_cuarto, largo, ancho, tipo_concepto) {

    if (!total || !id_cuarto || !largo || !ancho || !tipo_concepto) {

      alertify.error("Favor de llenar todos los campos");

    }else{
      if (total < 0) {
        alertify.error("No se permiten cantidades negativas");
      }else{
              var url = "../api/generador/validar_cantidad.php";
              fetch(url,{
                  method: 'POST',
                  headers: {
                      "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
                  },
                  body: JSON.stringify({
                    "total" :total, 
                    "id_cuarto" :id_cuarto, 
                    "largo": largo, 
                    "ancho": ancho
                  })
              })
              .then(function(response){
                  return response.text().then(function (text){
                    if (text == 0) {
                      alertify.error("Cantidad Superada");
                      //$('#btnNew').attr('disabled', true);
                    }else{
                      alertify.success("Cantidad Insertada");
                      $('#contenedor_tabla').load('tabla_generador.php');
                      calcular_totales(tipo_concepto);
                    }
                  });
                  
              });
        }
  }
}

function calcular_area(largo, ancho) {
  var area = largo * ancho;
  $('#txtTotal').val(area);
  //$('#txtTotal').focus();
  //$('#txtTotal').blur();
}

function calcular_totales(tipo_concepto){
    var url = "../api/detalle_contrato/calcular_totales.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
          "tipo_concepto": tipo_concepto
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            // if (text == "1") {
            //     //alertify.success("Cantidad Cambiada");
            //     datos_contrato('', perfil);
            // }else{
            //     //alertify.error("Cantidad Superada");
            // }
        });
        
    });
}


function insert_generador(id_cuarto, largo, ancho, total) {
    var url = "../api/generador/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_cuarto" :id_cuarto, "largo": largo, "ancho": ancho, "total": total })
    })
    .then(function(response){
        return response.text().then(function (text){
            alertify.success("Comentario Insertado");
            $('#comentarios').val("");
            cargar_tabla_coments();
        });
        
    });
}


function agregar_comentarios(comentarios){
    var url = "agregar_comentarios.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"comentarios": comentarios})
    })
    .then(function(response){
        return response.text().then(function (text){
            alertify.success("Comentario Insertado");
            $('#comentarios').val("");
            cargar_tabla_coments();
        });
        
    });
}

function cargar_combo_zona() {
    //blanco();
    $('#cmbZona').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_zonas.php",
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
    })
}

function cargar_combo_area(id_zona) {
    $('#cmbArea').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_areas.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term, // search term
        id_zona: id_zona
      };
     },
     processResults: function (response) {

       return {
          results: response
       };
     },
     cache: true
    }
    })
}

function cargar_combo_cuarto(id_area) {
    $('#cmbCuartos').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_cuartos.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term, // search term
        id_area: id_area
      };
     },
     processResults: function (response) {
       return {
          results: response
       };
     },
     cache: true
    }
    })
}