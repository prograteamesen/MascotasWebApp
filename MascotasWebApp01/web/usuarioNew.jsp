
<%@page import="programmer.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Nuevo Usuario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="Scripts/loginvalidate.js" type="text/javascript"></script>
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="Scripts/loginvalidate.js" type="text/javascript"></script>
    </head>
    
    <%
         HttpSession objSession = request.getSession(false);
         String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        int iLevel = Ulogic.Level(strCorreo);
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
    %>
    <header id="header">
            <div class="inner" align="right">
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strCorreo+"</a>");%><br>
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
    <body>
        <head>
            <br><br>
            <h2 align="center"><strong>Nuevo Usuario</strong></h2>
            <br><br>
        </head> 
     
        <form name="usuarioNewForm" action="UsuarioServlet" method="post">
            
            <div  align="center">
                <div class="6u 12u$(xsmall)">
                        <input type="text" id="nombre" name="nombre" autocomplete="off" placeholder="Nombre"/>
                        <br><br>
                        <input type="text" id="apellido" name="apellido" autocomplete="off" placeholder="Apellido"/>
                        <br><br>
                        <input type="text" id="fechanacimiento" name="fechanacimiento" autocomplete="off" placeholder="Fecha de Nacimiento" />
                        <br><br>
                        <input type="text" id="genero" name="genero" autocomplete="off" placeholder="Género" />
                        <br><br>
                        <input type="email" id="correo" name="correo" autocomplete="off" placeholder="Correo"/>
                        <br><br>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña"/>
                        <br><br>
                        <input type="tel" id="telefono" name="telefono" autocomplete="off" placeholder="Teléfono(Opcinal)" />
                        <br><br>
                </div>
                
                <div class="12u$">
                    <ul class="actions">
                        <input type="submit" id="myform" name="myform" value="Registrarse" class="button"/>
                        <br><br>
                        <input type="hidden" name="formid" value="1"/>
                    </ul>
                </div>
            </div>

            
        </form>
     
    </body>
    
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>