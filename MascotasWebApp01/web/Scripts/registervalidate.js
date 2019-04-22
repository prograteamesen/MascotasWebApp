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
$(document).ready(function(){
    $("#usuarionewform").validate({
        rules:{
            nombre:"required",
            appelido:"required",
            fechanacimiento:"required",
            
            correo:{
                required:true,
                email:true
            },
            
            contrasena:{
                required:true,
                password:true
            },
            confirmarcontrasena:{
                required:true,
                password:true
            },
            
            telefono:{
                required:true
            }
            },
            messages:{
                nombre:"Ingrese un nombre valido - Campo obligatorio",
                apellido:"Ingrese un apellido valido - Campo obligatorio",
                fechadenacimiento:"Ingrese una fecha de nacimiento valido: dd/mm/aaaa - Campo obligatorio",
                correo:"Ingrese una dirección de correo electronico valido - Campo obligatorio",
                telefono:"Ingrese un numero de cuenta bancaria valida - Campo obligatorio"
            }   
    });
    
});