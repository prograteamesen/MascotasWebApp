<%-- 
    Document   : nuevaAdopcion
    Created on : 03-24-2019, 11:18:49 AM
    Author     : Ernesto Norio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adopcion</title>
    </head>
    
    <body>
        <h1>Adopcion</h1>
        <br><br>
        
        <form id="form" name="form" action="" method="get">
           
            <label>Estas a punto de adoptar a: </label>
            <br>
            <input type="text" id="mascota" name="mascota"/>
            <br><br>
            <label>Este eres tu, su futuro dueño: </label>
            <br>
            <input type="text" id="dueño" name="dueño"/>
            <br><br>
            <input type="submit" id="mysubmit" name="mysubmit" value="Adoptar"/>
            
            
        </form>
        
        
    </body>
</html>
