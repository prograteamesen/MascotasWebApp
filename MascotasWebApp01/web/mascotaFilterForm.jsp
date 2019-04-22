<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="java.util.Iterator"%>
<%@page import="mascotas.pojos.CategoriaObj"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="Filters/jquery.js" type="text/javascript"></script>
        <script src="Filters/jquery-ui.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="Styles/main2.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function () {
                $("input").checkboxradio();
                $("fieldset").controlgroup();
            });
        </script>
        <title>Filtrar busqueda</title>
    </head>
    <%
        HttpSession objSession = request.getSession(false);
        String strCorreo = (String) objSession.getAttribute("correo");

        UsuarioLogic Ulogic = new UsuarioLogic();
        String strNombre;

        if (objSession.getAttribute("correo") != null) {
            strCorreo = objSession.getAttribute("correo").toString();
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();
    %> 
    <header id="header">
        <div class="inner">
            <a href="indexAdmin.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
            <nav id="nav">
                <%out.print("<a href='index.jsp?cerrar=true'>Cerrar sesión " + strNombre + "</a>");%>
                <a href="index.jsp">Inicio</a>
            </nav>
            <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
        </div>
    </header>
    <%
    } else {
    %>      
    <header id="header">
        <div class="inner" align="right">
            <a href="index.jsp" class="logo"><img src="Styles/Logo.png" style="width:100px;height:40px"/></a>
            <nav id="nav">
                <a href="login.jsp" class="button2">Iniciar sesión </a>
            </nav>
            <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
        </div>
    </header>    
    <body class="subpage">
        <%
            }
            ArrayList<CategoriaObj> CCategoriaArray
                    = (ArrayList<CategoriaObj>) request.getSession().getAttribute("categorias");
            Iterator<CategoriaObj> iteCategoriaArray = CCategoriaArray.iterator();
        %>
        <br><br>
        <h2 align="center"><strong>Filtrar busqueda por categoria</strong></h2>
        <br>
        <form name="mascotaFilterForm" id="mascotaFilterForm" action="MascotaServlet" method="get">
            <fieldset>
                <center>
                <h2>Categoria</h2>
                </center>

                <br>
                <%
                    if (iteCategoriaArray != null) {
                        CategoriaObj CCategoriaTemp;
                        while (iteCategoriaArray.hasNext()) {
                            CCategoriaTemp = iteCategoriaArray.next();
                %>
                <center>
                <div class="4u 12u(small)" style="align-center">
                    <input type="radio" name="categoria" id="categoria" 
                           value="<%=CCategoriaTemp.getCategoria()%>">
                    <label for="categoria"><%=CCategoriaTemp.getCategoria()%></label>
                </div>
                </center>
                <%
                        }
                    }
                %>
            </fieldset>
            <br><br>
            <input type="submit" name="mysubmit" value="Filtrar"/>

            <input type="hidden" name="formid" value="11"/>
        </form>
    </body>
    <footer id="footer">
        <div class="copyright">
            <a href="index.jsp" class="i2"><i class="fas fa-home fa-2x"></i></a> <br>
            &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
        </div>
    </footer>
</html>
