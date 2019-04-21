<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.UsuarioObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Actualizar Usuario</title>
    </head>
    <%
         HttpSession objSession = request.getSession(false);
         String strCorreo = (String)objSession.getAttribute("correo");
         String strNombre;
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
            <div class="inner" align="left">
               <a href="index.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav" align="right">
                    <%out.print("<a href='perfilUsuario.jsp' >Regresar </a>");%>
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strNombre+"</a>");%><br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
            </div>
    </header>
    
    <%
        UsuarioObj CUsuario = 
                (UsuarioObj)request.getSession().getAttribute("usuario");
        
    %>
    <body class="subpage">
        <head>
            <br>
            <h2 align="center"><strong>Actualizar mi perfil</strong></h2>
            <br><br>
        </head> 

        <form id="myform" name="myform" action="UsuarioServlet" method="get">
             <div  align="center" class="row uniform">
             <div class="6u 12u(xsmall)">
                 <input type="hidden" id="nonId" name="nonId" value="<%= CUsuario.getId() %>" />
                
                 <input type="text" name="nombre" value = "<%= CUsuario.getNombre() %>" placeholder="Nombre" autocomplete="off"/>
                <br><br>
                <input type="text" name="apellido" value = "<%= CUsuario.getApellido() %>" placeholder="Apellido" autocomplete="off"/>
                <br><br>
                <input type="text" name="fechanacimiento" value = "<%= CUsuario.getFechadeNacimiento() %>" placeholder="Fecha de Nacimiento" autocomplete="off"/>
                <br><br>
                <select class="dropdown" name="genero" placeholder="Género"/>
                <option value = "<%= CUsuario.getGenero() %>" hidden> <%= CUsuario.getGenero() %> </option>
                       <option value="Femenino">Femenino</option>
                       <option value="Masculino">Masculino</option>  
                </select>
             </div>
                   
           <div class="6u 12u(xsmall)">
               <input type="text" name="correo" value = "<%= CUsuario.getCorreo() %>" placeholder="Correo" autocomplete="off"/>
                <br><br>
                <input type="password" name="contrasena" value = "<%= CUsuario.getContrasena() %>" placeholder="Contraseña" autocomplete="off"/>
                <br><br>
                <input type="number" name="telefono" value = "<%= CUsuario.getTelefono() %>" placeholder="Teléfono" autocomplete="off"/>
                <br><br>
                <input type="hidden" id="nivel" name="nivel" value="<%= CUsuario.getNivel() %>" />
            </select>
            </div>
            
            <div class="12u">
                <ul class="actions">
                    <input type="submit" id="mysubmit" name="mysubmit" value="Actualizar"/>
                    <br><br>
                    <input type="hidden" id="formid" name="formid" value="5"/>
                    <input type ="hidden" id="id" name="id" value="<%= CUsuario.getId() %>" />   
                </ul>
            </div>     

                    <img  src="Styles/UsuarioDog.jpg" alt="Cute"/>
                    
            <div style="text-align:center;margin-top:40px;">
                    <span class="step"></span>
                    <span class="step"></span>
                </div>
            </div>           
        </form>
    </body>
    
     <footer id="footer2">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
