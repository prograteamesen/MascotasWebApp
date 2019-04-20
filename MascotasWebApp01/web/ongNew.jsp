<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="Scripts/jquery.validate.js" type="text/javascript"></script>
        <script src="Scripts/ongScript.js" type="text/javascript"></script>
        <title>New ONG</title>
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
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strNombre+"</a>");%><br>
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
                <nav id="nav">
                    <a href="login.jsp" class="button2">Log in </a>
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
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Nueva ONG</strong></h2>
            <br><br>
        </head> 
         <!--form...-->
        <form name="ongNewForm" id="ongNewForm" action="OngServlet" method="get" autocomplete="off">
            <div  align="center">
            <div class="6u 12u(xsmall)">    
            
                <input type="text" id="nombre" name="nombre" autocomplete="off" placeholder="Nombre"/>
                <br><br>

                <input type="text" id="contacto" name="contacto" autocomplete="off" placeholder="Contacto"/>
                <br><br>

                <input type="text" id="descripcion" name="descripcion" autocomplete="off" placeholder="Descripción"/>
                <br><br>

                <input type="number" id="ncuenta" name="ncuenta" autocomplete="off" placeholder="Número de Cuenta Bancaria"/>
                <br><br>

                <input type="text" id="link" name="link" autocomplete="off" placeholder="Link"/>
                <br><br>
            </div>
             <div class="12u">    
                 <ul class="actions">
                    <input type="submit" id="myform" name="myform" value="Crear"/>
                    <br><br>
                    <input type="hidden" id="formid" name="formid" value="1"/>
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
