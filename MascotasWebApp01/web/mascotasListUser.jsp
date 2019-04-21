<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css"/>
        <title>¿Cómo donar?</title>
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
                    <a href="index.jsp" class="logo"><strong>Woof!</strong></a>
                        <nav id="nav" align="right">
                            <%out.print("<a href='perfilUsuario.jsp'>Mi perfil </a>");%>
                            <%out.print("<a href='index.jsp?cerrar=true'> Log out "+strNombre+"</a>");%><br>
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
                    <a href="index.jsp" class="logo"><strong>Woof!</strong></a>
                    </div>
                    
                    <div class="inner" align="right">
                        <nav id="nav" >
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
                <title>¿Cómo donar?</title>
            </head>
    </head> 
            
    <body class="subpage" >
        <%--<head>
            <br><br>
            <h2 align="center"><strong>Adoptar</strong></h2>
            <br>
            <div align="center">
            <img src="Styles/DogYCat.jpg" alt="Dona plis"/>
            </div>
            <h3 align="center">Con una pequeña donación puedes cambiar <br /> el mundo de un animalito y llenar de felicidad la tuya.</h3>
            <br>
        </head>
                --%>
                <h1>Adoptanos</h1>
        <br><br>
        <div class="row">
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Atenea</h2>
                <img src="images/small-dog-breeds.jpg" alt="" width="225" height="150"/>
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Rufus</h2>
                <img src="images/Puedo-besar-perrito_LRZIMA20130220_0115_4.jpg" alt="" width="225" height="150"/>
                
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Garfield</h2>
                <img src="images/0dcaacb02ab1a411af137ad607305922.jpg" alt="" width="225" height="150"/>
            </div>

            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Dogguie</h2>
                <img src="images/original.jpg" alt="" width="225" height="150"/>
            </div>
            
        </div>
        <br><br>
        <div class="row">
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Atenea</h2>
                <img src="images/small-dog-breeds.jpg" alt="" width="225" height="150"/>
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Rufus</h2>
                <img src="images/Puedo-besar-perrito_LRZIMA20130220_0115_4.jpg" alt="" width="225" height="150"/>
                
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Garfield</h2>
                <img src="images/0dcaacb02ab1a411af137ad607305922.jpg" alt="" width="225" height="150"/>
            </div>

            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Dogguie</h2>
                <img src="images/original.jpg" alt="" width="225" height="150"/>
            </div>
            
        </div>
        <br><br>
        <div class="row">
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Atenea</h2>
                <img src="images/small-dog-breeds.jpg" alt="" width="225" height="150"/>
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Rufus</h2>
                <img src="images/Puedo-besar-perrito_LRZIMA20130220_0115_4.jpg" alt="" width="225" height="150"/>
                
            </div>
            
            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Garfield</h2>
                <img src="images/0dcaacb02ab1a411af137ad607305922.jpg" alt="" width="225" height="150"/>
            </div>

            <div class="column" style="background-color:rgb(108,192,145);">
                <h2>Dogguie</h2>
                <img src="images/original.jpg" alt="" width="225" height="150"/>
            </div>
        </div>
        
        <footer style="align-content: center">
                    <a href="#" class="button">Dona ya</a>
                    <br>
                </footer>
            
                       
    </body>
    
       <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
