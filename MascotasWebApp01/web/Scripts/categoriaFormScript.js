$(document).ready(function(){
    $("#myform").validate({
        rules:{
            categoria:"required"
        },
        messages:{
            categoria:" Campo obligatorio"
        }
    });
    
});


