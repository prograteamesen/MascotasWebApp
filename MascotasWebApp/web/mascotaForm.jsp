<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas</title>
    </head>
    <body>
        <h1>Mascotas</h1>
        <br><br>
        <a href="MascotaServlet?formid=6">Registrar mascota</a>
        <br><br>
        
        <table style="width:70%" border="1">
            <tr>
              <th>ID</th>
              <th>Nombre</th> 
              <th>Edad</th>
              <th>ID Categoria</th>
              <th>Raza</th>
              <th>Tamaño</th>
              <th>Descripcion</th>
              <th>ID ONG</th>
            </tr>
            <c:forEach var="mascota" items="${arreglo}">
            <tr>
              <td>${mascota.getId()}</td>
              <td>${mascota.getNombre()}</td> 
              <td>${mascota.getEdad()}</td>
              <td>${mascota.getIdCategoria()}</td>
              <td>${mascota.getRaza()}</td>
              <td>${mascota.getTamaño()}</td>
              <td>${mascota.getDescripcion()}</td>
              <td>${mascota.getIdOng()}</td>
              <td><a href="UsuarioServlet?formid=4&id=${mascota.getId()}">Actualizar</a></td>
              <td><a href="UsuarioServlet?formid=3&id=${mascota.getId()}">Eliminar</a></td>
            </tr>
            </c:forEach>
        </table>    
    </body>
</html>
