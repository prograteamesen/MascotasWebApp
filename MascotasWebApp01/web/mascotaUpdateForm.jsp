<%@page import="programmer.pojos.MascotaViewObj"%>
<%@page import="programmer.pojos.OngObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="programmer.pojos.CategoriaObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="programmer.pojos.MascotaObj"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar registros</title>
    </head>
    <%
        MascotaViewObj CMascota = 
                (MascotaViewObj)request.getSession().getAttribute("mascota");
        
        MascotaObj CMascota1 = 
                (MascotaObj)request.getSession().getAttribute("mascota2");
    %>
    <body>
        <h1>Actualizar informacion de mascotas</h1>
        <br><br>
        
        <form id="myform" name="myform" action="MascotaServlet" method="get">
            <label>ID:</label><br>
            <input type="number" id="nonId" name="nonId" value="<%=CMascota.getId()%>" 
                   disabled/>
            <br><br>
            
            <label>Nombre:</label><br>
            <input type="text" id="nombre" name="nombre" value="<%=CMascota.getNombre()%>" />
            <br><br>
            
            <label>Edad:</label><br>
            <input type="number" id="edad" name="edad" value="<%=CMascota.getEdad()%>" />
            <br><br>
            
            <label>Categoria:</label><br>
            <select name="categoria" id="categoria">
                <option id="cat<%=CMascota1.getIdCategoria()%>" 
                        value="<%=CMascota1.getIdCategoria()%>" selected>
                    <%=CMascota.getCategoria()%> 
                </option> 
            </select>
            <br><br>
            
            <label>Raza:</label><br>
            <input type="text" id="raza" name="raza" value="<%=CMascota.getRaza()%>" />
            <br><br>
            
            <label>Tamaño:</label><br>
            <input type="text" id="tamaño" name="tamaño" value="<%=CMascota.getTamaño()%>" />
            <br><br>
            
            <label>Descripción:</label><br>
            <input type="text" id="descripcion" name="descripcion" value="<%=CMascota.getDescripcion()%>" />
            <br><br>
            
            <label>ONG:</label><br>
            <select name="ong" id="ong">
            <option id="ong<%=CMascota1.getIdOng()%>" 
                        value="<%=CMascota1.getIdOng()%>" selected>
                    <%=CMascota.getOng()%> 
            </option> 
            </select>
            <br><br>
            
            <input type="submit" id="mysubmit" name="mysubmit" value="Actualizar"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type="hidden" id="id" name="id" value="<%=CMascota.getId()%>" />
        </form>  
    </body>
</html>
