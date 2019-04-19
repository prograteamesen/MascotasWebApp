<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nueva Categoria </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
