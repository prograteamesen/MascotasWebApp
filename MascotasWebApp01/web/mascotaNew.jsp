
<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.OngObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mascotas.pojos.CategoriaObj"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Nueva mascota</title>
    </head>
     <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String)objSession.getAttribute("correo");
        
        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;
        
        //Verificar si hay una sesion iniciada
        if(objSession.getAttribute("correo")!= null){
            strCorreo = objSession.getAttribute("correo").toString(); 
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %>
    <header id="header">
            <div class="inner" align="right">
                <a href="index.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
                <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
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
%>
    <%
        ArrayList<CategoriaObj> CCategoriaArray = 
                (ArrayList<CategoriaObj>)request.getSession().getAttribute
        ("categorias");
        Iterator<CategoriaObj> iteCategoriaArray = CCategoriaArray.iterator();
        
        ArrayList<OngObj> COngArray = 
                (ArrayList<OngObj>)request.getSession().
                        getAttribute("ongs");
        Iterator<OngObj> iteOngArray = COngArray.iterator();
    %>    
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Registrar Mascota</strong></h2>
            <br><br>
        </head> 
        <form name="mascotaForm" action="MascotaServlet" method="get">
            <div  align="center">
            <div class="6u 12u(xsmall)">    
            
            <input type="text" name="nombre" id="nombre" placeholder="Nombre" autocomplete="off"/>
            <br><br>
            
            <input type="number" name="edad" id="edad" placeholder="Edad" autocomplete="off"/>
            <br><br>
            
            <select name="categoria" id="categoria" placeholder="Categoría">
                <%
                    if(iteCategoriaArray!=null)
                    {
                        CategoriaObj CCategoriaTemp;
                        while(iteCategoriaArray.hasNext())
                        {
                            CCategoriaTemp = iteCategoriaArray.next();
                %>
                <option id="categoria<%=CCategoriaTemp.getId()%>" 
                    name="categoria<%=CCategoriaTemp.getId()%>" 
                    value="<%=CCategoriaTemp.getId()%>">
                    <%=CCategoriaTemp.getCategoria()%>
                </option>
                <%
                        }
                    }
                %>
            </select> 
            <br><br>
            
            <input type="text" name="raza" id="raza" placeholder="Raza" autocomplete="off"/>
            <br><br>
            
            <input type="text" name="tamaño" id="tamaño" placeholder="Tamaño" autocomplete="off"/>
            <br><br>
            
            <input type="text" name="descripcion" id="descripcion" placeholder="Descripción" autocomplete="off"/>
            <br><br>
            
            <select name="ong" id="ong" placeholder="ONG" autocomplete="off">
                <%
                    if(iteOngArray!=null)
                    {
                        OngObj COngTemp;
                        while(iteOngArray.hasNext())
                        {
                            COngTemp = iteOngArray.next();
                %>
                <option id="ong<%=COngTemp.getId()%>" 
                    name="ong<%=COngTemp.getId()%>" 
                    value="<%=COngTemp.getId()%>">
                    <%=COngTemp.getNombre()%>
                </option>
                <%
                        }
                    }
                %>
            </select> 
            <br><br>
            </div>
            <div class="12u">    
            <ul class="actions">
            <input type="submit" name="mysubmit" value="Registrar"/>
            <input type="hidden" name="formid" value="1"/>
            </ul>
            </div>
            </div>
            <br><br>
        </form>   
    </body>
    <footer id="footer">  
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
