<%-- 
    Document   : NewCategoria
    Created on : 03-24-2019, 12:03:34 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Categoria</title>
    </head>
    <body>
        <h1>Nueva Categoria</h1>
        <br><br>
        <form name="NewCategoria" action="CategoriaServlet" method="get">
            Categoria:<br>
            <input type="text" name="categoria"/>
            <br><br>
            <input type="submit" name="myform" value="Crear" />
            <br><br>
            <input type="hidden" name="formid" value="1"/>
        
            
        </form>
        <a href="categoriaForm.jsp">Regresar</a>
        
    </body>
</html>
