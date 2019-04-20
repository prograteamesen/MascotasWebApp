<%@page import="java.util.Iterator"%>
<%@page import="programmer.objects.CategoriaObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" 
              content="text/html; charset=UTF-8">
        <title>Categoria</title>
        <link href="styles/tableStyles.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <%
        ArrayList<CategoriaObj> CArray = 
                (ArrayList<CategoriaObj>)request.getSession().getAttribute("categorias");
        Iterator<CategoriaObj> iteArray = CArray.iterator();
    %>
    <body>
        <h1>Categoria</h1>
        <br>
        <a href="categoriaNew.jsp">Nueva Categoria</a>
        
        <br><br>
        <table>
        <tr>
            <th>Id</th>
            <th>Categoria</th>
            
        </tr>
        <%
            if(iteArray!=null)
            {
                CategoriaObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
        %>
                <tr>
                    <td><%= CTemp.getId() %></td>
                    <td><%= CTemp.getCategoria() %></td>
                    
                    <td>
                        <a href="CategoriaServlet?formid=4&id=<%= CTemp.getId() %>">
                            Actualizar
                        </a>
                    </td>
                    <td>
                        <a href="CategoriaServlet?formid=3&id=<%= CTemp.getId() %>">
                            Eliminar
                        </a>
                    </td>
                </tr>
        <%
                }
            }
        %>
        
        </table>
        <br><br>
        <a href="index.jsp">Regresar</a>
    </body>
</html>