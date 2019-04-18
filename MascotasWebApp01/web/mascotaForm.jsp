<%@page import="programmer.pojos.MascotaViewObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="programmer.pojos.MascotaObj"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas</title>
    </head>
    <%
    ArrayList<MascotaViewObj> MArray = 
        (ArrayList<MascotaViewObj>)request.getSession().getAttribute("mascotas");
    Iterator<MascotaViewObj> iteArray = MArray.iterator();
    %>
    <body>
        <h1>Mascotas</h1>
        <br><br>
        <a href="MascotaServlet?formid=6">Registrar mascota</a>
        <br><br>
        
        <table style="width:70%" border="1">
            <tr>
              <th>ID</th>
              <th>Nombre</th> 
              <th>Edad</th>
              <th>Categoria</th>
              <th>Raza</th>
              <th>Tamaño</th>
              <th>Descripcion</th>
              <th>ONG</th>
            </tr>
        <%
            if(iteArray!=null)
            {
                MascotaViewObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
        %>
                <tr>
                    <td><%= CTemp.getId() %></td>
                    <td><%= CTemp.getNombre() %></td>
                    <td><%= CTemp.getEdad() %></td>
                    <td><%= CTemp.getCategoria() %></td>
                    <td><%= CTemp.getRaza() %></td>
                    <td><%= CTemp.getTamaño() %></td>
                    <td><%= CTemp.getDescripcion() %></td>
                    <td><%= CTemp.getOng() %></td>
                    <td>
                        <a href="MascotaServlet?formid=4&id=<%= CTemp.getId()%>">
                            Actualizar registro
                        </a>
                    </td>
                    <td>
                        <a href="MascotaServlet?formid=3&id=<%=CTemp.getId()%>">
                            Borrar registro
                        </a>
                    </td>
                </tr>
        <%
                }
            }
        %>
        </table>    
    </body>
</html>
