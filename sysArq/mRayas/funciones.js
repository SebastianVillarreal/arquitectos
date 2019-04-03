function consultar() {
    var fecha_inicial = $('#fecha_inicial').val();
    var fecha_final = $('#fecha_final').val();
    var obra = $('#obra').val();
    var url = "tabla_rayas.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "fecha_inicial": fecha_inicial,
            "fecha_final": fecha_final,
            "obra": obra
        })
    })
    .then(function(response){
        return response.text().then(function (text){
          $('#datos_raya').removeAttr('style');
          $('#tabla').html(text);
        });
    });
    
}





