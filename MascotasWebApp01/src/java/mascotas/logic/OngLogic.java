
package mascotas.logic;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mascotas.database.DatabaseX;
import mascotas.pojos.OngObj;

public class OngLogic extends Logic {
    
     public boolean insertOngtBool(String p_strNombre, String p_strContacto, String p_strDescripcion, int p_iNCuenta, String p_strLink)
    {
         //INSERT INTO 
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.ong" +
                        "(id,nombre,contacto,descripcion,ncuenta,link) " +
                        "VALUES" +
                        "(0,'"+p_strNombre+"','"+p_strContacto+"','"+p_strDescripcion+"',"+p_iNCuenta+",'"+p_strLink+"');";
        System.out.println(strSql);
        boolean bsuccess = database.executeNonQueryBool(strSql);
        return bsuccess;
    }
     public int insertOngRows(String p_strNombre, String p_strContacto, String p_strDescripcion, int p_iNCuenta, String p_strLink)
    {
        //INSERT INTO travelsys.client(id,name,age) VALUES(0,'pepito',24);
        DatabaseX database = getDatabase();
        String strSql ="INSERT INTO mascotasdb.ong" +
                       "(id,nombre,contacto,descripcion,ncuenta,link) " +
                       "VALUES" +
                       "(0,'"+p_strNombre+"','"+p_strContacto+"','"+p_strDescripcion+"',"+p_iNCuenta+",'"+p_strLink+"');" ;
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
      public ArrayList<OngObj> getAllOngs() 
    {
        //select * from travelsys.client;
        DatabaseX database = getDatabase();
        String strSql = "select * from mascotasdb.ong ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        ArrayList<OngObj> arreglo = null;
        
        
        if(CResult != null )
        {
            int iId;
            String strNombre;
            String strContacto;
            String strDescripcion;
            int iNCuenta;
            String strLink;
            
            OngObj CTemp = null;
            arreglo = new ArrayList<>();
            
            try {
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    strContacto = CResult.getString("contacto");
                    strDescripcion = CResult.getString("descripcion");
                    iNCuenta = CResult.getInt("ncuenta");
                    strLink = CResult.getString("link");
                    
                    CTemp = new OngObj(iId, strNombre, strContacto, strDescripcion, iNCuenta, strLink);
                    arreglo.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(OngLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        return arreglo;
    }
       public int deleteOngRows(int p_iId) 
    {
        //delete 
        DatabaseX database = getDatabase();
        String strSql = "DELETE FROM mascotasdb.ong WHERE id="+p_iId+";";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
       public OngObj getOngById(int p_iId) 
    {
        //select * from travelsys.client;
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.ong WHERE id="+p_iId+" ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        OngObj CTemp = null;
        
       if(CResult != null )
        {
            int iId;
            String strNombre;
            String strContacto;
            String strDescripcion;
            int iNCuenta;
            String strLink;
                        
            try {
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    strContacto = CResult.getString("contacto");
                    strDescripcion = CResult.getString("descripcion");
                    iNCuenta = CResult.getInt("ncuenta");
                    strLink = CResult.getString("link");
                    
                    CTemp = new OngObj(iId, strNombre, strContacto, strDescripcion, iNCuenta, strLink);
                    
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(OngLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CTemp;
    }
       
    public int updateOngRows(int p_iId, String p_strNombre, String p_strContacto, String p_strDescripcion, int p_iNCuenta, String p_strLink) 
    {
        //update travelsys.client set name = 'fabricio',age = 25 where id = 9;
        DatabaseX database = getDatabase();
        String strSql = "UPDATE mascotasdb.ong " +
                        "SET " +
                        "nombre = '"+p_strNombre+"'," +
                        "contacto = '"+p_strContacto+"'," +
                        "descripcion = '"+p_strDescripcion+"'," +
                        "ncuenta = "+p_iNCuenta+"," +
                        "link = '"+p_strLink+"' " +
                        "WHERE id = "+p_iId+";";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
}
