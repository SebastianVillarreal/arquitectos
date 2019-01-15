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

function guardar(nombre) {
    var url = "insertar_lista.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"nombre": nombre}) 
        
    })
    .then(function(response){
        return response.text().then(function (text){
            $('#nombre_contrato').val("");
            $('#tabla').load('tabla_lista.php');
        });

    });
}

function cambiar_estado(n, elemento) {
    var e = elemento.checked;
    if (e == true) {
        $('#marca_' + n).attr("name", "marca[]");
        $('#contrato_' + n).attr("name", "contrato[]");
        

    }else{
        $('#marca_' + n).removeAttr("name");
        $('#contrato_' + n).removeAttr("name");
    }
}

function asignar() {
    var url = "../api/obras_contrato/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#frmTabla').serialize()
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            //alert(text);
            //location.reload();
        });
    });
}

function read(obra) {
    var url = "../api/obras_contrato/read.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({"obra": obra})
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            $('#tabla').html(text);
            
        });
    });
}
