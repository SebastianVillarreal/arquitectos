function guardar_concepto() {
    var url = "../api/concepto/create.php";
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
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}

function blanco() {
    $('#div_importar').hide();
}

function mostrar_importar() {
    $('#div_importar').show();
    $('#div_formulario').hide();
}

function subir_excel() {
    var parametros = new FormData($("#importa")[0]);

    $.ajax({
        data: parametros, //datos que se envian a traves de ajax
        url: '../excelamysql/importar.php', //archivo que recibe la peticion
        type: 'post', //método de envio
        contentType: false,
        processData: false,
        beforesend: function() {

        },
        success: function(response) {
            alert("Conceptos importados con éxito");
            location.reload();

        }
    });
}
