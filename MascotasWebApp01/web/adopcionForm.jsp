<%-- 
    Document   : adopcionForm
    Created on : 03-25-2019, 02:57:01 PM
    Author     : Ernesto Norio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="mascotas.pojos.AdopUserPetObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de Adopcion</title>
    </head>
    <%
        ArrayList<AdopUserPetObj> CArray = 
                (ArrayList<AdopUserPetObj>)request.getSession().getAttribute("adopciones");
        Iterator<AdopUserPetObj> iteArray = CArray.iterator();
    %>
    <body>
        <h1>Adopciones</h1>
        <br>
        <a href="MascotaServlet?formid=2">Nueva Adopción</a>
        <br>
        
        <table style="width:70%" border="1" align="center" >
            <tr>
              <th>ID</th>
              <th>Mascota</th>
              <th>Dueño</th>
              <th>Eliminar Información</th>
            </tr>
                    <%
            if(iteArray!=null)
            {
                AdopUserPetObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
        %>
                <tr>
                    <td><%= CTemp.getId() %></td>
                    <td><%= CTemp.getMascota()%></td>
                    <td><%= CTemp.getNombre()%></td>
                    <td>
                        <a href="AdopcionServlet?formid=3&id=<%=CTemp.getId()%>">
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
