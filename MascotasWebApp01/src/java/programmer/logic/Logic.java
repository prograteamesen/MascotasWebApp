/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programmer.logic;

import programmer.database.DatabaseX;

public class Logic 
{
    
    private DatabaseX m_CDatabase;

    public Logic() 
    {
        setDatabase( createDatabase() );
    }

    public DatabaseX getDatabase() 
    {
        return m_CDatabase;
    }

    private void setDatabase(DatabaseX p_CDatabase) 
    {
        m_CDatabase = p_CDatabase;
    }

    private DatabaseX createDatabase() 
    {
        DatabaseX database = getDatabase();
        if(database == null)
        {
            database = new DatabaseX();
        }
        return database;
    }
    public int deleteTableRows(int p_iId,String p_strTableName) 
    {
        //delete from travelsys.client where id=0;
        DatabaseX database = getDatabase();
        String strSql = "delete from mascotasdb."+p_strTableName+" "
                + "where id="+p_iId+" ";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }    
}