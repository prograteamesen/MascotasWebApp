<%@page import="mascotas.pojos.MascotaViewObj"%>
<%@page import="mascotas.logic.UsuarioLogic"%>
<%@page import="mascotas.pojos.MascotaObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <title>Adopcion</title>
    </head>
        <%
            
            
            //Obtener el nombre y Id de la mascota seleccionada.
            MascotaViewObj CMascota = 
            (MascotaViewObj)request.getSession().getAttribute("SMascota");
            
            String strId = (String)request.getSession().getAttribute("idPet");
            int iId = Integer.parseInt(strId);
            
            HttpSession objSession = request.getSession(false);
            String strCorreo = (String)objSession.getAttribute("correo");
        
        
            UsuarioLogic Ulogic = new UsuarioLogic();
            String strNombre;
            
            //Selecciona el nombre de la sesion iniciada
            strCorreo = objSession.getAttribute("correo").toString();
            strNombre = Ulogic.getUsuarioByCorreo(strCorreo).getNombre();

        %>
        <header id="header">
            <div class="inner">
                <a href="indexAdmin.jsp" class="logo"><strong>Woof!</strong></a>
                <nav id="nav">
                    <%out.print("<a href='index.jsp?cerrar=true'>Log out "+strNombre+"</a>");%>
                    <a href="index.jsp">Home</a>
                </nav>
                <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
            </div>
        </header>
        
    <body class="subpage">
        <head>
            <br><br>
            <h2 align="center"><strong>Nueva Adopcion</strong></h2>
            <br><br>
        </head>

        
        <form id="form" name="form">
            <div class="12u" align="center">
                <div class="6u 12u(xsmall)">
                    <h3>Hola, </h3>
                    <input type="text" id="dueno" name="dueno"  value="<%=strNombre%>"/>
                    <br>
                    <h3>estás a punto de adoptar a:</h3>
                    <input type="text" id="mascota" name="mascota" value="<%=CMascota.getNombre()%>"/>
                    <br><br>
                </div>
            </div>
            <h3> ¿Estás de acuerdo? </h3>
        </form>
        
        <form id="myform" name="myform" action="AdopcionServlet" method="get">
            <input type="number" id="mascota" name="mascota" value="<%=iId%>" style="display:none"/>
            <input type="number" id="dueno" name="dueno" value="<%=Ulogic.getUsuarioByCorreo(strCorreo).getId()%>" style="display:none"/>
            <input type="submit" id="mysubmit" name="mysubmit" value="¡Adoptar!"/>
            <div class="12u" align="center"> 
               <div class="6u 12u(xsmall)">
                    <input type="hidden" id="formid" name="formid" value="1"/>
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
