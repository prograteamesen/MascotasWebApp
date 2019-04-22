<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.CategoriaObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Modificar Categoria</title>
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
        CategoriaObj CCategoria = 
                (CategoriaObj)request.getSession().getAttribute("categoria");   
    %>    
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Actualizar Categoria</strong></h2>
            <br><br>
        </head> 
        <form id="myform" name="myform" action="CategoriaServlet" method="get">
            
            <div  align="center">
            <div class="6u 12u(xsmall)"> 
            
            <input type="number" id="nonId" name="nonId" value="<%= CCategoria.getId() %>" disabled />
            <br><br>
            
            <input type="text" id="categoria" name="categoria" value="<%= CCategoria.getCategoria() %>" placeholder="Categoria" autocomplete="off"/>
            <br><br>
            
           </div>
           <div class="12u">    
           <ul class="actions">
            <input type="submit" id="mysubmit" name="mysubmit" value="Modificar"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type="hidden" id="id" name="id" value="<%= CCategoria.getId() %>" />
           </ul>
           </div>
           </div>
        </form>
        
        <br><br>
        <a href="categoriaForm.jsp">Regresar</a>
    </body>
    <footer id="footer2">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
    
</html>
