
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
                
        } else {
            response.sendRedirect("index.jsp");
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
                    <%out.print("<a href='indexAdmin.jsp?cerrar=true'> Cerrar Sesión "+strNombre+"</a>");%><br>
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
                    <h1>Bienvenido/a <%out.println(strNombre);%></h1>
                </header>

                <div class="flex ">
                    <div>
                        <a href="MascotaServlet?formid=9"><i class="fas fa-paw fa-3x"></i></a>

                        <h3>Mascotas</h3>
                        <p>Conoces las diferentes mascotas <br> que puedes adoptar</p>
                    </div>
                    
                    <div>
                        <a href="AdopcionServlet?formid=2"><i class="fas fa-hand-holding-heart fa-3x"></i></a>
                        <h3>Adopciones</h3>
                        <p>Mantenimineto de adopciones <br> de las mascotas</p>
                    </div>
                    
                    <div>
                        <a href="OngServlet?formid=2"><i class="fas fa-globe-americas fa-3x"></i></a>
                        <h3>ONG</h3>
                        <p>Conoce las organizaciones que <br> forman parte de nuestra causa</p>
                        <br><br>
                    </div>
                </div>
            </div>
        </section>

        <section id="three" class="wrapper align-center">
            <div class="inner">
                <div class="flex flex-2">
                    <article>
                        <div class="image round">
                            <img src="Styles/usuario.jpeg" href="UsuarioServlet?formid=2"/>
                        </div>
                        <footer>
                            <a href="UsuarioServlet?formid=2" class="button">Usuarios</a>
                        </footer>
                    </article>
                    <article>
                        <div class="image round">
                            <img src="Styles/categoria.jpeg" href="UsuarioServlet?formid=2"/>
                        </div>
                        <footer>
                            <a href="CategoriaServlet?formid=2" class="button">Categorias</a>
                        </footer>
                    </article>
                </div>
            </div>
        </section>

    <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
    
    
    <%--
        <a href="UsuarioServlet?formid=2">Usuario Form</a>
    --%>
</html>
