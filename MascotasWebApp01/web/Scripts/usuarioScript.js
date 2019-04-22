$(document).ready(function(){
    $("#usuarioNewForm").validate({
        rules: {
           nombre:{
              required: true,
              lettersonly: true
           },
            
            apellido:{
              required: true,
              lettersonly: true
           },
           
           fechanacimiento:{
              required: true,     
           },
           
           genero:{
              required: true,
              selectcheck: true        
           },
           
            correo: {
                required: true,
                email: true
            },
            
            contraseña: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
           
           telefono: {
                required: true,
                digits: true
            }
        },
            
        messages: { nombre:{
              required: "Ingrese su nombre",
              lettersonly: "Ingrese un nombre válido"
           },
            
            apellido:{
              required: "Ingrese su apellido",
              lettersonly: "Ingrese un apellido válido"
           },
           
           fechanacimiento:{
              required: "Ingrese su fecha de nacimiento"     
           },
           
           genero:{
              required: "Seleccione su género"          
           },
           
            correo: {
                required: "Ingrese su correo electrónico",
                email: "Ingrese un correo electrónico válido"
            },
            
            contraseña: {
                required: "Ingrese una contraseña entre 5-15 caracteres"
            },
           
           telefono: {
                required: "Ingrese su número de teléfono",
                digits: "Ingrese un número de teléfono válido"
            }
            
        }
            
    });
       
});


$(document).ready(function() {
	//variables
	var pass1 = $('[name=contrasena]');
	var pass2 = $('[name=confirmarcontrasena]');
	var confirmacion = "Las contraseñas si coinciden";
	var longitud = "La contraseña debe estar formada entre 6-10 carácteres (ambos inclusive)";
	var negacion = "No coinciden las contraseñas";
	var vacio = "La contraseña no puede estar vacía";
	//oculto por defecto el elemento span
	var span = $('<span></span>').insertAfter(pass2);
	span.hide();
	//función que comprueba las dos contraseñas
	function coincidePassword(){
	var valor1 = pass1.val();
	var valor2 = pass2.val();
	//muestro el span
	span.show().removeClass();
	//condiciones dentro de la función
	if(valor1 != valor2){
	span.text(negacion).addClass('negacion');	
	}
	if(valor1.length==0 || valor1==""){
	span.text(vacio).addClass('negacion');	
	}
	if(valor1.length<6 || valor1.length>10){
	span.text(longitud).addClass('negacion');
	}
	if(valor1.length!=0 && valor1==valor2){
	span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
	}
	}
	//ejecuto la función al soltar la tecla
	pass2.keyup(function(){
	coincidePassword();
	});
});

    
    
   




