
package mascotas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mascotas.logic.AdopcionLogic;
import mascotas.pojos.AdopUserPetObj;
import mascotas.pojos.adopcionObj;

@WebServlet(name = "AdopcionServlet", urlPatterns = {"/AdopcionServlet"})
public class AdopcionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String strFormId = request.getParameter("formid");
            
            // <editor-fold defaultstate="collapsed" desc="Formid = 1 : Nueva Adopcion">
            if(strFormId.equals("1"))
            {
                //get parameters
                String strPet = request.getParameter("mascota");
                String strDueno = request.getParameter("dueno");
                int iDueno = Integer.parseInt(strDueno);
                int iPet = Integer.parseInt(strPet);
                
                //access logic
                AdopcionLogic CLogic = new AdopcionLogic();
                int iRows = CLogic.insertAdopcionRows(iDueno, iPet);
                System.out.println("insert adopcion rows: " + iRows);
                
                ////send to frontend
                request.getSession().setAttribute("rows", iRows );
                response.sendRedirect("genericMessage.jsp");
            }
            // </editor-fold>]
            
            // <editor-fold defaultstate="collapsed" desc="Formid = 1 : Registros de Adopcion">
            if(strFormId.equals("2"))
            {
                //access logic
                AdopcionLogic CLogic = new AdopcionLogic();
                ArrayList<AdopUserPetObj> CArray = CLogic.getAllAdoptionsI();
                                
                //send to frontend
                request.getSession().setAttribute("adopciones", CArray);
                response.sendRedirect("adopcionForm.jsp");
            }
            // </editor-fold>]
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
