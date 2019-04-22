<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Styles/style.css" rel="stylesheet" type="text/css"/>
        <title>Adopción</title>
         <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        int iLevel = Ulogic.Level(strCorreo);
        String strNombre;

        //Verificar si es administrador
        if(iLevel == 1){
                response.sendRedirect("indexAdmin.jsp");
            }
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
            %>
            <header id="header">
                    <div class="inner" align="left">
                    <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
                        <nav id="nav" align="right">
                            <%out.print("<a href='perfilUsuario.jsp'>Mi perfil </a>");%>
                            <%out.print("<a href='index.jsp?cerrar=true'> Cerrar sesión "+strNombre+"</a>");%><br>
                        </nav>
                        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
                    </div>
            </header>
            
            
            
        <%
            }else{
                strNombre = "to Woof!";
        %>      
                <header id="header">
                    <div class="inner" align="left">
                    <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
                    </div>
                    
                    <div class="inner" align="right">
                        <nav id="nav" >
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
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
                <title>Conoce a nuestras mascotas</title>
            </head>
    </head> 
            
    <body class="subpage" >
        
        <head>
                <br><br>
                <h2 align="center"><strong>CONOCE A LAS MASCOTAS</strong></h2>
        </head>
        <br>
        <div class="12u" align="center">
                <ul class="actions">
                    <a href="MascotaServlet?formid=7" class="button">Estoy listo/a para adoptar</a>
                </ul>
        </div>
        <br><br>
        <div>
            
            <div class="column">  
                <img src="Styles/Mascotas/Kaiser.jpeg" alt="" width="225" height="150"/>
                <h2>Keiser</h2>
            </div>
            
            <div class="column" >
                <img src="Styles/Mascotas/Atenea.PNG" alt="Atenea"  width="225" height="150"/>
                <h2>Atenea</h2>
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2 style="color: white">Poppy</h2>
                <img src="Styles/Mascotas/Poppy.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>

            <div class="column" style="background-color:rgb(255,255,255);">
                <h2>Dogguie</h2>
                <img src="Styles/Mascotas/Dogguie.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div> 
        </div>
        
        <div>
            
            <div class="column" style="background-color:rgb(255,255,255);">
                <ul class="actions">
                         <a href="MascotaServlet?formid=13" value="1" class="button">Micho</a>
                         
                    </ul>
                <img src="Styles/Mascotas/Micho.jpeg" alt="" width="225" height="150" />
                <br><br> 
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2 style="color: white">Ruffus</h2>
                <img src="Styles/Mascotas/Rufus.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>
            
            <div class="column" style="background-color:rgb(255,255,255);">
                <h2>Fabio</h2>
                <img src="Styles/Mascotas/Fabio.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>

            <div class="column" style="background-color:rgb(108,192,145);">
                <h2 style="color: white">Milu</h2>
                <img src="Styles/Mascotas/Milu.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>
            <br><br>
        </div>
        <br><br>
        <div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2 style="color: white">Roger</h2>
                <img src="Styles/Mascotas/Roger.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>
            
            <div class="column" style="background-color:rgb(255,255,255);">
                <h2>Tommy</h2>
                <img src="Styles/Mascotas/Stan Lee.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2 style="color: white">Stan Lee</h2>
                <img src="Styles/Mascotas/Tommy.jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>

            <div class="column" style="background-color:rgb(255,255,255);">
                <h2>Shiro</h2>
                <img src="Styles/Mascotas/Shiro (2).jpeg" alt="" width="225" height="150"/>
                <br><br> 
            </div>
        </div>
        
        <img  src="Styles/UsuarioDog.jpg" alt="Cute"/>
               
    </body>
    <footer id="footer2">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
