$(document).ready(function(){
    $("#ongNewForm").validate({
        rules:{
            nombre:"required",
            
            contacto:{
                required:true,
                email:true
            },
            
            descripcion:{
                required:true
            },
            
            ncuenta:{
                max:20,
                min:10,
                required:true
            },
            
            link:{
                required:true
            }
            },
            messages:{
                nombre:"Ingrese un nombre valido - Campo obligatorio",
                contacto:"Ingrese una dirección de correo electronico valido - Campo obligatorio",
                descripcion:"Ingrese una descripcion valida - Campo obligatorio",
                ncuenta:"Ingrese un numero de cuenta bancaria valida - Campo obligatorio",
                link:"Ingrese un link valido - Campo obligatorio"
            }
            
        
    });
    
});