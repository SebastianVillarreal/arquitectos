function insertar_devolucion(cantidad, id_estimacion) {
    // alert(cantidad);
    // alert(id_estimacion);
    var url = "../api/estimacion/devolucion.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"cantidad": cantidad, "id_estimacion": id_estimacion})
    })
    .then(function(response){
        return response.text().then(function (text){

        });
        
    });
}

function cargar_proyectos() {
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
    })
}

function cargar_contratos(id_proyecto) {
    $('#cmbContratos').select2({
      placeholder: 'Seleccione una opcion',
      lenguage: 'es',
      //minimumResultsForSearch: Infinity
      ajax: { 
     url: "consulta_contratos.php",
     type: "post",
     dataType: 'json',
     delay: 250,
     data: function (params) {
      return {
        searchTerm: params.term,
         proyecto: id_proyecto// search term
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

function nueva_estimacion(id_contrato) {
    var url = "../api/estimacion/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato})
    })
    .then(function(response){
        return response.text().then(function (text){
            if(text == 0){
                alert("No se ha podido crear la estimacion, falta informacion de importes");
            }else{
                alert("Estimacion creada");
                set_id_contrato(id_contrato, text);
                location.href="datos_estimacion.php";
            }
        });
        
    });
}

function seleccionar_estimacion(id_estimacion) {
    var id_contrato = $('#cmbContratos').val();
    set_id_contrato(id_contrato, id_estimacion);
    location.href = "datos_estimacion.php";
    //cargar_datos_estimacion(id_estimacion);
}

function cargar_datos_estimacion(id_estimacion) {
    var url = "../api/estimacion/read.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato})
    })
    .then(function(response){
        return response.text().then(function (text){
            var array = eval(text);
            $('#monto_iva').val("$"+array[3]);
            $('#total_estimacion').val("$"+ array[4]);
            $('#fecha_inicio').val(array[6]);
            $('#fecha_fin').val(array[5]);
            $('#dev_garantia').val(array[7]);
            
        });
        
    }); 
}

function cargar_estimaciones(id_contrato) {
    var url = "tabla_estimaciones.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato})
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#contenedor_tabla').html(text);
        });
        
    });
}

function set_id_contrato(id_contrato, id_estimacion) {
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato, "id_estimacion": id_estimacion}) 
        
    })
    .then(function(response){
           //location.href = "../mContratos/editar_contrato.php"; 
    });
}

function generador(id_renglon, id_contrato){
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_renglon": id_renglon, "id_contrato": id_contrato})
    })
    .then(function(response){
        return response.text().then(function (text){
            location.href="../mGenerador/index.php";
            // alertify.success("Comentario Insertado");
            // $('#comentarios').val("");
            // cargar_tabla_coments();
        });
        
    });
    location.href="../mGenerador/index.php";
}



function add_concepts(){
    
    var url = "../api/contrato/agregar_lote.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        }
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == 1) {
                alert("Ahora puedes añadir conceptos nuevos");
                location.href ="editar_contrato.php";
            }else{
                alert("Ha ocurrido un error, favor de notificarlo al administrador del sistema");
            }
            
        });
        
    });
}




function agregar_cantidad_estimacion(id_renglon, cantidad_nueva, id_estimacion, perfil) {

    var url = "../api/estimacion/update.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_renglon": id_renglon, "cantidad_nueva": cantidad_nueva, "id_estimacion": id_estimacion})
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                alertify.success("Cantidad Cambiada");
                cargar_tabla(perfil);
                //calcular_totales(tipo_concepto, perfil);
            }else{
                alertify.error("Cantidad Superada");
            }
        });
        
    });
}

function calcular_totales(tipo_concepto, perfil){
    var url = "../api/detalle_contrato/calcular_totales.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"tipo_concepto": tipo_concepto})
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                //alertify.success("Cantidad Cambiada");
                datos_contrato('', perfil);
            }else{
                //alertify.error("Cantidad Superada");
            }
        });
        
    });
}



function cargar_folio() {
    var url = "consulta_folio.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        }
    })
    .then(function(response){
        return response.text().then(function (text){
            seleccionar_contrato(text);
            $('#txtFolio').val(text);
            cargar_tabla();
        });
        
    });
}







function guardar_contrato() {
    var url = "../api/contrato/create.php";
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
                alertify.success("Contrato Creado");
                cargar_folio();
                //mostrar();
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}

function cargar_tabla_coments() {
    $('#tabla_coments').load('tabla_coments.php');
}

function blanco(){
    cargar_tabla_coments();
    cargar_tabla();
    $('#cnt_acciones').hide();
    //$('#cnt_detalle_contrato').hide();
    $('#cnt_resumen').hide();
}

function cargar_descripcion(tipo) {
    var ruta = "consulta_datos.php";
    if (tipo == 1) {
        var dato = $('#cmb_proyecto').val();
    }else if(tipo == 2){
        var dato = $('#cmb_contratista').val();
    }else if(tipo == 3){
        var dato = $('#cmb_residente').val();
    }
    fetch(ruta,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"dato": dato, "tipo": tipo}) 
    })
    .then(function(response){
        return response.json().then(function (data){
            var d = eval(data);
            if (tipo == 1) {
                $('#txt_proyecto').val(d[0]);
            }else if(tipo == 2){
                $('#txt_contratista').val(d[0]);
            }else if(tipo == 3){
                $('#txt_residente').val(d[0]);
            }
        });
    });
}

function mostrar() {
    $('#cnt_acciones').show();
    $('#cnt_detalle_contrato').show();
    $('#cnt_resumen').show();
}

function cargar_tabla(perfil) {
    //$('#cont_table').load('tabla_detalle_contrato.php');
    if (perfil == 3) {
        $('#cont_table').load('tabla_detalle_contrato.php');
    }else{
        $('#cont_table').load('tabla_detalle_contrato_sup.php');
    }
}

function datos_contrato(id_contrato, perfil){
    var url = "datos_contrato.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        }
        
    })
    .then(function(response){
        return response.text().then(function (text){
            var element = eval(text);
            $('#radio_' + element[6]).attr('checked', true);
            $('#tipo_c').val(tipo_contrato);
            $('#cmb_proyecto').val(element[1]);
            $('#txt_proyecto').val(element[19]);
            $('#cmb_contratista').val(element[2]);
            $('#txt_contratista').val(element[21]);
            $('#cmb_residente').val(element[3]);
            $('#txt_residente').val(element[20]);
            $('#txt_descripcion').val(element[4]);
            $('#txtFolio').val(element[0]);
            $('#cto_normal').html("$" + new Intl.NumberFormat("en-US").format(element[10]));
            $('#cto_extra_cliente').html("$" + new Intl.NumberFormat("en-US").format(element[11]));
            $('#cto_extra_of').html("$" + new Intl.NumberFormat("en-US").format(element[12]));
            $('#cto_excedido').html("$" + new Intl.NumberFormat("en-US").format(element[15]));
            $('#total_si').html("$" + new Intl.NumberFormat("en-US").format(element[17]));
            $('#fecha').val(element[22]);
            $('#tdSubTotal').html("$" + new Intl.NumberFormat("en-US").format(element[17]));
            $('#tdIva').html('$' + new Intl.NumberFormat("en-US").format(element[9]));
            $('#tdTotal').html('$' + new Intl.NumberFormat("en-US").format(element[18]));
            $('#tdGtPresupuesto').html("$" + new Intl.NumberFormat("en-US").format(element[17]));
            var p_normal = (element[10] / element[17]) * 100;
            var p_ec = (element[11] / element[17]) * 100;
            var p_eo = (element[12] / element[17]) * 100;
            var p_ex = (element[15] / element[17]) * 100;

            p_normal = Math.round(p_normal * 100) / 100;
            p_ec = Math.round(p_ec * 100) / 100;
            p_eo = Math.round(p_eo * 100) / 100;
            p_ex = Math.round(p_ex * 100) / 100;
            $('#p_normal').html(p_normal + "%");
            $('#p_ec').html(p_ec + "%");
            $('#p_eo').html(p_eo + "%");
            $('#p_ex').html(p_ex + "%");
            cargar_tabla(perfil);
            cargar_tabla_coments();
            cargar_tabla_resumen();
        }); 
    });
}

function seleccionar_contrato(id_contrato) {
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato}) 
        
    })
    .then(function(response){
           location.href = "../mContratos/editar_contrato.php"; 
    });
}

function seleccionar_contrato_aut(id_contrato) {
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato}) 
        
    })
    .then(function(response){
           location.href = "../mContratos/ver_contrato_aut.php"; 
    });
}

function cargar_tabla_resumen() {
    $('#contenedor_tabla_resumen').load('tabla_resumen.php');
}

function rechazar(valor) {
    var url = "rechazar_contrato.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"valor": valor}) 
        
    })
    .then(function(response){
           return response.text().then(function (data){
            swal(
              'Hecho!',
              'Se ha actualizado el estatus del contrato!',
              'success'
            );
            location.href="index.php";
        
        });
    });
}

function autorizar_estimacion(id_estimacion, tipo) {
    var url = "../api/estimacion/autorizaciones.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_estimacion": id_estimacion, "tipo": tipo}) 
    })
    .then(function(response){
           return response.text().then(function (data){
            if (data == 1) {
                alert("Estimacion Enviada");
                location.href="index.php";
            }else{
                alert("Ha ocurrido un error");
            }
        
        });
    });
}



