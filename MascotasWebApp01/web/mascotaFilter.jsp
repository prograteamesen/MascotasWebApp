<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="java.util.Iterator"%>
<%@page import="mascotas.pojos.MascotaViewObj"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Busqueda filtrada</title>
    </head>
        <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;       
        
        if(objSession.getAttribute("correo")!= null){
        strCorreo = objSession.getAttribute("correo").toString();
        strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
            <header id="header">
            <div class="inner">
                <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
                    <a href="index.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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

        ArrayList<MascotaViewObj> MArray = 
            (ArrayList<MascotaViewObj>)request.getSession().getAttribute("mascotas");
        Iterator<MascotaViewObj> iteArray = MArray.iterator();
    %>
    <body class="subpage">
        <<h2 align="center"><strong>Resultados</strong></h2>
        <br><br>
        <table style="width:80%" class="center">
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
