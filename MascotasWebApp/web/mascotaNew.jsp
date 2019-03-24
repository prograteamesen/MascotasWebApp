<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva mascota</title>
    </head>
    <body>
        <h1>Registrar mascota</h1>
        <br><br>
        <form name="mascotaForm" action="MascotaServlet" method="get">
            Nombre: <br>
            <input type="text" name="nombre"/>
            <br><br>
            
            Edad: <br>
            <input type="number" name="edad"/>
            <br><br>
            
            Categoría: <br>
            <select name="categoria">
                <c:forEach items="${arreglocategoria}" var="categoria">
                    <option value="${categoria.getId()}">
                        ${categoria.getId()} - ${categoria.getCategoria()}
                    </option>
                </c:forEach>
            </select> 
            <br><br>
            
            Raza: <br>
            <input type="text" name="raza"/>
            <br><br>
            
            Tamaño: <br>
            <input type="text" name="tamaño"/>
            <br><br>
            
            Descripción: <br>
            <input type="text" name="descripcion"/>
            <br><br>
            
            ONG: <br>
            <input type="text" name="ong"/>
            <br><br>
            
            <input type="submit" name="mysubmit" value="Registrar"/>
            
            <input type="hidden" name="formid" value="1"/>
            <br><br>
        </form>   
    </body>
</html>
