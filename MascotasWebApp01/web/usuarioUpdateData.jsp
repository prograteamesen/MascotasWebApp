
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Usuario</title>
    </head>
    <body>
        <h1>Actualizar Usuario</h1>
        <br><br>
        <form name="usuarioUpdateForm" action="UsuarioServlet" method="get">
            Id: <br>
            <input type ="text" name="regid" value = "${arreglo[0].getId()}" disabled/>
            <br><br>
            Nombre: <br>
            <input type="text" name="nombre" value = "${arreglo[0].getNombre()}"/>
            <br><br>
            Apellido: <br>
            <input type="text" name="apellido" value = "${arreglo[0].getApellido()}" />
            <br><br>
            Fecha de Nacimiento: <br>
            <input type="text" name="fechanacimiento" value = "${arreglo[0].getFechadeNacimiento()}"/>
            <br><br>
            Género: <br>
            <input type="text" name="genero" value = "${arreglo[0].getGenero()}"/>
            <br><br>
            Correo: <br>
            <input type="text" name="correo" value = "${arreglo[0].getCorreo()}"/>
            <br><br>
            Contraseña: <br>
            <input type="text" name="contraseña" value = "${arreglo[0].getContraseña()}"/>
            <br><br>
            Teléfono: <br>
            <input type="number" name="telefono" value = "${arreglo[0].getTelefono()}"/>
            <br><br>
            Nivel: <br>
            <input type="number" name="nivel" value = "${arreglo[0].getNivel()}"/>
            <br><br>
            <input type ="submit" name="myform" value="create" />
            <br><br>
            <input type ="hidden" name="id" value="${arreglo[0].getId()}" />
            <input type ="hidden" name="formid" value="5" />     
        </form>
    </body>
</html>
