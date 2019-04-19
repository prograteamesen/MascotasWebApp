<%-- 
    Document   : mealUpdateForm
    Created on : Apr 6, 2019, 12:09:37 AM
    Author     : balbi
--%>

<%@page import="programmer.objects.CategoriaObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Categoria</title>
    </head>
    <%
        CategoriaObj CCategoria = 
                (CategoriaObj)request.getSession().getAttribute("categoria");
        
    %>    
    <body>
        <h1>Modificar Categoria</h1>
        <br><br>
        
        <form id="myform" name="myform" action="CategoriaServlet" method="get">
            <label>Id:</label><br>
            <input type="number" id="nonId" name="nonId" value="<%= CCategoria.getId() %>" disabled />
            <br><br>
            
            
            <label>Categoria:</label><br>
            <input type="text" id="categoria" name="categoria" value="<%= CCategoria.getCategoria() %>" />
            <br><br>
            
            <input type="submit" id="mysubmit" name="mysubmit" value="Modificar"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type="hidden" id="id" name="id" value="<%= CCategoria.getId() %>" />
        </form>
        
        <br><br>
        <a href="categoriaForm.jsp">Regresar</a>
    </body>
</html>
