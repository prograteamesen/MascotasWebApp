<%@page import="mascotas.pojos.UsuarioObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Usuario</title>
    </head>
    <%
        UsuarioObj CUsuario = 
                (UsuarioObj)request.getSession().getAttribute("usuario");
        
    %>
    <body>
        <h1>Actualizar Usuario</h1>
        <br><br>
        <form id="myform" name="myform" action="UsuarioServlet" method="get">
            Id: <br>
             <input type="number" id="nonId" name="nonId" value="<%= CUsuario.getId() %>" disabled/>
            <br><br>
            Nombre: <br>
            <input type="text" name="nombre" value = "<%= CUsuario.getNombre() %>"/>
            <br><br>
            Apellido: <br>
            <input type="text" name="apellido" value = "<%= CUsuario.getApellido() %>" />
            <br><br>
            Fecha de Nacimiento: <br>
            <input type="text" name="fechanacimiento" value = "<%= CUsuario.getFechadeNacimiento() %>"/>
            <br><br>
            Género: <br>
            <select class="dropdown" name="genero" />
                   <option value = "<%= CUsuario.getGenero() %>"> <%= CUsuario.getGenero() %> </option>
                   <option value="Femenino">Femenino</option>
                   <option value="Masculino">Masculino</option>  
            </select>
            <br><br>
            Correo: <br>
            <input type="text" name="correo" value = "<%= CUsuario.getCorreo() %>"/>
            <br><br>
            Contraseña: <br>
            <input type="text" name="contrasena" value = "<%= CUsuario.getContrasena() %>"/>
            <br><br>
            Teléfono: <br>
            <input type="number" name="telefono" value = "<%= CUsuario.getTelefono() %>"/>
            <br><br>
            Nivel: <br>
            <select class="dropdown" name="nivel" />
                   <option value = "<%= CUsuario.getNivel() %>"> <%= CUsuario.getNivel() %> </option>
                   <option value="1">1</option>
                   <option value="2">2</option>  
            </select>
            <br><br>
            
            
               <input type="submit" id="mysubmit" name="mysubmit" value="Update"/>
            <input type="hidden" id="formid" name="formid" value="5" />
            <input type ="hidden" id="id" name="id" value="<%= CUsuario.getId() %>" />
              
        </form>
    </body>
</html>
