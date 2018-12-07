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
                mostrar();
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}

function blanco(){
    cargar_tabla();
    $('#cnt_acciones').hide();
    //$('#cnt_detalle_contrato').hide();
    $('#cnt_resumen').hide();
}

function mostrar() {
    $('#cnt_acciones').show();
    $('#cnt_detalle_contrato').show();
    $('#cnt_resumen').show();
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
            $('#cont_table').html(text);
        }); 
    });
}