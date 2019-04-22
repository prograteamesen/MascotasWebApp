package mascotas.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mascotas.logic.CategoriaLogic;
import mascotas.logic.MascotaLogic;
import mascotas.logic.OngLogic;
import mascotas.pojos.CategoriaObj;
import mascotas.pojos.MascotaObj;
import mascotas.pojos.MascotaViewObj;
import mascotas.pojos.OngObj;

@WebServlet(name = "MascotaServlet", urlPatterns = {"/MascotaServlet"})
public class MascotaServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        String strFormId = request.getParameter("formid");
        
        // <editor-fold defaultstate="collapsed" desc="formid 1 - New Mascota">
        if(strFormId.equals("1"))
        {
            
            String strNombre = request.getParameter("nombre");
            String strEdad = request.getParameter("edad");
            String strIdCategoria = request.getParameter("categoria");
            String strRaza = request.getParameter("raza");
            String strTamaño = request.getParameter("tamaño");
            String strDescripcion = request.getParameter("descripcion");
            String strIdOng = request.getParameter("ong");

            int iEdad = Integer.parseInt(strEdad);
            int iIdCategoria = Integer.parseInt(strIdCategoria);
            int iIdOng = Integer.parseInt(strIdOng);
            
             MascotaLogic CLogic = new MascotaLogic();
             int iRows = CLogic.insertMascotaRows(strNombre, iEdad, iIdCategoria,
                     strRaza, strTamaño, strDescripcion, iIdOng);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("genericMessage.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 2 - Mascota Form Table">
        if(strFormId.equals("2"))
        {
            
            MascotaLogic CLogic = new MascotaLogic();
            ArrayList<MascotaViewObj> MArray = CLogic.getAllMascotas();
                
            request.getSession().setAttribute("mascotas", MArray);
            response.sendRedirect("mascotaForm.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 3 - Delete mascota">
        if(strFormId.equals("3"))
        {
            String strId = request.getParameter("id");
            int iId = Integer.parseInt(strId);
                
                MascotaLogic CLogic = new MascotaLogic();
                int iRows = CLogic.deleteMascotaRows(iId);
                
                request.getSession().setAttribute("rows", iRows);
                response.sendRedirect("genericMessage.jsp");
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 4 - update mascota part 1">        
        if(strFormId.equals("4"))
        {
            String strId = request.getParameter("id");
            int iId = Integer.parseInt(strId);

            MascotaLogic MLogic = new MascotaLogic();
            MascotaViewObj CMascota = MLogic.getMascotaViewById(iId);
            
            MascotaLogic M2Logic = new MascotaLogic();
            MascotaObj C2Mascota = M2Logic.getMascotaById(iId);

            request.getSession().setAttribute("mascota", CMascota);
            request.getSession().setAttribute("mascota2", C2Mascota);
            response.sendRedirect("mascotaUpdateForm.jsp");
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 5 - update mascota part 2">        
        if(strFormId.equals("5"))
        {
            String strId = request.getParameter("id");
            String strNombre = request.getParameter("nombre");
            String strEdad = request.getParameter("edad");
            String strIdCategoria = request.getParameter("categoria");
            String strRaza = request.getParameter("raza");
            String strTamaño = request.getParameter("tamaño");
            String strDescripcion = request.getParameter("descripcion");
            String strIdOng = request.getParameter("ong");

            int iId = Integer.parseInt(strId);
            int iEdad = Integer.parseInt(strEdad);
            int iIdCategoria = Integer.parseInt(strIdCategoria);
            int iIdOng = Integer.parseInt(strIdOng);
            
            MascotaLogic MLogic = new MascotaLogic();
            int iRows = MLogic.updateMascotaRows(iId, strNombre, 
                    iEdad, iIdCategoria, strRaza, strTamaño, 
                    strDescripcion, iIdOng);
            
            request.getSession().setAttribute("rows", new Integer(iRows) );
            response.sendRedirect("genericMessage.jsp");
        }
        // </editor-fold>       
        
        // <editor-fold defaultstate="collapsed" desc="formid 6 - Mascota New Form Dropdowns">
        if(strFormId.equals("6"))
        {
            CategoriaLogic CCategoriaLogic = new CategoriaLogic();
            ArrayList<CategoriaObj> CCategoriaArray = 
                    CCategoriaLogic.getAllCategoria();
            
            OngLogic COngLogic = new OngLogic();
            ArrayList<OngObj> COngArray = COngLogic.getAllOngs();
                
            request.getSession().setAttribute("categorias", CCategoriaArray);
            request.getSession().setAttribute("ongs", COngArray);
            response.sendRedirect("mascotaNew.jsp");  
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 7 - Mascota Form Table">
        if(strFormId.equals("7"))
        {
            
            MascotaLogic CLogic = new MascotaLogic();
            ArrayList<MascotaViewObj> MArray = CLogic.getAllMascotas();
                
            request.getSession().setAttribute("mascotas", MArray);
            response.sendRedirect("mascotaFormUser1.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 8 - Mascota a Adopcion">
        if(strFormId.equals("8"))
        {
            String strId = request.getParameter("id");
            int iId = Integer.parseInt(strId);
            
            MascotaLogic M2Logic = new MascotaLogic();
            MascotaViewObj Mascota = M2Logic.getMascotaViewById(iId);
            
            request.getSession().setAttribute("idPet", strId);
            request.getSession().setAttribute("SMascota", Mascota);
            response.sendRedirect("AdopcionNew.jsp");

        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 9 - Mascota Form Table">
        if(strFormId.equals("9"))
        {
            
            MascotaLogic CLogic = new MascotaLogic();
            ArrayList<MascotaViewObj> MArray = CLogic.getAllMascotas();
                
            request.getSession().setAttribute("mascotas", MArray);
            response.sendRedirect("mascotaForm.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 10 - Mascota Filtrar Categoria">
        if(strFormId.equals("10"))
        {
            CategoriaLogic CCategoriaLogic = new CategoriaLogic();
            ArrayList<CategoriaObj> CCategoriaArray = 
                    CCategoriaLogic.getAllCategoria();
                
            request.getSession().setAttribute("categorias", CCategoriaArray);
            response.sendRedirect("mascotaFilterForm.jsp");  
        }
// </editor-fold>

        // <editor-fold defaultstate="collapsed" desc="formid 11 - Filtrar categoria">
        if(strFormId.equals("11"))
        {
            String strCategoria = request.getParameter("categoria");
                
                MascotaLogic CLogic = new MascotaLogic();
                ArrayList<MascotaViewObj> MArray = CLogic.getMascotasFilter(strCategoria);
                
                request.getSession().setAttribute("mascotas", MArray);
                response.sendRedirect("mascotaFilter.jsp");
        }
// </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 12 - Mascota Form Table">
        if(strFormId.equals("12"))
        {
            
            MascotaLogic CLogic = new MascotaLogic();
            ArrayList<MascotaViewObj> MArray = CLogic.getAllMascotas();
                
            request.getSession().setAttribute("mascotas", MArray);
            response.sendRedirect("mascotasListUser.jsp");
            
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
