package programmer.objects;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.CategoriaObj;

public class CategoriaQuery extends Query<CategoriaObj>
{

    public CategoriaQuery(String p_strSql) 
    {
        super(p_strSql);
    }

    @Override
    public ArrayList<CategoriaObj> createArrayList(ResultSet p_CResult) 
    {
        ArrayList<CategoriaObj> arreglo = null;
        if(p_CResult!=null)
        {
            arreglo = new ArrayList<>();
            
            int iId;
            String strCategoria;
            
            CategoriaObj CTemp;
            
            try 
            {
                while(p_CResult.next())
                {
                    iId = p_CResult.getInt("id");
                    strCategoria = p_CResult.getString("categoria");
                    
                    CTemp = new CategoriaObj(iId, strCategoria);
                    arreglo.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(CategoriaQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return arreglo;
    } 
}

