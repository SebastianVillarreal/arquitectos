function cambiar_estado(n, elemento) {
    var e = elemento.checked;
    if (e == true) {
        activar(n);
    }else{
        desactivar(n);
    }
}

function activar(id_empleado) {
    var tipo = 1;
    var url = "../api/personal/activar.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id_empleado": id_empleado,
            "tipo": tipo
        })
    })
    .then(function(response){
        
        return response.text().then(function (text){
            alert("activado");
            //location.reload();
        });
    });
}

function desactivar(id_empleado) {
    var tipo = 2;
    var url = "../api/personal/activar.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id_empleado": id_empleado,
            "tipo": tipo
        })
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            alert("desactivado");
            //alert(text);
            //location.reload();
        });
    });
}

function dirigir() {
    var id_empleado = $('#id').val();
    if (id_empleado == "") {
        guardar_empleado();
    }else{
        update_empleado();
    }
}

function update_empleado() {
    var url = "../api/personal/update.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#form_datos').serialize()
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            alertify.success('Guardado');
            //$('#tabla').load('tabla_personal.php')
            //alert(text);
            //location.reload();
        });
    });
}


function guardar_empleado() {
    var url = "../api/personal/create.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: $('#form_datos').serialize()
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            alertify.success('Guardado');
            $('#tabla').load('tabla_personal.php')
            //alert(text);
            //location.reload();
        });
    });
}

function editar(id_empleado) {
        var url = "../api/personal/read.php";
    fetch(url,{
        method: 'POST',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: JSON.stringify({
            "id_empleado": id_empleado
        })
    })
    .then(function(response){
        
        //cargar_tabla();
        return response.text().then(function (text){
            //alert(text);
            var array = eval(text);
            $('#id').val(array[0]);
            $('#nombre').val(array[2]);
            $('#ap_paterno').val(array[3]);
            $('#ap_materno').val(array[4]);
            $('#sueldo').val(array[5]);
            $('#puesto').val(array[6]);
            $('#contratista').val(array[1]);


            // alertify.success('Guardado');
            // $('#tabla').load('tabla_personal.php')
            //alert(text);
            //location.reload();
        });
    })
;}