<%-- 
    Document   : nuevaAdopcion
    Created on : 03-24-2019, 11:18:49 AM
    Author     : Ernesto Norio
--%>

<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.MascotaObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adopcion</title>
    </head>
        <%
            //Obtener el nombre y Id de la mascota seleccionada.
            MascotaObj CMascota1 = 
            (MascotaObj)request.getSession().getAttribute("mascota2");
            String strId = request.getParameter("id");
            
            HttpSession objSession = request.getSession(false);
        
            UsuarioLogic Ulogic = new UsuarioLogic();
            String strNombre;
            String strCorreo;
            
            //Selecciona el nombre de la sesion iniciada
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
        %>
    <body>
        <h1>Adopcion</h1>
        <br><br>
        
        <form id="form" name="form">
           
            <label>Hola, </label>
            <input type="number" id="dueno" name="dueno"  value="<%=strNombre%>"/>
            <label>estás a punto de adoptar a:</label>
            <input type="number" id="mascota" name="mascota" value="<%=CMascota1.getNombre()%>"/>
            <br><br>
            <label> ¿Estás de acuerdo? </label>
            <br><br>
        </form>
        
            
        <form id="myform" name="myform" action="AdopcionServlet" method="get" hidden="true">
            <input type="number" id="mascota" name="mascota" value="<%=strId%>" hidden="true"/>
            <input type="number" id="dueno" name="dueno" value="<%=Ulogic.getUsuarioByCorreo(strCorreo).getId()%>" hidden="true"/>
            <input type="submit" id="mysubmit" name="mysubmit" value="¡Adoptar!"/>
            <input type="hidden" id="formid" name="formid" value="1"/>
        </form>
        
        
    </body>
</html>
