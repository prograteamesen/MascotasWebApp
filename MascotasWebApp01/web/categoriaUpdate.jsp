<%-- 
    Document   : categoriaUpdate
    Created on : 03-24-2019, 01:59:46 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
    </head>
    <body>
        <h1>Modificar Categoria</h1>
        <br><br>
        <form name="NewCategoria" action="CategoriaServlet" method="get">
            Id:<br>
            <input type="text" name="regid" value="${arreglo[0].getId()}" disabled/> 
            <br><br>
            Categoria:<br>
            <input type="text" name="categoria" value="${arreglo[0].getCategoria()}"/>
            <br><br>
            <input type="submit" name="myform" value="Modificar" />
            <br><br>
            
            <input type="hidden" name="id" value="${arreglo[0].getId()}" />
            <br><br>
            <input type="hidden" name="formid" value="5"/>
        
            
        </form>
            <br><br>
            <a href="categoriaForm.jsp">Regresar</a>
    </body>
</html>
