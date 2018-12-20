function enviar_datos() {
		var url = "validar_usuario.php";
		fetch(url, {
			method: "post",
			headers: {
	      		"Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
	    	},
	    	body: $('#form_credenciales').serialize()
		}
	)
	.then(function(response) {
		return response.text().then(function (text){
			alert(text);
            if (text == "1") {
            	swal("Lo sentimos", "El usuario o la contrase&ntilde;a son incorrectas","error");
            }else{
            	window.location="../mContratos";
            }
        });
	});
}
