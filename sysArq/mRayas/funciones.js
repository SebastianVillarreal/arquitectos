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
                alertify.success('Asistencia Guardada');
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