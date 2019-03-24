<%-- 
    Document   : ongUpdate
    Created on : Mar 23, 2019, 11:33:49 PM
    Author     : miche
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar ONG</title>
    </head>
    <body>
        <h1>Actualizar ONG</h1>
        
        <form name="ongUpdateForm" id="ongUpdateForm" action="OngServlet" method="get">
            
            <label>Id:</label>
            <input type="number" id="id" name="id" value="${arreglo[0].getId()}" disabled/>
            <br><br>
            
            <label>Nombre:</label><br>
            <input type="text" id="nombre" name="nombre" value="${arreglo[0].getNombre()}"/>
            <br><br>
            
            <label>Contacto:</label><br>
            <input type="text" id="contacto" name="contacto" value="${arreglo[0].getContacto()}"/>
            <br><br>
            
            <label>Descripción:</label><br>
            <input type="text" id="descripcion" name="descripcion" value="${arreglo[0].getDescripcion()}"/>
            <br><br>
            
            <label>Número de Cuenta Bancaria:</label><br>
            <input type="number" id="ncuenta" name="ncuenta" value="${arreglo[0].getNCuenta()}"/>
            <br><br>
           
            <label>Link:</label><br>
            <input type="text" id="link" name="link" value="${arreglo[0].getLink()}"/>
            <br><br>
            
           <br><br>
           <input type="submit" name="myform" value="Actualizar" />
           <br><br>
           <input type="hidden" name="id" value="${arreglo[0].getId()}" />
           <input type="hidden" name="formid" value="5" />
            
        </form>

        
    </body>
</html>
