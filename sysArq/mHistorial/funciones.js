function filtrar(id_obra) {
    var url = "../mLogin/validar_usuario.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"id_obra": id_obra}) 
        
    })
    .then(function(response){
        $('#tabla').load('tabla_contratos_historial_filtro.php');
    });
}