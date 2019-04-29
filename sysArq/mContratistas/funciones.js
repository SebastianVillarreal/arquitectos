function guardar_contratista() {
    var nombre = $('#nombre').val();
    var ap_paterno = $('#ap_paterno').val();
    var ap_materno = $('#ap_materno').val();
    var codigo = $('#codigo').val();
    var p_moral = $('#p_moral').val();
    var razon = $('#razon').val(); 
    var url = "../api/contratistas/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "nombre": nombre,
            "ap_paterno": ap_paterno,
            "ap_materno": ap_materno,
            "codigo": codigo,
            "p_moral": p_moral,
            "razon": razon

        })
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                alertify.success("Contratista Guardado");
                $('#contenedor_tabla').load('tabla_contratistas.php');
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