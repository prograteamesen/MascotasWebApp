
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Nuevo Usuario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <h1>Nuevo Usuario</h1>
     
        <form name="usuarioNewForm" action="UsuarioServlet" method="post">
            Nombre: <br>
            <input type="text" name="nombre" />
            <br><br>
            Apellido: <br>
            <input type="text" name="apellido" />
            <br><br>
            Fecha de Nacimiento: <br>
            <input type="text" name="fechanacimiento" />
            <br><br>
            Género: <br>
            <input type="text" name="genero" />
            <br><br>
            Correo: <br>
            <input type="text" name="correo" />
            <br><br>
            Contraseña: <br>
            <input type="text" name="contrasena" />
            <br><br>
            Teléfono: <br>
            <input type="number" name="telefono" />
            <br><br>-
            <input type ="submit" name="myform" value="Create" />
            <br><br>
            <input type ="hidden" name="formid" value="1" />       
        </form>
     
    </body>
</html>