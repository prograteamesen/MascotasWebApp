<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.pojos.OngObj"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>ONG</title>
    </head>
     <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;
                      
        ArrayList<OngObj> CArray = 
                 (ArrayList<OngObj>)request.getSession().getAttribute("ong");
         Iterator<OngObj> iteArray = CArray.iterator();
     %>
     <%
        int iLevel = Ulogic.Level(strCorreo);
        if(iLevel == 1){
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
     
     %>
        <header id="header">
            <div class="inner">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <%out.print("<a href='perfilUsuario.jsp'>Mi perfil </a>");%>
                    <%out.print("<a href='indexAdmin.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%>
                    <a href="indexAdmin.jsp">Inicio</a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>
            <body class="subpage">
             <head>
                <br><br>
                <h2 align="center"><strong>Formulario de ONG</strong></h2>
            </head>
            <br>

            <div class="12u" align="center">
                <ul class="actions">
                    <a href="ongNew.jsp" class="button">Agregar ONG</a>
                </ul>
            </div>
            
            <!--table...-->
            <table style="width:90%" class="center">
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
     
    <%
        }else{
            
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString();
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
        <header id="header">
            <div class="inner">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <%out.print("<a href='perfilUsuario.jsp'>Mi perfil </a>");%>
                    <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%>
                    <a href="index.jsp">Inicio</a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>
        <body class="subpage">
             <head>
                <br><br>
                <h2 align="center"><strong>ONG</strong></h2>
            </head>
            <br>
            
            <p align="center">
                "Si quieres participar en nuestra página web como ONG, 
                ponte en contacto con nosotros por medio de nuestrocorero@gmail.com" 
            </p>

            <!--table...-->
            <table style="width:70%" class="center">
                <tr>
                    <th>Nombre</th>
                    <th>Contacto</th>
                    <th>Descripción</th>
                    <th>Número de Cuenta</th>
                    <th>Link</th>
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
                         <td><%= CTemp.getNombre() %></td>
                         <td><%= CTemp.getContacto() %></td>
                         <td><%= CTemp.getDescripcion() %></td>
                         <td><%= CTemp.getNCuenta() %></td> 
                         <td><%= CTemp.getLink() %></td>
                    </tr>
                <%
                    }
                }
            %>

            </table>         
                
<%
    }else{
%>      
        <header id="header">
            <div class="inner" align="right">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <a href="login.jsp" class="button2">Iniciar sesión </a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>    
    <body class="subpage">
         <head>
            <br><br>
            <h2 align="center"><strong> ONG</strong></h2>
        </head>
        <br>
        
        <!--table...-->
        <table style="width:70%" class="center">
            <tr>
                <th>Nombre</th>
                <th>Contacto</th>
                <th>Descripción</th>
                <th>Número de Cuenta</th>
                <th>Link</th>
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
                     <td><%= CTemp.getNombre() %></td>
                     <td><%= CTemp.getContacto() %></td>
                     <td><%= CTemp.getDescripcion() %></td>
                     <td><%= CTemp.getNCuenta() %></td> 
                     <td><%= CTemp.getLink() %></td>
            <%
                }
            }
        }
        %>
            
        </table>
        
    </body>

    <%}   
    if(request.getParameter("cerrar")!=null){
                objSession.invalidate();
                response.sendRedirect("index.jsp");
    } 
%>

    <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
