<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
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
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strNombre+"</a>");%>
                    <%out.print("<a href='perfilUsuario.jsp' >Mi perfil </a>");%><br>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <body>
        

        <section id="banner">
            <div class="inner">
                <header>
                    <h1>Welcome <%out.println(strNombre);%></h1>
                </header>

                <div class="flex ">
                    <div>
                        <a href="mascotas.jsp" ><i class="fas fa-paw fa-3x"></i></a>

                        <h3>Pets</h3>
                        <p>Suspendisse amet ullamco</p>
                    </div>
                    
                    <div>
                        <a href="mascotas.jsp"><i class="fas fa-hand-holding-heart fa-3x"></i></a>
                        <h3>Donations</h3>
                        <p>Class aptent taciti ad litora</p>
                    </div>
                    
                    <div>
                        <a href="OngServlet?formid=2"><i class="fas fa-globe-americas fa-3x"></i></a>
                        <h3>ONG</h3>
                        <p>Nulla vitae mauris non felis</p>
                    </div>
                    
                </div>
                
                <footer>
                    <a href="#" class="button">Get Started</a>
                </footer>
            </div>
        </section>

        <section id="three" class="wrapper align-center">
            <div class="inner">
                <div class="flex flex-2">
                    <article>
                        <div class="image round">
                            <img src="images/pic01.jpg" alt="Pic 01" />
                        </div>
                        <header>
                            <h3>Lorem ipsum<br /> dolor amet nullam</h3>
                        </header>
                        <p>Morbi in sem quis dui placerat ornare. Pellentesquenisi<br />euismod in, pharetra a, ultricies in diam sed arcu. Cras<br />consequat  egestas augue vulputate.</p>
                        <footer>
                            <a href="#" class="button">Learn More</a>
                        </footer>
                    </article>
                    <article>
                        <div class="image round">
                            <img src="images/pic02.jpg" alt="Pic 02" />
                        </div>
                        <header>
                            <h3>Sed feugiat<br /> tempus adipicsing</h3>
                        </header>
                        <p>Pellentesque fermentum dolor. Aliquam quam lectus<br />facilisis auctor, ultrices ut, elementum vulputate, nunc<br /> blandit ellenste egestagus commodo.</p>
                        <footer>
                            <a href="#" class="button">Learn More</a>
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
