
package programmer.objects;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.CategoriaObj;

public class CategoriaQuery extends Query<CategoriaObj> {

    public CategoriaQuery(String p_strSql) 
    {
        super(p_strSql);
    }

    @Override
    public ArrayList<CategoriaObj> createArrayList(ResultSet p_CResult) 
    {
        ArrayList<CategoriaObj> arreglo = null;
        
        CategoriaObj CTemp;
        int intId;
        String strCategoria;
        
        if(p_CResult!=null)
        {
            try {
                
                arreglo = new ArrayList<>();
                
                while(p_CResult.next())
                {
                    intId = p_CResult.getInt("id");
                    strCategoria = p_CResult.getString("categoria");
                    
                    CTemp = new CategoriaObj(intId, strCategoria);
                    arreglo.add(CTemp);
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoriaQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return arreglo;
    }
    
}
