<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
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
            <div class="inner" align="right">
                <nav id="nav">
                    <%out.print("<a href='perfilUsuario.jsp'>Mi perfil </a>");%>
                    <%out.print("<a href='index.jsp?cerrar=true'> Cerrar Sesión "+strNombre+"</a>");%><br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
            </div>
    </header>                          
<%
    }else{
        strNombre = "";
%>      
        <header id="header">
            <div class="inner" align="right">
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Inicio</title>
    </head>
    <body>
        <section id="banner">
            <div class="inner">
                   <img src="Styles/Logo.png" alt="Logo" style="width: 500px"/>
                   <br><br>
                <header>
                    <h1>¡ Bienvenido/a <%out.println(strNombre);%>!</h1>
                </header>

                <div class="flex ">
                    <div>
                        <a href="MascotaServlet?formid=12" ><i class="fas fa-paw fa-3x"></i></a>
                        <h3>Mascotas</h3>
                        <p>Conoce las diferentes mascotas <br> que puedes adoptar</p>
                    </div>
                    
                    <div>
                        <a href="instruccionesDonar.jsp"><i class="fas fa-hand-holding-heart fa-3x"></i></a>
                        <h3>Donaciones</h3>
                        <p>Dona fondos para ayudar con el <br> cuidado de las mascotas</p>
                    </div>
                    
                    <div>
                        <a href="OngServlet?formid=2"><i class="fas fa-globe-americas fa-3x"></i></a>
                        <h3>ONG</h3>
                        <p>Conoce las organizaciones que <br> forman parte de nuestra causa</p>
                    </div>
                </div>
                
                <footer>
                    <a href="#footer" class="button">Contactanos</a>
                </footer>
            </div>
        </section>

        <section id="three" class="wrapper align-center">
            <div class="inner">
                <div class="flex flex-2">
                    <article>
                        <div class="image round">
                            <img src="Styles/NewUsuarioDog.jpg" alt="Cute"/>
                        </div>
                        <header>
                            <h3>¿Te interesa<br/> donar?</h3>
                        </header>
                        <p>Donar a una ong es muy fácil. Puedes<br />hacerlo por internet en menos de tres<br /> minutos de manera rápida y sencilla.</p>
                        <footer>
                            <a href="instruccionesDonar.jsp" class="button">¿Cómo hacerlo?</a>
                        </footer>
                    </article>
                    <article>
                        <div class="image round">
                            <img src="Styles/Misho.jpg" alt="CuteMisho" />
                        </div>
                        <header>
                            <h3>¿Por qué<br />debería adoptar?</h3>
                        </header>
                        <p>No compres, ¡adopta! Cientos<br />de amigos esperan en calles y<br />refugios una oportunidad</p>
                        <footer>
                            <a href="beneficiosAdoptar.jsp" class="button">¿Cómo hacerlo?</a>
                        </footer>
                    </article>
                </div>
            </div>
        </section>
    </body>
    <footer id="footer">
        <div class="inner">

            <h2 style="color:white">Contactanos</h2>
            <br>
            <form action="#" method="post">
                    <center>
                            <input name="name" id="name" type="text" placeholder="Nombre" autocomplete="off">
                            <br>
                    </center>
                    <center>
                            <input name="email" id="email" type="email" placeholder="Email" autocomplete="off">
                            <br>
                    </center>
                    <center>
                            <textarea name="comentarios" rows="5" cols="10" placeholder="Mensaje"></textarea>
                            <br>
                    </center>
                    <ul class="actions">
                            <li><input value="Enviar Mensaje" class="button alt" type="submit"></li>
                    </ul>
            </form>

        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
        </div>
    </footer>
    <%--
        <a href="UsuarioServlet?formid=2">Usuario Form</a>
    --%>
</html>
