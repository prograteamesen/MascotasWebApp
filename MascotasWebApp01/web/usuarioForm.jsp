
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario Form</title>
    </head>
    <body>
        <h1>Usuario Form</h1>
        <br><br>
        <a href="usuarioNew.html">Nuevo Usuario</a>
        <br><br>
        <table style="width:80%" border="1">
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th> 
                <th>Fecha de Nacimiento</th>
                <th>Género</th>
                <th>Correo</th>
                <th>Contraseña</th>
                <th>Teléfono</th>
                <th>Nivel</th>
              </tr>
              <c:forEach items="${arreglo}" var = "usuario">
             <tr>
             <td>${usuario.getId()}</td>
             <td>${usuario.getNombre()}</td> 
             <td>${usuario.getApellido()}</td>
             <td>${usuario.getFechadeNacimiento()}</td>
             <td>${usuario.getGenero()}</td>
             <td>${usuario.getCorreo()}</td>
             <td>${usuario.getContraseña()}</td>
             <td>${usuario.getTelefono()}</td>
             <td>${usuario.getNivel()}</td>
             <th>
                 <a href="UsuarioServlet?formid=4&id=${usuario.getId()}">Actualizar</a>
             </th>            
             <th>
                 <a href="UsuarioServlet?formid=3&id=${usuario.getId()}">Borrar</a>
             </th>
           </tr>
           </c:forEach>
            </table>

    </body>
</html>
