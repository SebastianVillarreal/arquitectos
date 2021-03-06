<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../plugins/SweetAlert2/sweetalert2.css">
	
	<!-- <link rel="shortcut icon" href="../d_plantilla/dist/img/logo.png" type='image/png'> -->
	<script src="funciones.js"></script>

	<title>Origen</title>
</head>
<body style="background-color: #8A0808;">
	<div id="modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="modal" data-keyboard="false" style="display: block;">
		<div class="modal-dialog">
			<div class="modal-content">
					<form method="POST" id="form_credenciales">
						<div class="modal-body text-center">
							<!-- <img src="../d_plantilla/dist/img/logo.png" width="250px."> -->
							<h3>Sistema Integral | Panel de Administraci&oacute;n</h3>
							<h4>Inicio de Sesi&oacute;n</h4>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
									<input type="text" name="nombre_usuario" id="nombre_usuario" class="form-control text-center" placeholder="Ingresa tu usuario">
								</div>
							</div>
							<!-- <div class="form-group">  </div> -->
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
									<input type="password" name="pass" id="pass"  onkeyup = "if(event.keyCode == 13) enviar_datos()" class="form-control text-center" 
										placeholder="Contrase&ntilde;a">
								</div>
							<br>

							<div class="form-group">
								<a href="javascript:enviar_datos()" id="enterBtn" class="btn btn-md btn-success"> Iniciar Sesi&oacute;n </a>
		<!-- 						<button id="verificar" class="btn btn-md btn-danger">
									<i class="fa fa-search" aria-hidden="true"></i>
									Iniciar Sesi&oacute;n
								</button> -->
							</div>


							</div>
						</form>

					<div class="modal-footer">
						<p class="text-center">
							Technology & Information for Business Solutions © Todos los derechos reservados.
						</p>
						<p class="text-center">
						
					</p>
				</div>
			</div>
		</div>
	</div>



	<script src="../plugins/bootstrap/js/jquery.min.js"></script>
	<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../plugins/SweetAlert2/dist/sweetalert2.all.js"></script>
	
</body>
</html>