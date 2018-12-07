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

function modal() {
	$('#modal').modal('show');
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
        body: $('#frmTabla').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            alert(text);
        });
    });
}

function blanco(){
    cargar_tabla();
    $('#cnt_acciones').hide();
    //$('#cnt_detalle_contrato').hide();
    $('#cnt_resumen').hide();
}


function cargar_tabla() {
    var id_contrato = 1;
    var url = "tabla_detalle_contrato.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato}) 
        
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#tabla').html(text);
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
            alert(text);
            if (text == "1") {
                alertify.success("Contrato Creado");
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}