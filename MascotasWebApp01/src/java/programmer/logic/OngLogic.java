
package programmer.logic;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.database.DatabaseX;
import programmer.pojos.OngObj;

public class OngLogic extends Logic
{
     public ArrayList<OngObj> getAllOngs() 
    {
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.ong;";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        ArrayList<OngObj> OArray = null;


        if(CResult != null )
        {
            int iId;
            String strNombre;
            String strContacto;
            String strDescripcion;
            int iNCuenta;
            String strLink;

            OngObj CTemp = null;
            OArray = new ArrayList<>();

            try {

                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    strContacto = CResult.getString("contacto");
                    strDescripcion = CResult.getString("descripcion");
                    iNCuenta = CResult.getInt("ncuenta");
                    strLink = CResult.getString("link");

                    CTemp = new OngObj(iId, strNombre, strContacto, strDescripcion, 
                            iNCuenta, strLink);
                    OArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(OngLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        return OArray;
    }
}
