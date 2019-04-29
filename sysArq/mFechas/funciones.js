function guardar_fecha() {
    var url = "../api/proyectos/create_fecha.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#frmDatos').serialize()
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                alertify.success("Importe Guardado");
                $('#contenedor_tabla').load('tabla_fechas.php');
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}
