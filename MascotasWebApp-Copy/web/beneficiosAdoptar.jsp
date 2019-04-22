<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Por qué adoptar?</title>
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
                        <a href="index.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
                <div class="inner" align="right">
                    <a href="index.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
                <title>¿Por qué debería adoptar?</title>
            </head>
    </head> 
            
    <body class="subpage" >
        <head>
            <br><br>
            <h2 align="center"><strong>¿Por qué debería adoptar?</strong></h2>
            <br>
            <div align="center">
            <img src="Styles/Cockatiel.gif" alt="Adopta plis"/>
            </div>
            <h3 align="center">Muchos animales no tienen un hogar y todos los<br /> días esperan a alguien como tú para que los quiera.</h3>
            <br>
        </head>
                
        <section id="banner-2">
            <div class="inner">

                <div class="flex" align="center">
                     <div>
                        <img src="Styles/1Paw.png" alt="Cute"/>
                        <h3 style="color:white">Paso 1</h3>
                        <p style="color:white">Una vez estés decidido  en <br /> agregar  un nuevo miembro a tu <br /> familia, selecciona la mascota que <br /> más te guste.</p>
                     </div>
                    
                    <div>
                        <img src="Styles/2Paw.png" alt="Cute"/>
                        <h3 style="color:white">Paso 2</h3>
                        <p style="color:white">Dar click en el botón adoptar <br /> en la  parte inferior de su perfil.</p>              
                    </div>
                     
                    <div>
                        <img src="Styles/3Paw.png" alt="Cute"/>
                        <h3 style="color:white">Paso 3</h3>
                        <p style="color:white">Finaliza el proceso de adopción. </p>
                    </div>
                        
                </div>
                
                <footer>
                    <a href="MascotaServlet?formid=7" class="button">Adopta ya</a>
                    <br>
                </footer>
            </div>
        </section>
                       
    </body>
    
       <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
