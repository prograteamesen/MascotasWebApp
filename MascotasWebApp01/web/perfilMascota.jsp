<%@page import="mascotas.pojos.MascotaViewObj"%>
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
                    <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
                    <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
        
//Obtener el nombre y Id de la mascota seleccionada.
        MascotaViewObj CMascota = 
        (MascotaViewObj)request.getSession().getAttribute("SMascota");
            
        String strId = (String)request.getSession().getAttribute("idPet");
        int iId = Integer.parseInt(strId);
            
        String strNombreM;
        int iEdad;
        String strRaza;
        String strTamano;
        String strDescripcion;

            strNombreM =  CMascota.getNombre();    
            iEdad =  CMascota.getEdad();
            strRaza = CMascota.getRaza();
            strTamano = CMascota.getTamaño();
            strDescripcion = CMascota.getDescripcion();
            
   %>
<!DOCTYPE html>
    
    <body class="subpage" align="center">
       
        <img src="Styles/DogCat.jpg" alt="Huellita" style="width:1000px;height:250px"/>

        <br>
        <div  align="center">
             <div class="6u 12u(xsmall)">
                    <table style="width:50%" align="center" class="center">
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
                        
                         <%
                    if(objSession.getAttribute("correo")!= null){
                %>   
                    
                    <nav id="nav">
                        <a href='MascotaServlet?formid=8&id=<%out.print(iId);%>'" class="button">Listo para adoptar </a>
                    </nav>
                <%
                    }
                    else{
                %> 
                <nav id="nav">
                        <a href="notLogedInResponse.jsp" class="button">Listo para adoptar </a>
                    </nav>   
              
                <%
                    }
                %> 
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
