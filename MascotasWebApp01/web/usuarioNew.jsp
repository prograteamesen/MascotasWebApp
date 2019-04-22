
<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Nuevo Usuario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="Scripts/jquery.validate.js" type="text/javascript"></script>
        <script src="Scripts/usuarioScript.js" type="text/javascript"></script>
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
     </head>
    <%
         HttpSession objSession = request.getSession(false);
         String strCorreo = (String)objSession.getAttribute("correo");
         String strNombre;
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
        UsuarioLogic Ulogic = new UsuarioLogic();
        strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
            <div class="inner" align="right">
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%><br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
            </div>
    </header>
<%
    }else{
%>
        <header id="header">
            <div class="inner" align="right">
                <a href="index.jsp" class="logo"><strong>Woof!</strong></a>
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
            <h2 align="center"><strong>Nuevo Usuario</strong></h2>
            <br><br>
        </head> 
     
        <form id="usuarionewform" name="usuarionewform" action="UsuarioServlet" method="post">
            
            <div  align="center" class="row uniform">
                <div class="6u 12u(xsmall)">
                    <p><input type="text" id="nombre" name="nombre" autocomplete="off" placeholder="Nombre" oninput="this.className = ''"/></p>
                    <br>
                    <input type="text" id="apellido" name="apellido" autocomplete="off" placeholder="Apellido" oninput="this.className = ''"/>
                    <br><br>
                    <input type="text" id="fechanacimiento" name="fechanacimiento" autocomplete="off" placeholder="Fecha de Nacimiento" oninput="this.className = ''"/>
                    <br><br>
                    <select class="dropdown" id="genero" name="genero" placeholder="G" align="center" required />
                           <option value="0" hidden  >Género</option>
                           <option value="Femenino">Femenino</option>
                           <option value="Masculino">Masculino</option>  
                    </select>
                    <br><br>
                </div>
                
                <div class="6u 12u(xsmall)">
                    <input type="email" id="correo" name="correo" autocomplete="off" placeholder="Correo" oninput="this.className = ''"/>
                    <br><br>
                    <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" oninput="this.className = ''"/>
                    <br><br>
                    <input type="tel" id="telefono" name="telefono" autocomplete="off" placeholder="Teléfono" oninput="this.className = ''"/>
                    <br><br>
                </div>

                <div class="12u">
                    <ul class="actions">
                        <input type="submit" id="myform" name="myform" value="Registrarse" class="button"/>
                        <input type="hidden" name="formid" value="1"/>
                    </ul>
                </div>

                <div style="text-align:center;margin-top:40px;">
                    <span class="step"></span>
                    <span class="step"></span>
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