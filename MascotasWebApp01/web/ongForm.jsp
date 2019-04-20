<%-- 
    Document   : ongForm
    Created on : Mar 13, 2019, 8:54:55 PM
    Author     : miche
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.pojos.OngObj"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONG Form</title>
    </head>
    <%
        ArrayList<OngObj> CArray = 
                (ArrayList<OngObj>)request.getSession().getAttribute("ong");
        Iterator<OngObj> iteArray = CArray.iterator();
    %>
    <body>
        <h1>ONG Form</h1>
        
        <!--link...-->
        <a href="ongNew.jsp">Nueva ONG</a>
        <br><br>
        <!--table...-->
        <table style="width:70%" border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Contacto</th>
                <th>Descripción</th>
                <th>Número de Cuenta</th>
                <th>Link</th>
                <th>Actualizar</th>
                <th>Eliminar</th>
            </tr>
             <%
            if(iteArray!=null)
            {
                OngObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
            %>
                <tr>
                     <td><%= CTemp.getId() %></td>
                     <td><%= CTemp.getNombre() %></td>
                     <td><%= CTemp.getContacto() %></td>
                     <td><%= CTemp.getDescripcion() %></td>
                     <td><%= CTemp.getNCuenta() %></td> 
                     <td><%= CTemp.getLink() %></td>
                     <td>
                        <a href="OngServlet?formid=4&id=<%= CTemp.getId() %>">Actualizar</a>
                     </td>
                     <td>
                        <a href="OngServlet?formid=3&id=<%= CTemp.getId() %>">Eliminar</a>
                     </td>
                </tr>
            <%
                }
            }
        %>
            
        </table>
        
    </body>
</html>
