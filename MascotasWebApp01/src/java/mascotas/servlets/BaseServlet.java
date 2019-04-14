package mascotas.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BaseServlet", urlPatterns = {"/BaseServlet"})
public class BaseServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //aca vamos a trabajar
        String strFormId = request.getParameter("formid");
        
        // <editor-fold defaultstate="collapsed" desc="formid 1 - New Person">
        if(strFormId.equals("1"))
        {
            /* your code 
            String strFormId = request.getParameter("formid");
            
            if(strFormId.equals("1"))
            {
                //get parameters
                String strName = request.getParameter("name");
                String strAge = request.getParameter("age");
                int iAge = Integer.parseInt(strAge);
                
                //access logic
                ClientLogic CLogic = new ClientLogic();
                int iRows = CLogic.insertClientRows(strName, iAge);
                System.out.println("inser client rows: " + iRows);
                
                //send to frontend
                request.getSession().setAttribute("rows", new Integer(iRows) );
                response.sendRedirect("genericMessage.jsp");
            }
            
            if(strFormId.equals("2"))
            {
                //access logic
                ClientLogic CLogic = new ClientLogic();
                ArrayList<ClientObj> CArray = CLogic.getAllClients();
                
                //envair un correo
                
                //send to frontend
                request.getSession().setAttribute("clients", CArray);
                response.sendRedirect("clientForm.jsp");
            }
            
            if(strFormId.equals("3"))
            {
                //get parameters
                String strId = request.getParameter("id");
                int iId = Integer.parseInt(strId);
                
                //access logic
                ClientLogic CLogic = new ClientLogic();
                int iRows = CLogic.deleteClientRows(iId);
                
                //send to frontend
                request.getSession().setAttribute("rows", iRows);
                response.sendRedirect("genericMessage.jsp");
            }
            
            if(strFormId.equals("4"))
            {
                //get parameters
                String strId = request.getParameter("id");
                int iId = Integer.parseInt(strId);
                
                //access logic
                ClientLogic CLogic = new ClientLogic();
                ClientObj CClient = CLogic.getClientById(iId);
                
                //send to frontend
                request.getSession().setAttribute("client", CClient);
                response.sendRedirect("clientUpdateForm.jsp");
            }   
            
            if(strFormId.equals("5"))
            {
                //get parameters
                String strId = request.getParameter("id");
                String strName = request.getParameter("name");
                String strAge = request.getParameter("age");
                int iId = Integer.parseInt(strId);
                int iAge = Integer.parseInt(strAge);
                
                //access logic
                ClientLogic CLogic = new ClientLogic();
                int iRows = CLogic.updateClientRows(iId,strName, iAge);
                System.out.println("update client rows: " + iRows);
                
                //send to frontend
                request.getSession().setAttribute("rows", new Integer(iRows) );
                response.sendRedirect("genericMessage.jsp");
                
            }
            */
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
    }
// </editor-fold>
}