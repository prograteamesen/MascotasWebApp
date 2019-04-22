<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.pojos.MascotaObj"%>
<%@page import="mascotas.logic.MascotaLogic"%>
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
 <%
        
        int iId = (int)objSession.getAttribute("id");
        
      
        MascotaLogic Mlogic = new MascotaLogic();
        
        String strNombreM;
        int iEdad;
        String strRaza;
        String strTamano;
        String strDescripcion;
        String strId;      
        
           
            strNombreM =  Mlogic.getMascotaById(iId).getNombre();    
            iEdad =  Mlogic.getMascotaById(iId).getEdad();
            strRaza = Mlogic.getMascotaById(iId).getRaza();
            strTamano = Mlogic.getMascotaById(iId).getTamaño();
            strDescripcion = Mlogic.getMascotaById(iId).getDescripcion();
            iId =  Mlogic.getMascotaById(iId).getId();
            
   %>
<!DOCTYPE html>
    
    <body class="subpage" align="center">
       
        <img src="Styles/DogCat.jpg" alt="Huellita" style="width:1000px;height:250px"/>

        <br>
        <div  align="center" class="row uniform">
             <div class="6u 12u(xsmall)">
                    <table style="width:50%" class="center">
                        <caption>Mis datos son:</caption>
                        <tr>
                          <th>Mi nombre:</th>
                          <td><%out.print(strNombreM);%></td>
                        </tr>
                        <tr>
                          <th>Mi edad:</th>
                          <td><%out.print(iEdad);%></td>
                        </tr>
                        <tr>
                          <th>Mi raza:</th>
                          <td><%out.print(strRaza);%></td>
                        </tr>
                        <tr>
                          <th>Mi tamaño:</th>
                          <td><%out.print(strTamano);%></td>
                        </tr>
                    </table>
            </div>
            
            <div class="12u">
                    <table style="width:50%" class="center">
                        <tr>
                          <th>¿Cuál es mi historia?:</th>
                          <td><%out.print(strDescripcion);%></td>
                        </tr>
                    </table>
            </div>
        </div> 
                        
        <br>             
    </body>
    
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
