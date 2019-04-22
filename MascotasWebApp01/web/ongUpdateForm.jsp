<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.OngObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Actualizar ONG</title>
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
%>
    <%
        OngObj COng = 
                (OngObj)request.getSession().getAttribute("ong");
    %>
    <body class="subpage">
         <head>
            <br><br>
            <h2 align="center"><strong>Actualizar ONG</strong></h2>
            <br><br>
        </head> 
        
        <form name="ongUpdateForm" id="ongUpdateForm" action="OngServlet" method="get">
            
            <div  align="center">
            <div class="6u 12u(xsmall)"> 
            
            <input type="number" id="id" name="id" value="<%= COng.getId() %>" disabled/>
            <br><br>
            
            <input type="text" id="nombre" name="nombre" value="<%= COng.getNombre() %>" autocomplete="off" placeholder="Nombre"/>
            <br><br>
            
            <input type="text" id="contacto" name="contacto" value="<%= COng.getContacto() %>" autocomplete="off" placeholder="Contacto"/>
            <br><br>
            
            <input type="text" id="descripcion" name="descripcion" value="<%= COng.getDescripcion() %>" autocomplete="off" placeholder="Descripción"/>
            <br><br>
            
            <input type="number" id="ncuenta" name="ncuenta" value="<%= COng.getNCuenta() %>" autocomplete="off" placeholder="Número de Cuenta Bancaria"/>
            <br><br>
           
            <input type="text" id="link" name="link" value="<%= COng.getLink() %>" autocomplete="off" placeholder="Link"/>
            <br><br>
            
           </div>
           <div class="12u">    
           <ul class="actions">
           <br><br>
           <input type="submit" name="myform" value="Actualizar" />
           <br><br>
           <input type="hidden" name="id" value="<%= COng.getId() %>" />
           <input type="hidden" name="formid" value="5" />
           </ul>
           </div>
           </div>
           
        </form>
        <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
        </footer>
        
    </body>
</html>
