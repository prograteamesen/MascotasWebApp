package programmer.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import programmer.logic.UsuarioLogic;
import programmer.pojos.UsuarioObj;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
      
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
        
        String strFormId = request.getParameter("formid");
        
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
       
        if(strFormId.equals("2"))
        {
            
                UsuarioLogic ULogic = new UsuarioLogic();
                ArrayList<UsuarioObj> CArray = ULogic.getAllUsuarios();      
               
                request.getSession().setAttribute("usuarios", CArray);
                response.sendRedirect("usuarioForm.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 3 - delete person">
        if(strFormId.equals("3"))
        {
            
            String strId = request.getParameter("id");
                int iId = Integer.parseInt(strId);
                
                //access logic
                UsuarioLogic ULogic = new UsuarioLogic();
                int iRows = ULogic.deleteUsuarioRows(iId);
                
                //send to frontend
                request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("usuarioDeleteResponse.jsp");
            
        }
        // </editor-fold>
           
        if(strFormId.equals("4"))
        {
            
                String strId = request.getParameter("id");
                int iId = Integer.parseInt(strId);
   
                UsuarioLogic ULogic = new UsuarioLogic();
                UsuarioObj CUsuario = ULogic.getUsuarioById(iId);
   
            request.getSession().setAttribute("usuario", CUsuario);
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
            int iId = Integer.parseInt(strId);
            int iTelefono = Integer.parseInt(strTelefono);
            int iNivel = Integer.parseInt(strNivel);
            
            UsuarioLogic ULogic = new UsuarioLogic();
                int iRows = ULogic.updateUsuarioRows(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo, strContraseña, iTelefono, iNivel);
                
                
                request.getSession().setAttribute("rows", new Integer(iRows) );
                response.sendRedirect("usuarioUpdateResponse.jsp");
            
        }
        // </editor-fold>        
    }
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
