
package mascotas.logic;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mascotas.database.DatabaseX;
import mascotas.pojos.CategoriaObj;

public class CategoriaLogic extends Logic
{
    public ArrayList<CategoriaObj> getAllCategoria() 
    {
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.categoria;";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        ArrayList<CategoriaObj> CArray = null;

        if(CResult!=null)
        {
            int iId;
            String strCategoria;

            CategoriaObj CTemp;
            CArray = new ArrayList<>();

            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strCategoria = CResult.getString("categoria");


                    CTemp = new CategoriaObj(iId, strCategoria);
                    CArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(CategoriaLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return CArray;        
    }
}
