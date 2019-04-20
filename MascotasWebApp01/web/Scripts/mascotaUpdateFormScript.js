$(document).ready(function(){
    $("#mascotaUpdateForm").validate({
       rules:{
           nombre: "required",
           edad:{
               required:true,
               min:1 
           },
           raza: "required",
           tamaño: "required",
           descripcion: "required"
       },
       messages:{
           nombre: "Introducir nombre de la mascota",
           edad: {
               required: "Introducir edad", 
               min: "Edad debe ser mayor a 1 año"
            },
           categoria: "Seleccionar categoria",
           raza: "Introducir raza de la mascota",
           tamaño: "Introducir tamaño de la mascota",
           descripcion: "Introducir descripcion",
           ong: "Seleccione ONG a la que pertenece la mascota"
       } 
    });
    $('#edad').click(function(){
        alert("Introducir edad en años")
       }); 
});


