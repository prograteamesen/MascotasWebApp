<%@page import="programmer.pojos.OngObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="programmer.pojos.CategoriaObj"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva mascota</title>
    </head>
    <%
        ArrayList<CategoriaObj> CCategoriaArray = 
                (ArrayList<CategoriaObj>)request.getSession().getAttribute
        ("categorias");
        Iterator<CategoriaObj> iteCategoriaArray = CCategoriaArray.iterator();
        
        ArrayList<OngObj> COngArray = 
                (ArrayList<OngObj>)request.getSession().
                        getAttribute("ongs");
        Iterator<OngObj> iteOngArray = COngArray.iterator();
    %>    
    <body>
        <h1>Registrar mascota</h1>
        <br><br>
        <form name="mascotaForm" action="MascotaServlet" method="get">
            <label>Nombre:</label><br>
            <input type="text" name="nombre" id="nombre"/>
            <br><br>
            
            <label>Edad:</label><br>
            <input type="number" name="edad" id="edad"/>
            <br><br>
            
            <label>Categoría:</label><br>
            <select name="categoria" id="categoria">
                <%
                    if(iteCategoriaArray!=null)
                    {
                        CategoriaObj CCategoriaTemp;
                        while(iteCategoriaArray.hasNext())
                        {
                            CCategoriaTemp = iteCategoriaArray.next();
                %>
                <option id="categoria<%=CCategoriaTemp.getId()%>" 
                    name="categoria<%=CCategoriaTemp.getId()%>" 
                    value="<%=CCategoriaTemp.getId()%>">
                    <%=CCategoriaTemp.getCategoria()%>
                </option>
                <%
                        }
                    }
                %>
            </select> 
            <br><br>
            
            <label>Raza:</label><br>
            <input type="text" name="raza" id="raza"/>
            <br><br>
            
            <label>Tamaño:</label><br>
            <input type="text" name="tamaño" id="tamaño"/>
            <br><br>
            
            <label>Descripción:</label><br>
            <input type="text" name="descripcion" id="descripcion"/>
            <br><br>
            
            <label>ONG:</label><br>
            <select name="ong" id="ong">
                <%
                    if(iteOngArray!=null)
                    {
                        OngObj COngTemp;
                        while(iteOngArray.hasNext())
                        {
                            COngTemp = iteOngArray.next();
                %>
                <option id="ong<%=COngTemp.getId()%>" 
                    name="ong<%=COngTemp.getId()%>" 
                    value="<%=COngTemp.getId()%>">
                    <%=COngTemp.getNombre()%>
                </option>
                <%
                        }
                    }
                %>
            </select> 
            <br><br>
            
            <input type="submit" name="mysubmit" value="Registrar"/>
            
            <input type="hidden" name="formid" value="1"/>
            <br><br>
        </form>   
    </body>
</html>
