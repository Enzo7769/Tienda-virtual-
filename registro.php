<?php 
error_reporting(E_ALL ^ E_NOTICE);
require_once('conexion.php'); ?>
<?php	
	if($_POST['registro'] == "registro"){
		//print_r($_POST);
		$q="INSERT INTO `clientes` (`id`, `nombre`, `email`, `telefono`, `usuario`, `contrasena`, `fecha`) VALUES (NULL, '$_POST[nombre]', '$_POST[email]', '$_POST[telefono]', '$_POST[usuario]', '$_POST[contrasena]', CURRENT_TIMESTAMP)";
		//print_r($q);
		$resource=$conn->query($q);
		
		$cuerpo="Felicitaciones Don/ña ".$row['nombre'].", Ya puede iniciar sesión, sus Datos Registrados Son:
		Usuario: ".$_POST['usuario']."
		Contraseña: ".$_POST['contrasena']."
		_______________________________________________
		";
		$cabecera = "From: "."Registros"."<"."no-responder@rayitas.cl".">\n";
		$cabecera .= "Cco: gerente@rayita.cl\n";
        $cabecera .= "Cc: '$_POST[email]'\n";

		$destinatario="Jorge serrano <jorgeserran@gmail.com>";
		$asunto="Registro de Nuevo Usuario desde el sitio WEB";
		mail("$destinatario", "$asunto", "$cuerpo", "$cabecera");
		header("Location: login.php");
	}
?><!-- FIN Registro de usuarios y Mail de Notificación -->
<!DOCTYPE html>
<html lang="es">
  <head>
    <?php include("head.php");?>
    <style>
    .descuento{
        display: none;
        background-color: greenyellow;
    }  
    </style>
  </head>
  <body>
    <!-- header -->
    <?php include("header.php");?><!-- fin header --> 

    <!-- Menu Principal -->
    <?php include("menu.php");?>    
    <!-- End Menu Principal -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Registro de Clientes</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
			    <form class="well form-horizontal" method="post"  id="formulario" name="fRegistro">
					<fieldset>

					<!-- Nombre de Formulario -->
					<legend><center><h2><b>Formulario de Registro</b></h2></center></legend><br>

					<!-- Nombre input-->

					<div class="form-group">
					  <label class="col-md-4 control-label">Nombre</label>  
					  <div class="col-md-4 inputGroupContainer">
					  <div class="input-group">
					  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					  <input  name="nombre" id="nombre" placeholder="Ingrese su Nombre Completo" class="form-control"  type="text">
					   </div>
					  </div>
					</div>
					
					<!-- Email input-->
					      	<div class="form-group">
							  <label class="col-md-4 control-label">E-Mail</label>  
							    <div class="col-md-4 inputGroupContainer">
							    <div class="input-group">
							        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							  <input name="email" id="email" placeholder="Ingrese su Email" class="form-control"  type="email">
							    </div>
							  </div>
							</div>

					<!-- Teléfono input-->
					       
					<div class="form-group">
					  <label class="col-md-4 control-label">Teléfono</label>  
					    <div class="col-md-4 inputGroupContainer">
					    <div class="input-group">
					        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
					      <input name="telefono" id="telefono" class="form-control" type="text" placeholder="+562 / +569">
					    </div>
					  </div>
					</div>

					
					  
					<!-- usuario input-->
                    <div class="form-group">
					  <label class="col-md-4 control-label">Usuario</label>  
					  <div class="col-md-4 inputGroupContainer">
					  <div class="input-group">
					  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					  <input  name="usuario" id="usuario" placeholder="Usuario" class="form-control"  type="text">
					    </div>
					  </div>
					</div>

					<!-- COntraseña input-->

					<div class="form-group">
					  <label class="col-md-4 control-label">Contraseña</label> 
					    <div class="col-md-4 inputGroupContainer">
					    <div class="input-group">
					  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					  <input name="contrasena" placeholder="Contraseña" class="form-control"  type="password">
					    </div>
					  </div>
					</div>

					<!-- Select Basic -->

					<!-- Success message -->
					<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Success!.</div>

					<!-- Button -->
					<div class="form-group">
					  <label class="col-md-4 control-label"></label>
					  <div class="col-md-4"><br>
					   <input type="submit" class="btn btn-success" value="registro" name="registro" id="registro">
					  </div>
					</div>

					</fieldset>
				</form>
			</div><!-- /.container -->
    </div>
    <!-- Footer -->
    <?php include("footer.php");?><!-- End Footer -->   
    <!-- JS -->
    <?php include("js.php");?><!-- End JS -->
  </body>
</html>