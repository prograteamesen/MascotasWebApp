<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.CategoriaObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" 
              content="text/html; charset=UTF-8">
        <title>Categoria</title>
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    </head>
        <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        int iLevel = Ulogic.Level(strCorreo);
        String strNombre;
        
               //Verificar si es administrador
        if(iLevel == 1){
                
        } else {
            response.sendRedirect("index.jsp");
        }
        
        ArrayList<CategoriaObj> CArray = 
                (ArrayList<CategoriaObj>)request.getSession().getAttribute("categorias");
        Iterator<CategoriaObj> iteArray = CArray.iterator();
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString();
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
        <div class="inner">
            <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
            <nav id="nav">
                <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%>
                <a href="index.jsp">Inicio</a>
            </nav>
            <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
        </div>
    </header>
<%
    }else{
%>      
        <header id="header">
            <div class="inner" align="right">
                <nav id="nav">
                    <a href="login.jsp" class="button2">Iniciar sesión </a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>    
<%}   
    if(request.getParameter("cerrar")!=null){
                objSession.invalidate();
                response.sendRedirect("index.jsp");
    } 
%>
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Categorías</strong></h2>
        </head>
        
        <div class="12u" align="center">
            <ul class="actions">
                <a href="categoriaNew.jsp" class="button">Agregar Categoria</a>
            </ul>
        </div>
        
        <table>
        <tr>
            <th>Id</th>
            <th>Categoria</th>
            <th>Actualizar</th>
            <th>Eliminar</th>
            
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
    </body>
    
    <footer id="footer2">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>