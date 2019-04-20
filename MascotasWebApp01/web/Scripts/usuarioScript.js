jQuery(function ($) {
    $('#usuarionewform').validate({
        rules: {
           nombre:{
              required: true,
              minlength: 2,
              maxlength: 30,
              lettersonly: true
           },
            
            apellido:{
              required: true,
              minlength: 2,
              maxlength: 40,
              lettersonly: true
           },
           
           fechanacimiento:{
              required: true,
              minlength: 2,
              maxlength: 40        
           },
           
           genero:{
              required: true,
              selectcheck: true        
           },
           
            correo: {
                required: true,
                minlength: 6,
                email: true
            },
            
            contraseña: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
           
           telefono: {
                required: true,
                minlength: 6,
                maxlength: 10,
                digits: true
            }
        },
            
        messages: { nombre:{
              required: "Ingrese su nombre",
              minlength: "Ingrese un nombre válido",
              maxlength: "Ingrese un nombre válido",
              lettersonly: "Ingrese un nombre válido"
           },
            
            apellido:{
              required: "Ingrese su apellido",
              minlength: "Ingrese un apellido válido",
              maxlength: "Ingrese un apellido válido",
              lettersonly: "Ingrese un apellido válido"
           },
           
           fechanacimiento:{
              required: "Ingrese su fecha de nacimiento",
              minlength: "Ingrese una fecha válida",
              maxlength: "Ingrese una fecha válida"       
           },
           
           genero:{
              required: "Seleccione su género"          
           },
           
            correo: {
                required: "Ingrese su correo electrónico",
                minlength: "Ingrese un correo electrónico válido",
                email: "Ingrese un correo electrónico válido"
            },
            
            contraseña: {
                required: "Ingrese una contraseña entre 5-15 caracteres",
                minlength: "La contraseña debe tener más de 5 caracteres",
                maxlength: "La contraseña no debe excederse de los 15 caracteres"
            },
           
           telefono: {
                required: "Ingrese su número de teléfono",
                minlength: "Ingrese un número de teléfono válido",
                maxlength: "Ingrese un número de teléfono válido",
                digits: "Ingrese un número de teléfono válido"
            }
            
        }
            
    });
    
    jQuery.validator.addMethod('selectcheck', function (value) {
        return (value != '0');
    }, "Seleccione su género");
    
});
    
    
   




