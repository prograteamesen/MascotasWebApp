package programmer.objects;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.MascotaObj;


public class MascotaQuery extends Query<MascotaObj>
{

    public MascotaQuery(String p_strSql) 
    {
        super(p_strSql);
    }

    @Override
    public ArrayList<MascotaObj> createArrayList(ResultSet p_CResult) 
    {
        ArrayList<MascotaObj> arreglo = null;
        if(p_CResult!=null)
        {
            arreglo = new ArrayList<>();
            
            int iId;
            String strNombre;
            int iEdad;
            int iIdCategoria;
            String strRaza;
            String strTamaño;
            String strDescripcion;
            int iIdOng;
            
            MascotaObj CTemp;
            
            try 
            {
                while(p_CResult.next())
                {
                    iId = p_CResult.getInt("id");
                    strNombre = p_CResult.getString("nombre");
                    iEdad = p_CResult.getInt("edad");
                    iIdCategoria = p_CResult.getInt("categoria");
                    strRaza = p_CResult.getString("raza");
                    strTamaño = p_CResult.getString("tamaño");
                    strDescripcion = p_CResult.getString("descripcion");
                    iIdOng = p_CResult.getInt("ong");
                    
                    CTemp = new MascotaObj(iId, strNombre, 
                                iEdad, iIdCategoria, strRaza, strTamaño, 
                                strDescripcion, iIdOng);
                    arreglo.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MascotaQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return arreglo;
    } 
}
