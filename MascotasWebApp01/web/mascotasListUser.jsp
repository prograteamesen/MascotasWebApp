<%@page import="java.util.Iterator"%>
<%@page import="mascotas.pojos.MascotaViewObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Styles/style.css" rel="stylesheet" type="text/css"/>
        <title>Adopción</title>
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
                    <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
                        <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
                        <nav id="nav" >
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
        %>
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
                <title>Conoce a nuestras mascotas</title>
            </head>
    </head> 
            
     <%  
        ArrayList<MascotaViewObj> Mascota = 
        (ArrayList<MascotaViewObj>)request.getSession().getAttribute("mascotas");
        Iterator<MascotaViewObj> iteArray = Mascota.iterator(); 
     %>
     
    <body class="subpage" >
        
        <head>
                <br><br>
                <h2 align="center"><strong>CONOCE A LAS MASCOTAS</strong></h2>
        </head>
        <br>
        
        <div class="12u" align="center">
            <u1 class="actions" align="center">
                <a href="MascotaServlet?formid=10" class="button">
                    Filtrar busqueda por categoria
                </a>
            </u1>
        </div>
        
        
        
        <br><br>
        <div>
           
             <%
            if(iteArray!=null)
            {
                MascotaViewObj CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
                    strNombre = CTemp.getNombre();
                    int iId = CTemp.getId();
            %>
            
            <div class="gallery">
                <%out.print("<a href='MascotaServlet?formid=13&id="+iId+"'>");%>
                <%out.print("<img src='Styles/Mascotas/"+strNombre+".jpeg' alt='' class='auto'> </a>");%>
     
                <div class="desc"><%=strNombre%></div>
            </div>
                <%
                } 
                }
                %>
            
                   </div>
        
        <img  src="Styles/UsuarioDog.jpg" alt="Cute"/>
               
    </body>
    <footer id="footer2">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
