<%-- 
    Document   : ongNew
    Created on : Mar 24, 2019, 12:11:46 AM
    Author     : miche
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New ONG</title>
    </head>
    <body>
        <h1>New ONG</h1>
         <!--form...-->
        <form name="ongNewForm" id="ongNewForm" action="OngServlet" method="get" autocomplete="off">
            
            <label>Nombre:</label><br>
            <input type="text" id="nombre" name="nombre"/>
            <br><br>
            
            <label>Contacto:</label><br>
            <input type="text" id="contacto" name="contacto"/>
            <br><br>
            
            <label>Descripción:</label><br>
            <input type="text" id="descripcion" name="descripcion"/>
            <br><br>
            
            <label>Número de Cuenta Bancaria:</label><br>
            <input type="number" id="ncuenta" name="ncuenta"/>
            <br><br>
           
            <label>Link:</label><br>
            <input type="text" id="link" name="link"/>
            <br><br>
            
            <input type="submit" id="myform" name="myform" value="Enviar"/>
            <br><br>
            <input type="hidden" name="formid" value="1"/>
            <br><br>
            
        </form>
    </body>
</html>
