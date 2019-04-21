<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.pojos.UsuarioObj"%>
<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
         <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        int iLevel = Ulogic.Level(strCorreo);
        String strNombre;
        String strApellido;
        String strFechadeNacimiento;
        String strGenero;
        String strContrasena;
        int iTelefono;
        String strTelefono;
        int iId;
        
        
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
            strApellido = Ulogic.getUsuarioByCorreo(strCorreo).getApellido();
            strFechadeNacimiento = Ulogic.getUsuarioByCorreo(strCorreo).getFechadeNacimiento();
            strGenero = Ulogic.getUsuarioByCorreo(strCorreo).getGenero();
            strContrasena = Ulogic.getUsuarioByCorreo(strCorreo).getContrasena();
            iTelefono =  Ulogic.getUsuarioByCorreo(strCorreo).getTelefono();
            iId =  Ulogic.getUsuarioByCorreo(strCorreo).getId();
            
             
    %>
    <header id="header">
            <div class="inner" align="right">
                <nav id="nav">
                    <%out.print("<a href='index.jsp' >Inicio </a>");%>
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strNombre+"</a>");%><br>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>    
            </div>
    </header>
    
    <body class="subpage" align="center">
       
        <img src="Styles/DogCat.jpg" alt="Huellita" style="width:1000px;height:250px"/>
        <%out.print("<h1>¡Bienvenido/a, "  + strNombre + " " + strApellido +"!</a>");%><br>
        <br>
        <table style="width:50%" class="center">
            <caption>Mis datos:</caption>
            <tr>
              <th>Nombre:</th>
              <td><%out.print(strNombre);%></td>
            </tr>
            <tr>
              <th>Apellido:</th>
              <td><%out.print(strApellido);%></td>
            </tr>
            <tr>
              <th>Fecha de Nacimiento:</th>
              <td><%out.print(strFechadeNacimiento);%></td>
            </tr>
            <tr>
              <th>Género:</th>
              <td><%out.print(strGenero);%></td>
            </tr>
            <tr>
              <th>Telefono:</th>
              <td><%out.print(iTelefono);%></td>
            </tr>
        </table>
            <br>
            
            <nav id="nav" class="button">
                <%out.print("<a href='UsuarioServlet?formid=7&id="+iId+"'>Actualizar Información</a>");%>
                <br>
            </nav>
            <br><br>
              
    </body>
    
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>

