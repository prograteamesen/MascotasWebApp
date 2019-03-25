<%-- 
    Document   : categoriaForm
    Created on : 03-24-2019, 11:59:34 AM
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Categoria</title>
    </head>
    <body>
        <h1>Formulario Categoria</h1>
        <br><br>
        <table style="width:70%" border="1">
          <tr>
            <th>Id</th>
            <th>Categoria</th> 
            <th>Update</th>
            <th>Delete</th>
          </tr>
          <c:forEach items="${arreglo}" var="categoria">
              <tr>
                  <td>${categoria.getId()}</td>
                  <td>${categoria.getCategoria()}</td>
                  <td>
                      <a href="CategoriaServlet?formid=4&id=${categoria.getId()}">update</a>
                      
                  </td>
                  <td>
                      <a href="CategoriaServlet?formid=3&id=${categoria.getId()}">delete</a>
                      
                  </td>
              </tr>
          </c:forEach>
          
        </table>
        <br><br>
        <a href="NewCategoria.jsp">Nueva Categoria</a>
        <br><br>
        <a href="index.jsp">Regresar</a>
        
    </body>
</html>
