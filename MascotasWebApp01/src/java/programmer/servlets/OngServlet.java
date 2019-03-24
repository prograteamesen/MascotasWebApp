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
import programmer.objects.OngQuery;
import programmer.objects.Query;
import programmer.pojos.OngObj;

@WebServlet(name = "OngServlet", urlPatterns = {"/OngServlet"})
public class OngServlet extends HttpServlet 
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
            String strContacto = request.getParameter("contacto");
            String strDescripcion = request.getParameter("descripcion");
            String strNCuenta = request.getParameter("ncuenta");
            String strLink = request.getParameter("link");
            
            Connection con = createConnection();
            String strSql = "INSERT INTO mascotasdb.ong " +
                            "(id,nombre,contacto,descripcion,ncuenta,link) " +
                            "VALUES " +
                            "(0,'"+strNombre+"','"+strContacto+"','"+strDescripcion+"',"+strNCuenta+",'"+strLink+"');";
            int iRows = executeNonQueryInt(strSql,con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("ongNewResponse.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 2 - Person Form Table">
        if(strFormId.equals("2"))
        {
            
            Connection con = createConnection();
            String strSql = "SELECT * FROM mascotasdb.ong;";
            OngQuery CQuery = new OngQuery(strSql);
            ArrayList<OngObj> arreglo = executeQueryResult(CQuery, con);
            
            request.getSession().setAttribute("arreglo", arreglo);
            response.sendRedirect("ongForm.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 3 - delete person">
        if(strFormId.equals("3"))
        {
            
            //DELETE FROM crsglassdb.person WHERE id=1;
            String strId = request.getParameter("id");
            
            String strSql = "DELETE FROM mascotasdb.ong WHERE id="+strId+";";
            Connection con = createConnection();
            int iRows = executeNonQueryInt(strSql, con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("ongDeleteResponse.jsp");
            
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 4 - update person part 1">        
        if(strFormId.equals("4"))
        {
            
            String strId = request.getParameter("id");
            
            Connection con = createConnection();
            String strSql = "SELECT * FROM mascotasdb.ong "
                    + "where id="+strId+";";
            OngQuery CQuery = new OngQuery(strSql);
            ArrayList<OngObj> arreglo = executeQueryResult(CQuery, con);
            
            request.getSession().setAttribute("arreglo", arreglo);
            response.sendRedirect("ongUpdateData.jsp");
           
        }
        // </editor-fold>
        
        // <editor-fold defaultstate="collapsed" desc="formid 5 - update person part 2">        
        if(strFormId.equals("5"))
        {
            
            String strId = request.getParameter("id");
            String strNombre = request.getParameter("nombre");
            String strContacto = request.getParameter("contacto");
            String strDescripcion = request.getParameter("descripcion");
            String strNCuenta = request.getParameter("ncuenta");
            String strLink = request.getParameter("link");
            
            Connection con = createConnection();
            String strSql = "UPDATE mascotasdb.ong\n" +
                            "SET\n" +
                            "id = "+strId+",\n" +
                            "nombre = '"+strNombre+"',\n" +
                            "contacto = '"+strContacto+"',\n" +
                            "descripcion = '"+strDescripcion+"',\n" +
                            "ncuenta = "+strNCuenta+",\n" +
                            "link = '"+strLink+"'\n" +
                            "WHERE id = "+strId+";";
            int iRows = executeNonQueryInt(strSql,con);
            
            request.getSession().setAttribute("rows", iRows);
            response.sendRedirect("ongUpdateResponse.jsp");
            
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
            Logger.getLogger(OngServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OngServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OngServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arreglo;
    }
    // </editor-fold>    
}
