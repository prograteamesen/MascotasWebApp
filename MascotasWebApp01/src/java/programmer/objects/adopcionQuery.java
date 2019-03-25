package programmer.objects;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.adopcionObj;

public class adopcionQuery extends Query<adopcionObj>
{

    public adopcionQuery(String p_strSql) 
    {
        super(p_strSql);
    }

    @Override
    public ArrayList<adopcionObj> createArrayList(ResultSet p_CResult) {
            
        ArrayList<adopcionObj> arreglo= null;
        
        adopcionObj CTemp;
        
        int iId;
        int iIdMascota;
        int iIdUsuario;
        
        if(p_CResult!= null)
        {
            try 
            {
                arreglo = new ArrayList<>();
                while(p_CResult.next())
                {
                    iId = p_CResult.getInt("id");
                    iIdMascota = p_CResult.getInt("idmascota");
                    iIdUsuario= p_CResult.getInt("idusuario");
                    
                    CTemp = new adopcionObj(iId, iIdMascota, iIdUsuario);
                    arreglo.add(CTemp);                 
                    
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(adopcionQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return arreglo;
    }    
    }
    
