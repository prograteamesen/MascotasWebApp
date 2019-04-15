package programmer.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import programmer.logic.MascotaLogic;
import programmer.pojos.CategoriaObj;
import programmer.pojos.MascotaObj;
import programmer.pojos.MascotaViewObj;
import programmer.pojos.OngObj;

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
                System.out.println("Insert mascota rows: " + iRows);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("mascotaNewResponse.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 2 - Mascota Form Table">
        if(strFormId.equals("2"))
        {
            
            MascotaLogic CLogic = new MascotaLogic();
            ArrayList<MascotaViewObj> CArray = CLogic.getAllMascotas();
                
            request.getSession().setAttribute("mascotas", CArray);
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
                response.sendRedirect("mascotaDeleteResponse.jsp");
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 4 - update person part 1">        
        if(strFormId.equals("4"))
        {
            /*
            String strId = request.getParameter("id");
            
            Connection con = createConnection();
            String strSql = "SELECT * FROM crsglassdb.person "
                    + "where id="+strId+";";
            PersonQuery CQuery = new PersonQuery(strSql);
            ArrayList<PersonObj> arreglo = executeQueryResult(CQuery, con);
            
            request.getSession().setAttribute("arreglo", arreglo);
            response.sendRedirect("personUpdateData.jsp");
            */
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 5 - update person part 2">        
        if(strFormId.equals("5"))
        {
            /*
            String strId = request.getParameter("id");
            String strFirstName = request.getParameter("firstname");
            String strLastName = request.getParameter("lastname");
            String strAge = request.getParameter("age");
            
            Connection con = createConnection();
            String strSql = "UPDATE crsglassdb.person "
                    + "SET firstname = '"+strFirstName+"',"
                    + "lastname = '"+strLastName+"',"
                    + "age = "+strAge+" "
                    + "WHERE id = "+strId+";";
            int iRows = executeNonQueryInt(strSql,con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("personUpdateResponse.jsp");
            */
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

    // <editor-fold defaultstate="collapsed" desc="Database Methods">
    private Connection createConnection() 
    {
        String strDriver = "com.mysql.cj.jdbc.Driver";
        String strUrl = "jdbc:mysql://localhost:3306/sakila"
                + "?autoReconnect=true"
                + "&useSSL=false"
                + "&useUnicode=true"
                + "&useJDBCCompliantTimezoneShift=true"
                + "&useLegacyDatetimeCode=false"
                + "&serverTimezone=UTC";
        String strUser = "root";
        String strPassword = "1234";
        Connection con = null;
        
        try 
        {
            Class.forName(strDriver);
            con = 
                    DriverManager.getConnection(strUrl, strUser, strPassword);
            
        } 
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(MascotaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
    }

    private int executeNonQueryInt(String p_strSql, Connection p_CConnection) 
    {
        int iRows = 0;
        try 
        {
            if(!p_CConnection.isClosed())
            {
                try (Statement st = p_CConnection.createStatement()) 
                {
                    iRows = st.executeUpdate(p_strSql);
                    p_CConnection.close();
                }
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(MascotaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return iRows;
    }

    private ArrayList executeQueryResult(Query p_CQuery, 
            Connection p_CConnection) 
    {
        ArrayList arreglo = null;
        try 
        {
            if(!p_CConnection.isClosed())
            {
                Statement st = p_CConnection.createStatement();
                ResultSet result = st.executeQuery(p_CQuery.getSql());
                arreglo = p_CQuery.createArrayList(result);
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(MascotaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arreglo;
    }
    // </editor-fold>    
}
