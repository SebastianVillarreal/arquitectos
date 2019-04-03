function guardar_registro(folio, concepto, total) {
    var url = "../api/estimacion/captura.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
        	"folio": folio,
        	"concepto": concepto,
        	"total": total
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == "1") {
                alertify.success("Importe Guardado");
                $('#tabla').load('tabla_categorias.php');
            }else{
                alertify.error("Ha ocurrido un error");
            }
        });
    });
}