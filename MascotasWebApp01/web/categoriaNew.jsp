<%-- 
    Document   : NewCategoria
    Created on : 03-24-2019, 12:03:34 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nueva Categoria </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="Scripts/jquery.validate.js" type="text/javascript"></script>
        <script src="Scripts/categoriaFormScript.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Nueva Categoria </h1>
        <br><br>
        
        <form id="myform" name="myform" action="CategoriaServlet" method="get">
            <label>Categoria:</label><br>
            <input type="text" id="categoria" name="categoria" />
            <br><br>
            
            <input type="submit" id="mysubmit" name="mysubmit" value="Crear"/>
            <input type="hidden" id="formid" name="formid" value="1" />
        </form>
        <br><br>
        <a href="categoriaForm.jsp">Regresar</a>
        
    </body>
</html>
