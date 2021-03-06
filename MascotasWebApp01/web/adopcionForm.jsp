<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="java.util.Iterator"%>
<%@page import="mascotas.pojos.AdopUserPetObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Formulario de Adopcion</title>
    </head>
    <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;
                      
        ArrayList<AdopUserPetObj> CArray = 
                (ArrayList<AdopUserPetObj>)request.getSession().getAttribute("adopciones");
        Iterator<AdopUserPetObj> iteArray = CArray.iterator();
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString();
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
        <div class="inner">
            <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
            <nav id="nav">
                <%out.print("<a href='indexAdmin.jsp?cerrar=true'>Cerrar Sesión "+strNombre+"</a>");%>
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
                <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
                <nav id="nav">
                    <a href="login.jsp" class="button2">Iniciar sesión</a>
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
            <h2 align="center"><strong>Formulario de Adopción</strong></h2>
        </head>
        <br>
        <center>
        <table style="width:50%" border="1" align="center" >
            <tr>
              <th>ID</th>
              <th>Dueño</th>
              <th>Mascota</th>
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
        </center>
    </body>
    <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
