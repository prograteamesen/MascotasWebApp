
package programmer.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.database.DatabaseX;
import programmer.pojos.adopcionObj;

public class AdopcionLogic extends Logic
{
    public ArrayList<adopcionObj> getAllAdoptions()
    {
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.adopcion;";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        ArrayList<adopcionObj> CArray = null;
        
        if(CResult!=null)
        {
            try 
            {
                int iId;
                int iMascotaId;
                int iUsuarioId;
                adopcionObj CTemp;
                CArray = new ArrayList<>();
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    iMascotaId = CResult.getInt("idmascota");
                    iUsuarioId = CResult.getInt("idusuario");
                    
                    CTemp = new adopcionObj(iId, iMascotaId, iUsuarioId);
                    
                    //agregando al array un instancia de countryobj
                    CArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(AdopcionLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CArray;
    }
    /*
    public ArrayList<MealObj> getAllPets()
    {
        //codificar el metodo
        DatabaseX CDatabase = getDatabase();
        String strSql = "select * from esentravel.meal";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        ArrayList<MealObj> MArray = null;
        
        //evaluar el result que venga lleno
        if(CResult!=null)
        {
            try 
            {
                int iId;
                String strName;
                String strDescription;
                MealObj CTemp;
                MArray = new ArrayList<>();
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id"); //id
                    strName = CResult.getString("name"); //name
                    strDescription = CResult.getString("description"); //code
                    
                    CTemp = new MealObj(iId, strName, strDescription);
                    
                    //agregando al array un instancia de countryobj
                    MArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(TravelLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return MArray;
    }
    */
}
