<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="Scripts/loginvalidate.js" type="text/javascript"></script>
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="Scripts/loginvalidate.js" type="text/javascript"></script>
        <title>Log in</title>
    </head>
    <body class="subpage">     
        <%
            HttpSession objSession = request.getSession();
            String strCorreo = (String)objSession.getAttribute("correo");

            if(request.getParameter("cerrar")!=null){
                objSession.invalidate();
                response.sendRedirect("login.jsp");
            }
                
            if(objSession.getAttribute("correo")!= null){
                strCorreo = objSession.getAttribute("correo").toString();
                out.print("<h1>Log in "+strCorreo+"</h1>"); 
        %>
            <form>
                <fieldset>
                    <legend><%out.println(strCorreo);%></legend>
                    <h2>Logged in</h2>
                 <h2><%out.print("<a href='index.jsp?cerrar=true' ><h5>Log out "+strCorreo+"</h5></a>");%></h2>
                </fieldset>
            </form>
        <%
            }else{

        %>
        <header id="header">
            <div class="inner">
                <a href="index.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <a href="index.jsp">Home</a>
                    <a href="usuarioNew.jsp">Register</a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>
      
        <head>
            <br><br>
            <h2 align="center"><strong>Log in</strong></h2>
            <br><br>
        </head>    
       
            <form id="myform" name="myform" action="UsuarioServlet" method="post" >
            
                <div  align="center">
                    <div class="6u 12u$(xsmall)">
                        <input type="text" id="correo" name="correo" autocomplete="off" placeholder="Correo"/>
                        <br><br>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña"/>
                        <br><br>
                    </div>
                    
                <div class="12u$">
                    <ul class="actions">
                        <input type="submit" id="mysubmit" name="mysubmit" value="Log in" class="button"/>
                        <br><br>
                        <input type="hidden" name="formid" value="6"/>
                    </ul>
                </div>
                
                </div>
            </form>
           
        <%  } %>
    </body>

    <footer id="footer2">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
    
</html>
