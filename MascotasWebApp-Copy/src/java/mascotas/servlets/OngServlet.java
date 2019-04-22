/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mascotas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mascotas.logic.OngLogic;
import mascotas.pojos.OngObj;

@WebServlet(name = "OngServlet", urlPatterns = {"/OngServlet"})
public class OngServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           /* your code */
            String strFormId = request.getParameter("formid");
            
             if(strFormId.equals("1"))
            {
                //get parameters
                String strNombre = request.getParameter("nombre");
                String strContacto = request.getParameter("contacto");
                String strDescripcion = request.getParameter("descripcion");
                String strNCuenta = request.getParameter("ncuenta");
                String strLink = request.getParameter("link");
                int iNCuenta = Integer.parseInt(strNCuenta);
                              
                //access logic
                OngLogic CLogic = new OngLogic();
                int iRows = CLogic.insertOngRows(strNombre, strContacto, strDescripcion, iNCuenta, strLink);
                System.out.println("insert ong rows: " + iRows);
                
                //send to frontend
                request.getSession().setAttribute("rows", new Integer(iRows) );
                response.sendRedirect("genericMessage.jsp");
            }
             if(strFormId.equals("2"))
            {
                //access logic
                OngLogic CLogic = new OngLogic();
                ArrayList<OngObj> arreglo = CLogic.getAllOngs();
                                
                //send to frontend
                request.getSession().setAttribute("ong", arreglo);
                response.sendRedirect("ongForm.jsp");
            }
            if(strFormId.equals("3"))
            {
                //get parameters
                String strId = request.getParameter("id");
                int iId = Integer.parseInt(strId);
                
                //access logic
                OngLogic CLogic = new OngLogic();
                int iRows = CLogic.deleteOngRows(iId);
                
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
                OngLogic CLogic = new OngLogic();
                OngObj COng = CLogic.getOngById(iId);
                
                //send to frontend
                request.getSession().setAttribute("ong", COng);
                response.sendRedirect("ongUpdateForm.jsp");
            }
            if(strFormId.equals("5"))
            {
                //get parameters
                String strId = request.getParameter("id");
                String strNombre = request.getParameter("nombre");
                String strContacto = request.getParameter("contacto");
                String strDescripcion = request.getParameter("descripcion");
                String strNCuenta = request.getParameter("ncuenta");
                String strLink = request.getParameter("link");
                
                int iId = Integer.parseInt(strId);
                int iNCuenta = Integer.parseInt(strNCuenta);
                
                //access logic
                OngLogic CLogic = new OngLogic();
                int iRows = CLogic.updateOngRows(iId, strNombre, strContacto, strDescripcion, iNCuenta, strLink);
                System.out.println("update client rows: " + iRows);
                
                //send to frontend
                request.getSession().setAttribute("rows", new Integer(iRows) );
                response.sendRedirect("genericMessage.jsp");
                
            }
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
