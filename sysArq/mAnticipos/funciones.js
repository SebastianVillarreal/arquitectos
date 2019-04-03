function consultar(obra) {
    var url = "tabla_anticipos.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "obra": obra
        })
    })
    .then(function(response){
        return response.text().then(function (text){
          $('#tabla').html(text);
        });
    });
    
}

function pagar(id_contrato, nivel) {
    var obra = $('#obra').val();
    var url = "../api/contrato/pagar_anticipo.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id_contrato": id_contrato,
            "nivel": nivel
        })
    })
    .then(function(response){
        return response.text().then(function (text){
            if (text == 1) {
                alertify.success("Anticipo pagado");
                consultar(obra);
            }
            
          //$('#tabla').html(text);
        });
    });
    
}

function validar(id_contrato, nivel) {
    swal({
        title: 'Deseas pagar el anticipo?',
        text: "No puedes revertir esta accion",
        type: 'question',
        showCancelButton: true,
        //confirmButtonColor: '#c0392b',
        //cancelButtonColor: '#3498db',
        confirmButtonText: 'Si, pagar!',
        cancelButtonText: 'No, cancelar!',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        buttonsStyling: true
    }).then(function() {
        pagar(id_contrato, nivel);
    }, function(dismiss) {
    })
}






