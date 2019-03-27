package programmer.objects;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.OngObj;


public class OngQuery extends Query<OngObj>
{

    public OngQuery(String p_strSql) 
    {
        super(p_strSql);
    }

    @Override
    public ArrayList<OngObj> createArrayList(ResultSet p_CResult) 
    {
        ArrayList<OngObj> arreglo = null;
        if(p_CResult!=null)
        {
            arreglo = new ArrayList<>();
            
            int iId;
            String strNombre;
            String strContacto;
            String strDescripcion;
            String strNCuenta;
            String strLink;
            
            OngObj CTemp;
            
            try 
            {
                while(p_CResult.next())
                {
                    iId = p_CResult.getInt("id");
                    strNombre = p_CResult.getString("nombre");
                    strContacto = p_CResult.getString("contacto");
                    strDescripcion = p_CResult.getString("descripcion");
                    strNCuenta = p_CResult.getString("ncuenta");
                    strLink = p_CResult.getString("link");
                    
                    CTemp = new OngObj(iId, strNombre, strContacto, 
                            strDescripcion, strNCuenta, strLink);
                    arreglo.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(OngQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return arreglo;
    } 
}


