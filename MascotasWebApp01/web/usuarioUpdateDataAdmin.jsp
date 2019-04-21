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
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión "+strNombre+"</a>");%><br>
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
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
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
        UsuarioObj CUsuario = 
                (UsuarioObj)request.getSession().getAttribute("usuario");
        
    %>
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Actualizar Usuario</strong></h2>
            <br><br>
        </head> 
        <form id="myform" name="myform" action="UsuarioServlet" method="get">
            
            <div  align="center">
            <div class="6u 12u(xsmall)"> 
            
            <input type="number" id="nonId" name="nonId" value="<%= CUsuario.getId() %>" disabled/>
            <br><br>
            
            <input type="text" name="nombre" value = "<%= CUsuario.getNombre() %>" placeholder="Nombre" autocomplete="off"/>
            <br><br>
            
            <input type="text" name="apellido" value = "<%= CUsuario.getApellido() %>" placeholder="Apellido" autocomplete="off" />
            <br><br>
            
            <input type="text" name="fechanacimiento" value = "<%= CUsuario.getFechadeNacimiento() %>" placeholder="Fecha de Nacimiento"/>
            <br><br>
            
            <select class="dropdown" name="genero" placeholder="Género"/>
            <option value = "<%= CUsuario.getGenero() %>" hidden><%= CUsuario.getGenero() %></option>
                   <option value="Femenino">Femenino</option>
                   <option value="Masculino">Masculino</option>  
            </select>
            <br><br>
            
            <input type="text" name="correo" value = "<%= CUsuario.getCorreo() %>" placeholder="Correo" autocomplete="off"/>
            <br><br>
            
            <input type="password" name="contrasena" value = "<%= CUsuario.getContrasena() %>" placeholder="Contraseña" autocomplete="off"/>
            <br><br>
            
            <input type="number" name="telefono" value = "<%= CUsuario.getTelefono() %>" placeholder="Teléfono" autocomplete="off"/>
            <br><br>
            
            <select class="dropdown" name="nivel" placeholder="Nivel"/>
                   <option value = "<%= CUsuario.getNivel() %>" hidden><%= CUsuario.getNivel() %></option>
                   <option value="1">1</option>
                   <option value="2">2</option>  
            </select>
            <br><br>
           </div>
           <div class="12u">    
           <ul class="actions">
            
            <input type="submit" id="mysubmit" name="mysubmit" value="Actualizar"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type ="hidden" id="id" name="id" value="<%= CUsuario.getId() %>" />
           
           </ul>
           </div>
           </div>
        </form>
    </body>
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>



