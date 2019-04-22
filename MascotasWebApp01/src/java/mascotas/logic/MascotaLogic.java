package mascotas.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mascotas.database.DatabaseX;
import mascotas.pojos.MascotaObj;
import mascotas.pojos.MascotaViewObj;

public class MascotaLogic extends Logic
{
    /*
    public boolean insertMascotaBool(String p_strNombre, int p_iEdad, 
            int p_iIdCategoria, String p_strRaza, String p_strTamaño, 
            String p_strDescripcion, int p_iIdOng)
    {
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.mascota (id, nombre, edad, "
                + "idcategoria, raza, tamaño, descripcion, idong) "
                + "VALUES (0,'"+p_strNombre+"', "+p_iEdad+", "+p_iIdCategoria+", "
                + "'"+p_strRaza+"', '"+p_strTamaño+"', "
                + "'"+p_strDescripcion+"', "+p_iIdOng+");";
        System.out.println(strSql);
        boolean success = database.executeNonQueryBool(strSql);
        return success;
    }
    */
    
    public int insertMascotaRows(String p_strNombre, int p_iEdad, 
            int p_iIdCategoria, String p_strRaza, String p_strTamaño, 
            String p_strDescripcion, int p_iIdOng, String p_strFoto)
    {

        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.mascota (id, nombre, edad, "
                + "idcategoria, raza, tamaño, descripcion, idong, foto) "
                + "VALUES (0,'"+p_strNombre+"', "+p_iEdad+", "+p_iIdCategoria+", "
                + "'"+p_strRaza+"', '"+p_strTamaño+"', "
                + "'"+p_strDescripcion+"', "+p_iIdOng+", '"+p_strFoto+"');";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }

    public ArrayList<MascotaViewObj> getAllMascotas() 
    {
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.mascota_view;";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        ArrayList<MascotaViewObj> MArray = null;
        
        if(CResult!=null)
        {
            int iId;
            String strNombre;
            int iEdad;
            String strCategoria;
            String strRaza;
            String strTamaño;
            String strDescripcion;
            String strOng;
            String strFoto;
            
            
            MascotaViewObj CTemp;
            MArray = new ArrayList<>();
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    iEdad = CResult.getInt("edad");
                    strCategoria = CResult.getString("categoria");
                    strRaza = CResult.getString("raza");
                    strTamaño = CResult.getString("tamaño");
                    strDescripcion = CResult.getString("descripcion");
                    strOng = CResult.getString("ong");
                    strFoto = CResult.getString("foto");
                    
                    CTemp = new MascotaViewObj(iId, strNombre, iEdad, strCategoria,
                    strRaza, strTamaño, strDescripcion, strOng, strFoto);
                    MArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MascotaLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return MArray;
        
    }

    public int deleteMascotaRows(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "DELETE FROM mascotasdb.mascota WHERE id = "+p_iId+";";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }

    public MascotaObj getMascotaById(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.mascota WHERE id = "+p_iId+";";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        MascotaObj CTemp = null;
        
        if(CResult!=null)
        {
            int iId;
            String strNombre;
            int iEdad;
            int iIdCategoria;
            String strRaza;
            String strTamaño;
            String strDescripcion;
            int iIdOng;
            String strFoto;
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    iEdad = CResult.getInt("edad");
                    iIdCategoria = CResult.getInt("idcategoria");
                    strRaza = CResult.getString("raza");
                    strTamaño = CResult.getString("tamaño");
                    strDescripcion = CResult.getString("descripcion");
                    iIdOng = CResult.getInt("idong");
                    strFoto = CResult.getString("foto");
                    
                    CTemp = new MascotaObj(iId, strNombre, iEdad, 
                            iIdCategoria, strRaza, strTamaño, strDescripcion, 
                            iIdOng, strFoto);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MascotaLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CTemp;
    }
    
    public MascotaViewObj getMascotaViewById(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "SELECT * FROM mascotasdb.mascota_view WHERE id = "+p_iId+";";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        MascotaViewObj CTemp = null;
        
        if(CResult!=null)
        {
            int iId;
            String strNombre;
            int iEdad;
            String strIdCategoria;
            String strRaza;
            String strTamaño;
            String strDescripcion;
            String strIdOng;
            String strFoto;
            
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strNombre = CResult.getString("nombre");
                    iEdad = CResult.getInt("edad");
                    strIdCategoria = CResult.getString("categoria");
                    strRaza = CResult.getString("raza");
                    strTamaño = CResult.getString("tamaño");
                    strDescripcion = CResult.getString("descripcion");
                    strIdOng = CResult.getString("ong");
                    strFoto = CResult.getString(strTamaño);
                    
                    CTemp = new MascotaViewObj(iId, strNombre, iEdad, 
                            strIdCategoria, strRaza, strTamaño, strDescripcion, 
                            strIdOng, strFoto);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(MascotaLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CTemp;
    }
    
    public int updateMascotaRows(int p_iId, String p_strNombre, int p_iEdad, 
            int p_iIdCategoria, String p_strRaza, String p_strTamaño, 
            String p_strDescripcion, int p_iIdOng, String p_strFoto) 
    {
        
        DatabaseX database = getDatabase();
        String strSql = "UPDATE mascotasdb.mascota SET nombre = '"+p_strNombre+"', "
                + "edad = "+p_iEdad+", idcategoria = "+p_iIdCategoria+", "
                + "raza = '"+p_strRaza+"', tamaño = '"+p_strTamaño+"', "
                + "descripcion = '"+p_strDescripcion+"', idong = "+p_iIdOng+","
                + " foto='"+p_strFoto+"' WHERE id = "+p_iId+";";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
}

