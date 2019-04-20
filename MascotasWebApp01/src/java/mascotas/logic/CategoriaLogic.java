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
        //select * from travelsys.client;
        DatabaseX database = getDatabase();
        String strSql = "select * from mascotasdb.categoria ";
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
     public int insertCategoriaRows(String p_strCategoria) 
    {
        //INSERT INTO travelsys.client(id,name,age) VALUES(0,'pepito',24);
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.categoria(id,categoria) VALUES(0,'"+p_strCategoria+"');";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }

    public int deleteCategoriaRows(int p_iId) 
    {
        int iRows = deleteTableRows(p_iId,"categoria");
        return iRows;
    }

    public CategoriaObj getCategoriaById(int p_iId) 
    {
        //select * from travelsys.client;
        DatabaseX database = getDatabase();
        String strSql = "select * from mascotasdb.categoria "
                + "where id="+p_iId+" ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        CategoriaObj CTemp = null;
        
        if(CResult!=null)
        {
            int iId;
            String strCategoria;
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    strCategoria = CResult.getString("categoria");
                    CTemp = new CategoriaObj(p_iId, strCategoria);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(CategoriaLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CTemp;
    }

    public int updateCategoriaRows(int p_iId, String p_strCategoria) 
    {
        //update travelsys.client set name = 'fabricio',age = 25 where id = 9;
        DatabaseX database = getDatabase();
        String strSql = "update mascotasdb.categoria "
                + "set categoria = '"+p_strCategoria+"' "
                + "where id = "+p_iId+" ";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
    

    
}