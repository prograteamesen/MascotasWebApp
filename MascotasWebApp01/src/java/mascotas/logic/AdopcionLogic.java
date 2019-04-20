
package mascotas.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mascotas.database.DatabaseX;
import mascotas.pojos.AdopUserPetObj;
import mascotas.pojos.adopcionObj;

public class AdopcionLogic extends Logic
{
    public ArrayList<AdopUserPetObj> getAllAdoptionsI()
    {
        //Esta la vas a modificar, para que tome los nombnres tambien. Un innerJoin en una View.
        DatabaseX CDatabase = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.adopuserpet;";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        ArrayList<AdopUserPetObj> CArray = null;
        
        if(CResult!=null)
        {
            try 
            {
                int iId;
                int iIdUser;
                int iIdPet;
                String Mascota;
                String Usuario;
                AdopUserPetObj CTemp;
                CArray = new ArrayList<>();
                
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    iIdUser = CResult.getInt("idUser");
                    iIdPet = CResult.getInt("idPet");
                    Mascota = CResult.getString("nombre");
                    Usuario = CResult.getString("mascota");
                    
                    CTemp = new AdopUserPetObj(iId, iIdUser, Usuario, iIdPet, Mascota);
                    
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
    
    public int insertAdopcionRows(int p_iDueño, int p_iMascota)
    {
        //INSERT INTO travelsys.client(id,name,age) VALUES(0,'pepito',24);
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.adopcion(id,idmascota,idusuario) "
                + "VALUES(0,"+p_iDueño+","+p_iMascota+")";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
    public int deleteAdopcionRows(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "DELETE FROM mascotasdb.adopcion WHERE id = "+p_iId+";";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
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
