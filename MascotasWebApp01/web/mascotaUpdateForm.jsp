<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.MascotaObj"%>
<%@page import="mascotas.pojos.MascotaViewObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Actualizar registros</title>
    </head>
     <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
            <div class="inner" align="right">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%><br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
            </div>
    </header>
<%
    }else{
        strNombre = "to Woof!";
%>      
        <header id="header">
            <div class="inner" align="right">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <a href="login.jsp" class="button2">Iniciar sesión </a>
                    <a href="usuarioNew.jsp" class="button2">Registrarse </a> <br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>    
<%}   
    if(request.getParameter("cerrar")!=null){
                objSession.invalidate();
                response.sendRedirect("index.jsp");
    } 
        MascotaViewObj CMascota = 
                (MascotaViewObj)request.getSession().getAttribute("mascota");
        
        MascotaObj CMascota1 = 
                (MascotaObj)request.getSession().getAttribute("mascota2");
    %>
    <body class="subpage">
         <head>
            <br><br>
            <h2 align="center"><strong>Actualizar Mascota</strong></h2>
            <br><br>
        </head> 
       
        <form id="myform" name="myform" action="MascotaServlet" method="get">
             
        <div  align="center">
        <div class="6u 12u(xsmall)"> 
            
            <input type="number" id="nonId" name="nonId" value="<%=CMascota.getId()%>" 
                   disabled/>
            <br><br>
            
            <input type="text" id="nombre" name="nombre" value="<%=CMascota.getNombre()%>" placeholder="Nombre"
                   autocomplete="off"/>
            <br><br>
            
            <input type="number" id="edad" name="edad" value="<%=CMascota.getEdad()%>" placeholder="Edad"
                   autocomplete="off"/>
            <br><br>
            
            <select name="categoria" id="categoria" placeholder="Categoria">
                <option id="cat<%=CMascota1.getIdCategoria()%>" 
                        value="<%=CMascota1.getIdCategoria()%>" selected>
                    <%=CMascota.getCategoria()%> 
                </option> 
            </select>
            <br><br>
            
            <input type="text" id="raza" name="raza" value="<%=CMascota.getRaza()%>" placeholder="Raza"
                   autocomplete="off"/>
            <br><br>
            
            <input type="text" id="tamaño" name="tamaño" value="<%=CMascota.getTamaño()%>" placeholder="Tamaño"
                   autocomplete="off"/>
            <br><br>
            
            <input type="text" id="descripcion" name="descripcion" value="<%=CMascota.getDescripcion()%>" placeholder="Descripción" 
                   autocomplete="off"/>
            <br><br>
            
            <select name="ong" id="ong" placeholder="ONG">
            <option id="ong<%=CMascota1.getIdOng()%>" 
                        value="<%=CMascota1.getIdOng()%>" selected>
                    <%=CMascota.getOng()%> 
            </option> 
            </select>
            <br><br>
            
           </div>
           <div class="12u">    
           <ul class="actions">
            <input type="submit" id="mysubmit" name="mysubmit" value="Actualizar"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type="hidden" id="id" name="id" value="<%=CMascota.getId()%>" />
           </ul>
           </div>
           </div>
           
        </form>  
    </body>
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
