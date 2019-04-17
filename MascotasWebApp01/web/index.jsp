
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Usuario Nuevo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <%
         HttpSession objSession = request.getSession();
            String strCorreo = (String)objSession.getAttribute("correo");
        if(request.getParameter("cerrar")!=null){
                objSession.invalidate();
            }
    %>
    <body>
        <h1>Nuevo Usuario</h1>
        <br>
        <a href="usuarioNew.jsp">Registrarse</a>
        <br>
        <a href="UsuarioServlet?formid=2">Usuario Form</a>
        <br>
        <a href="login.jsp">Log in</a>
    </body>
</html>
