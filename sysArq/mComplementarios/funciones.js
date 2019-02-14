function guardar_importes() {
    var url = "../api/importes/create.php";
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
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}

function calcular_importes() {
    var url = "calcular_importes.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#form_datos').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            var a = eval(text);
            $('#m_anticipo').val(a[2]);
            $('#m_fondo').val(a[1]);
            $('#m_iva').val(a[0]);
        });
    });
}

function cargar_datos(id_contrato) {
    var url = "../api/importes/read.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_contrato": id_contrato})
    })
    .then(function(response){
        return response.text().then(function (text){
            var a = eval(text);
            $('#m_anticipo').val("$"+a[3]);
            $('#m_fondo').val("$"+a[4]);
            $('#m_iva').val("$"+a[5]);
            $('#p_anticipo').val(a[0]);
            $('#a_retenido').val("$"+a[10]);
            $('#p_fondo').val(a[1]);
            $('#g_retenido').val("$"+ a[8]);
            $('#g_devuelto').val("$"+ a[9]);
            $('#p_iva').val(a[2]);

        });
    });
}