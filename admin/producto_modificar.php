<?php 
error_reporting(E_ALL ^ E_NOTICE);
if(!isset($_SESSION))session_start();
if(!$_SESSION['admin_id']){
$_SESSION['volver']=$_SERVER['PHP_SELF']."?".$_SERVER['QUERY_STRING'];
header("Location: index.php");
}
require_once('../conexion.php'); ?>
<?php
	if($_POST['enviar'] == "Modificar"){
		$unidad=implode(',',$_POST[unidad]);
		$q="UPDATE `productos` SET `nombre` = '$_POST[nombre]', `codigo` = '$_POST[codigo]', `categoria` = '$_POST[categoria]', `unidad` = '$unidad', `precio` = '$_POST[precio]', `disponibilidad` = '$_POST[disponibilidad]', `descripcion` = '$_POST[descripcion]', `promocion` = '$_POST[promocion]' WHERE `productos`.`id` = $_POST[id];";
		$resource=$conn->query($q);
		header("Location: listado_productos.php");
	}
?>
<?php
//if($_GET[id]==0){
       //header("Location: listado_productos.php"); 
        //}
$query=" SELECT * FROM productos WHERE id='$_GET[id]'";
$resource = $conn->query($query); 
$total = $resource->num_rows;
$row = $resource->fetch_assoc();

$rowColores = $row["colores"];
$arrayColores = explode(",",$rowColores);
?>

<!DOCTYPE html>
<html lang="es">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <meta charset="utf-8"> 
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css">
	
		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<title>Modifica Productos</title>
		
		<style>
			#success_message{ 
				display: none;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
		<script type="text/javascript">
			  $(document).ready(function() {
    $('#Modificar').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nombre: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Ingrese Nombre del Producto'
                    }
                }
            },
			 codigo: {
                validators: {
                     stringLength: {
                        min: 5,
                    },
                    notEmpty: {
                        message: 'Ingrese Codigo del Producto (Mínimo 6 caracteres)'
                    }
                }
            },
			 categoria: {
                validators: {
                     stringLength: {
                        min: 3,
                    },
                    notEmpty: {
                        message: 'Ingrese la cetegoría del Producto'
                    }
                }
            },
			disponibilidad: {
                validators: {
                     stringLength: {
                        min: 1,
                    },
                    notEmpty: {
                        message: 'Ingrese la categoría del Producto'
                    }
                }
            },
			descripcion: {
                validators: {
                     stringLength: {
                        min: 3,
                    },
                    notEmpty: {
                        message: 'Ingrese Descripción Del Producto (Mínimo 3 caracteres)'
                    }
                }
            },
           	unidad: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione Mínimo un color'
                    }
                }
            },
            precio: {
                validators: {
                     stringLength: {
                        min: 1,
                    },
                    notEmpty: {
                        message: 'Ingrese Precio del Producto'
                    }
                }
            },              
           }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
		</script>
	</head>
		<body>
         <?php 
            include("header.php"); 
            include("menu_admin.php"); 
        ?>
		    <div class="container">
			    <form class="well form-horizontal" method="post"  id="Modificar" name="Modificar">
					<fieldset>

					<!-- Nombre de Formulario -->
					<legend><center><h2><b>Modifica Productos</b></h2></center></legend><br>

					<!-- Nombre input-->

					<div class="form-group">
					  <label class="col-md-4 control-label">Nombre</label>  
					  <div class="col-md-4 inputGroupContainer">
					  <div class="input-group">
					  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					  <input  name="nombre" id="nombre" placeholder="Ingrese Nombre de Producto" class="form-control"  type="text" value="<?php echo $row['nombre']?>">
					    </div>
					  </div>
					</div>
					
					<!-- Email input-->
					      	<div class="form-group">
							  <label class="col-md-4 control-label">Código</label>  
							    <div class="col-md-4 inputGroupContainer">
							    <div class="input-group">
							        <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
							  		<input name="codigo" id="codigo" placeholder="Ingrese Código" class="form-control"  type="text" style="text-transform: uppercase" value="<?php echo $row['codigo']?>">
							    </div>
							  </div>
							</div>

					<!-- Categoria input-->
					       
					<div class="form-group"> 
					 	<label class="col-md-4 control-label">Categoría</label>
							<div class="col-md-4 selectContainer">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
									<select name="categoria" id="categoria" class="form-control selectpicker" >
										<option value=" " >Seleccione Una categoría</option>
										 <option value="Whisky"<?php if($row['categoria']=="whisky") echo 'selected' ?>>Whisky</option>
										 <option value="Ron"<?php if($row['categoria']=="Ron") echo 'selected' ?>>Ron</option>
										 <option value="Cerveza"<?php if($row['categoria']=="Cerveza") echo 'selected' ?>>Cerveza</option>
										 <option value="Vodka"<?php if($row['categoria']=="Vodka") echo 'selected' ?>>Vodka</option>
										 <option value="Vino"<?php if($row['categoria']=="Vino") echo 'selected' ?>>Vino</option>
										 <option value="Pisco"<?php if($row['categoria']=="Pisco") echo 'selected' ?>>Pisco</option>
										 <option value="Bebida"<?php if($row['categoria']=="Bebida") echo 'selected' ?>>Bebida</option>
										 <option value="Energetica"<?php if($row['categoria']=="Energetica") echo 'selected' ?>>Energetica</option>
										 <option value="Jugos"<?php if($row['categoria']=="Jugos") echo 'selected' ?>>Jugos</option>
									</select>
								</div>
							</div>
					</div>

					<!-- Frase Promocional -->
					
					
					<!-- Select Colores -->
					<div class="form-group"> 
					 	<label class="col-md-4 control-label">Unidad de Medida</label>
							<div class="col-md-4 selectContainer">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
									<select name="unidad[]" id="unidad" class="form-control selectpicker" >
										<option value=" " >Seleccione Unidad de Medida</option>
									 	<option value="Unidad" <?php if(in_array("Unidad",$arrayColores)) echo "selected"; ?>>Unidad</option>
									 	<option value="Pack" <?php if(in_array("Pack",$arrayColores)) echo "selected"; ?>>Pack</option>
									</select>
								</div>
							</div>
					</div>
					<!-- Precio -->
					       
					<div class="form-group">
					  <label class="col-md-4 control-label">Precio</label>  
					    <div class="col-md-4 inputGroupContainer">
					    <div class="input-group">
					        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
					  	<input name="precio" id="precio" placeholder="Ingrese Precio $" class="form-control" type="text" value="<?php echo $row['precio']?>">
					    </div>
					  </div>
					</div>


					<!-- Disponibilidad -->
					 <div class="form-group">
						 <label class="col-md-4 control-label">Disponibilidad</label>
						 <div class="col-md-4 inputGroupContainer">        	      
							<div class="radio">
							  <label><input type="radio" name="disponibilidad" value="1" required <?php if($row['disponibilidad']== 1) echo 'checked' ?>>Si</label>
							</div>
							<div class="radio">
							  <label><input type="radio" name="disponibilidad" value="0" required <?php if($row['disponibilidad']== 0) echo 'checked' ?>>No</label>
							</div>
						 </div>
					</div>

					<!-- Descripción -->
					       	      
					<div class="form-group">
					  <label class="col-md-4 control-label">Descripción</label>  
					    <div class="col-md-4 inputGroupContainer">
					    <div class="input-group">
					        <span class="input-group-addon"><i class="glyphicon glyphicon-align-left"></i></span>
				    	<textarea name="descripcion" id="descripcion" cols="30" rows="10" placeholder="Ingrese Descripción" class="form-control" type="text"><?php echo $row['descripcion']?></textarea>
					    </div>
					  </div>
					</div>
					
					<!-- En Promoción -->
					 <div class="form-group">
						 <label class="col-md-4 control-label">En Promoción</label>
						 <div class="col-md-4 inputGroupContainer">        	      
							<div class="radio">
							  <label>
							  <input type="radio" name="promocion" value="Si" required  <?php if($row['promocion']=="Si") echo 'checked' ?>>Si</label>
							</div>
							<div class="radio">
							  <label><input type="radio" name="promocion" value="No" required  <?php if($row['promocion']=="No") echo 'checked' ?>>No</label>
							</div>
						 </div>
					</div>

					
					<!-- Success message -->
					<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Success!.</div>

					<!-- Button -->
					<div class="form-group">
					  <label class="col-md-4 control-label"></label>
					  <div class="col-md-4"><br>
					   <input type="submit" class="btn btn-success" name="enviar" value="Modificar" id="agregarProducto">
					  </div>
					</div>

					</fieldset>
					<input type="hidden" name="id" id="id" value="<?php echo $row['id']?>">
				</form>
				
			</div><!-- /.container -->
			 <?php 
                include("footer.php"); 
            ?>
		</body>
</html>