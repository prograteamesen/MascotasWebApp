package programmer.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.Database.DatabaseX;
import programmer.objects.UsuarioQuery;
import programmer.pojos.UsuarioObj;

public class UsuarioLogic extends Logic
{
    // <editor-fold defaultstate="collapsed" desc="Get all Users">
    public ArrayList<UsuarioObj> getAllUsuarios() {
        
        DatabaseX CDatabase = getDatabase();
        String strSql = "select * from mascotasdb.usuario";
        ResultSet CResult = CDatabase.executeQuery(strSql);
        ArrayList<UsuarioObj> CArray = null;            
        
      if(CResult != null)
        {
            try {
                int iId;
                String strNombre;
                String strApellido;
                String strFechadeNacimiento;
                String strGenero;
                String strCorreo;
                String strContraseña;
                int iTelefono;
                int iNivel;
                UsuarioObj CTemp;
                CArray = new ArrayList<>();
                
                while(CResult.next())
                {
                  iId = CResult.getInt("id");
                  strNombre = CResult.getString("nombre");
                  strApellido = CResult.getString("apellido");
                  strFechadeNacimiento = CResult.getString("fechanacimiento");
                  strGenero = CResult.getString("genero");
                  strCorreo = CResult.getString("correo");
                  strContraseña = CResult.getString("contraseña");
                  iTelefono = CResult.getInt("telefono");
                  iNivel = CResult.getInt("nivel");
                  
                  CTemp = new UsuarioObj(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo, strContraseña, iTelefono, iNivel);
                  CArray.add(CTemp);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return CArray;
    }
    // </editor-fold>
 
    // <editor-fold defaultstate="collapsed" desc="Insert Usuario Integer">
    public int insertUsuario (String p_strNombre, String p_strApellido ,String p_iFechaNacimiento, String p_strGenero, String p_strCorreo,String p_strContrasena, String p_strTelefono){
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.usuario"
                    + "(id,nombre,apellido,fechanacimiento,genero,correo,contraseña,telefono,nivel) "
                    + "VALUES(0,'"+p_strNombre+"'"
                    + ",'"+p_strApellido+"'"
                    + ",'"+p_iFechaNacimiento+"'"
                    + ",'"+p_strGenero+"'"
                    + ",'"+p_strCorreo+"'"
                    + ",'"+p_strContrasena+"'"
                    + ","+p_strTelefono+""
                    + ",2);";
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Insert Usuario Booleano">
    public boolean insertUsuarioBool (String p_strNombre, String p_strApellido ,int p_iFechaNacimiento, String p_strGenero, String p_strCorreo,String p_strContrasena, String p_strTelefono){
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO mascotasdb.usuario"
                    + "(id,nombre,apellido,fechanacimiento,genero,correo,contraseña,telefono,nivel) "
                    + "VALUES(0,'"+p_strNombre+"'"
                    + ",'"+p_strApellido+"'"
                    + ",'"+p_iFechaNacimiento+"'"
                    + ",'"+p_strGenero+"'"
                    + ",'"+p_strCorreo+"'"
                    + ",'"+p_strContrasena+"'"
                    + ","+p_strTelefono+""
                    + ",2);";
        boolean bSuccess = database.executeNonQueryBool(strSql);
        return bSuccess;
    }
    // </editor-fold>
}
