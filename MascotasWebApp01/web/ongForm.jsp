<%-- 
    Document   : ongForm
    Created on : Mar 13, 2019, 8:54:55 PM
    Author     : miche
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONG Form</title>
    </head>
    <body>
        <h1>ONG Form</h1>
        
        <!--link...-->
        <a href="ongNew.jsp">Nueva ONG</a>
        <br><br>
        <!--table...-->
        <table style="width:70%" border="1">
            <tr>
                <th>Nombre</th>
                <th>Contacto</th>
                <th>Descripción</th>
                <th>Número de Cuenta</th>
                <th>Link</th>
                <th>Actualizar</th>
                <th>Eliminar</th>
            </tr>
            
            <c:forEach items="${arreglo}" var="ong">
                <tr>
                     <td>${ong.getId()}</td>
                     <td>${ong.getNombre()}</td>
                     <td>${ong.getContacto()}</td>
                     <td>${ong.getDescripcion()}</td> 
                     <td>${ong.getNCuenta()}</td>
                     <td>${ong.getLink()}</td>
                     <td>
                         <a href="OngServlet?formid=4&id=${ong.getId()}">Actualizar</a>
                     </td>
                     <td>
                         <a href="OngServlet?formid=3&id=${ong.getId()}">Eliminar</a>
                     </td>
                   </tr>
           </c:forEach>
            
        </table>
        
    </body>
</html>
