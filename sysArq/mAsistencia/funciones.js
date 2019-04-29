function set_fecha(fecha) {
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "fecha": fecha
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            //$('#tabla').html(text);
        });
    });
}

function cargar_empleados(contratista){
    var url = "tabla_personas.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "contratista": contratista
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#tabla').html(text);
        });
    });
}

function cargar_empleados_cap(contratista){
    var url = "tabla_personas_cap.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "contratista": contratista
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#tabla').html(text);
        });
    });
}

function cargar_empleados_fecha(contratista){
    var fecha = $('#fecha').val();
    var url = "tabla_personas_asistieron_fecha.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "contratista": contratista,
            "fecha": fecha
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#tabla').html(text);
        });
    });
}

function cambiar_estado(n, elemento) {
    var e = elemento.checked;
    if (e == true) {
        $('#marca_' + n).attr("name", "marca[]");
        $('#concepto_' + n).attr("name", "concepto[]");
        $('#tipo_concepto_' + n).attr("name", "tipo_concepto[]");

    }else{
        $('#marca_' + n).removeAttr("name");
        $('#concepto_' + n).removeAttr("name");
        $('#tipo_concepto_' + n).removeAttr("name");
    }
}

function agregar_concepto() {
    var url = "../api/detalle_contrato/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#frmTabla2').serialize()
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            //alert(text);
            location.reload();
        });
    });
}

function guardar_asistencia(){
    var url = "../api/rayas/insertar_asistencia.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#frmDatos').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text== 1) {
                alert('Asistencia Guardada');
                location.reload();
            }else{
                alertify.error("Ha ocurrido un error");
            }
            
        });
    });
}

function capturar_asistencia(){
    var url = "../api/rayas/capturar_asistencia.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#frmDatos').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text== 1) {
                alert('Asistencia Guardada');
                //location.reload();
            }else{
                alertify.error("Ha ocurrido un error");
            }
            
        });
    });
}


function asistir(id, valor) {
    var v = valor.checked;
    //var v = valor.checked;
    //alert(v);
    if (v == true) {
        $('#cal_' + id).val("1");
    }else{
        $('#cal_' + id).val("0");
    }
    
}

function cargar_contratistas(obra) {
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
        searchTerm: params.term// search term
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


function set_id_obra(){
  var id_obra = $('#proyecto').val();
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id_obra": id_obra 
        })
    })
    .then(function(response){
        return response.text().then(function (text){
          guardar_asistencia();
            //$('#tabla').html(text);
        });
    });
}

function guardar(id, marca, id_obra) {
    var url ="update.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id": id,
            "marca": marca,
            "id_obra": id_obra 
        })
    })
    .then(function(response){
        return response.text().then(function (text){
          //guardar_asistencia();
            //$('#tabla').html(text);
        });
    });
}

function update_asistencia(id_asisitencia, asiste, id_obra, hora) {
    if (hora > '08:00') {
        alert("No se pueden hacer cambios despues de las 8 a.m");
    }else{
        var url = "../api/rayas/update_asistencias.php";
        fetch(url,{
            method: 'POST',
            headers: {
                "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
            },
            body: JSON.stringify({
                "id_obra": id_obra,
                "id_asisitencia": id_asisitencia,
                "asiste": asiste
            })
        })
        .then(function(response){
            
            //cargar_tabla();
            return response.text().then(function (text){
                alert(text);
                //location.reload();
            });
        });
    }

}