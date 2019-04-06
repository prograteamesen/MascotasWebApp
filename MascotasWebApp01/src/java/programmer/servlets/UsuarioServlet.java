package programmer.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import programmer.logic.UsuarioLogic;
import programmer.objects.UsuarioQuery;
import programmer.pojos.UsuarioObj;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //aca vamos a trabajar
        String strFormId = request.getParameter("formid");
        
        // <editor-fold defaultstate="collapsed" desc="formid 1 - New Person">
        if(strFormId.equals("1"))
        {
            
            String strNombre = request.getParameter("nombre");
            String strApellido = request.getParameter("apellido");
            String strFechadeNacimiento = request.getParameter("fechanacimiento");
            String strGenero = request.getParameter("genero");
            String strCorreo = request.getParameter("correo");
            String strContraseña = request.getParameter("contraseña");
            String strTelefono = request.getParameter("telefono");
            
            UsuarioLogic ULogic = new UsuarioLogic();
            int iRows = ULogic.insertUsuario(strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo, strContraseña, strTelefono);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("usuarioNewResponse.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 2 - Person Form Table">
        if(strFormId.equals("2"))
        {
            
            Connection con = createConnection();
            String strSql = "SELECT * FROM mascotasdb.usuario;";
            UsuarioQuery CQuery = new UsuarioQuery(strSql);
            ArrayList<UsuarioObj> arreglo = executeQueryResult(CQuery, con);
            
            request.getSession().setAttribute("arreglo", arreglo);
            response.sendRedirect("usuarioForm.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 3 - delete person">
        if(strFormId.equals("3"))
        {
            
            //DELETE FROM crsglassdb.person WHERE id=1;
            String strId = request.getParameter("id");
            
            String strSql = "DELETE FROM mascotasdb.usuario WHERE id="+strId+";";
            Connection con = createConnection();
            int iRows = executeNonQueryInt(strSql, con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("usuarioDeleteResponse.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 4 - update person part 1">        
        if(strFormId.equals("4"))
        {
            
            String strId = request.getParameter("id");
            
            Connection con = createConnection();
            String strSql = "SELECT * FROM mascotasdb.usuario "
                    + "where id="+strId+";";
            UsuarioQuery CQuery = new UsuarioQuery(strSql);
            ArrayList<UsuarioObj> arreglo = executeQueryResult(CQuery, con);
            
            request.getSession().setAttribute("arreglo", arreglo);
            response.sendRedirect("usuarioUpdateData.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 5 - update person part 2">        
        if(strFormId.equals("5"))
        {
            
            String strId = request.getParameter("id");
            String strNombre = request.getParameter("nombre");
            String strApellido = request.getParameter("apellido");
            String strFechadeNacimiento = request.getParameter("fechanacimiento");
            String strGenero = request.getParameter("genero");
            String strCorreo = request.getParameter("correo");
            String strContraseña = request.getParameter("contraseña");
            String strTelefono = request.getParameter("telefono");
            String strNivel = request.getParameter("nivel");
            
            Connection con = createConnection();
            String strSql = "UPDATE mascotasdb.usuario "
                    + "SET nombre = '"+strNombre+"',"
                    + "apellido = '"+strApellido+"',"
                    + "fechanacimiento = '"+strFechadeNacimiento+"',"
                    + "genero = '"+strGenero+"',"
                    + "correo = '"+strCorreo+"',"
                    + "contraseña = '"+strContraseña+"',"
                    + "telefono = '"+strTelefono+"',"
                    + "nivel = "+strNivel+" "
                    + "WHERE id = "+strId+";";
            int iRows = executeNonQueryInt(strSql,con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("usuarioUpdateResponse.jsp");
            
        }
        // </editor-fold>        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   
}
