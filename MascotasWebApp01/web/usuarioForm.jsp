
<%@page import="java.util.Iterator"%>
<%@page import="programmer.pojos.UsuarioObj"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario Form</title>
    </head>
    <%
        ArrayList<UsuarioObj> CArray = 
                (ArrayList<UsuarioObj>)request.getSession().getAttribute("usuarios");
        Iterator<UsuarioObj> iteArray = CArray.iterator();
    %>
    <body>
        <h1>Usuario Form</h1>
        <br><br>
        <a href="usuarioNew.jsp">Nuevo Usuario</a>
        <br><br>
        <table>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th> 
                <th>Fecha de Nacimiento</th>
                <th>Género</th>
                <th>Correo</th>
                <th>Contraseña</th>
                <th>Teléfono</th>
                <th>Nivel</th>
              </tr>
          <%
            if(iteArray!=null)
            {
                UsuarioObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
        %>
                <tr>
                    <td><%= CTemp.getId() %></td>
                    <td><%= CTemp.getNombre() %></td>
                    <td><%= CTemp.getApellido() %></td>
                    <td><%= CTemp.getFechadeNacimiento() %></td>
                    <td><%= CTemp.getGenero() %></td>
                    <td><%= CTemp.getCorreo() %></td>
                    <td><%= CTemp.getContrasena() %></td>
                    <td><%= CTemp.getTelefono() %></td>
                    <td><%= CTemp.getNivel() %></td>
                    <td>
                        <a href="UsuarioServlet?formid=4&id=<%= CTemp.getId() %>">
                            update
                        </a>
                    </td>
                    <td>
                        <a href="UsuarioServlet?formid=3&id=<%= CTemp.getId() %>">
                            delete
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
