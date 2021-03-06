package mascotas.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mascotas.database.DatabaseX;
import mascotas.pojos.UsuarioObj;

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
                String strContrasena;
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
                  strContrasena = CResult.getString("contraseña");
                  iTelefono = CResult.getInt("telefono");
                  iNivel = CResult.getInt("nivel");
                  
                  CTemp = new UsuarioObj(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo, strContrasena, iTelefono, iNivel);
                  CArray.add(CTemp);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean insertUsuarioBool (String p_strNombre, String p_strApellido ,String p_iFechaNacimiento, String p_strGenero, String p_strCorreo,String p_strContrasena, String p_strTelefono){
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
    
    // <editor-fold defaultstate="collapsed" desc="Delete Usuario">
    public int deleteUsuarioRows(int p_iId)
    {
        int iRows = deleteTableRows (p_iId, "usuario");
        return iRows;
    }
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Get Usuario By Id">
    public UsuarioObj getUsuarioById(int p_iId)
    {
        DatabaseX database = getDatabase();
        String strSql = "select * from mascotasdb.usuario where id="+p_iId+" ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        UsuarioObj CTemp = null;
        
        if(CResult!=null)
        {
          int iId;
          String strNombre;
          String strApellido;
          String strFechadeNacimiento;
          String strGenero;
          String strCorreo;
          String strContrasena;
          int iTelefono;
          int iNivel;
          
          try
          {
              while(CResult.next())
              {
                  iId = CResult.getInt("id");
                  strNombre = CResult.getString("nombre");
                  strApellido = CResult.getString("apellido");
                  strFechadeNacimiento = CResult.getString("fechanacimiento");
                  strGenero = CResult.getString("genero");
                  strCorreo = CResult.getString("correo");
                  strContrasena = CResult.getString("contraseña");
                  iTelefono = CResult.getInt("telefono");
                  iNivel = CResult.getInt("nivel");
                  
                  CTemp = new UsuarioObj(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo,strContrasena, iTelefono, iNivel);
              }
          }
              catch (SQLException ex) 
            {
                Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
            }   
          }
          return CTemp;       
    }
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Update Usuario">
        public int updateUsuarioRows(int p_iId, String p_strNombre, String p_strApellido, String p_strFechadeNacimiento, String p_strGenero, String p_strCorreo,String p_strContrasena, int p_iTelefono, int p_iNivel)
        {
          DatabaseX database = getDatabase();
        String strSql = "update mascotasdb.usuario "  
                + "set nombre = '" +p_strNombre+ "', apellido = '" +p_strApellido+ "', fechanacimiento = '" +p_strFechadeNacimiento+ "', genero = '" +p_strGenero+ "', correo = '" +p_strCorreo+ "', contraseña = '" +p_strContrasena+"', telefono = " +p_iTelefono+ ", nivel = "+p_iNivel+" "
                + "where id = " +p_iId+" ";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
        }
        // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Log in Usuario">
    
        public boolean authentication(String correo, String contrasena)
        {
            DatabaseX database = getDatabase(); 
            PreparedStatement ps = null;
            ResultSet rs = null;

            String strSql = "SELECT id, correo, contraseña FROM mascotasdb.usuario WHERE BINARY correo=? and contraseña= ?;";
            
            try {

                ps = database.getConnection().prepareStatement(strSql);
                ps.setString(1, correo);
                ps.setString(2, contrasena);
                rs = ps.executeQuery();

                if(rs.absolute(1))
                {
                    return true;
                }
            }
            catch (SQLException ex) {
                Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
                
           return false;
        }     
    // </editor-fold>
        
    // <editor-fold defaultstate="collapsed" desc="Verification Usuario">
     
        public int Level(String correo){
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    int iLevel = 0;

                    String strSql = "SELECT nivel FROM mascotasdb.usuario WHERE correo=?;";
                    DatabaseX database = getDatabase();
                
                try {

                    ps = database.getConnection().prepareStatement(strSql);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();

                    while(rs.next()){
                        iLevel = rs.getInt(1);
                    }
               }
                catch (SQLException ex) {
                  Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
                }
        return iLevel;   
            
        }
        
    // </editor-fold>
        
    // <editor-fold defaultstate="collapsed" desc="Get Usuario By Correo">
    public UsuarioObj getUsuarioByCorreo(String p_strCorreo)
    {
        DatabaseX database = getDatabase();
        String strSql = "select *from mascotasdb.usuario where correo='"+p_strCorreo+"';";
        
        ResultSet CResult = database.executeQuery(strSql);
        UsuarioObj CTemp = null;
        
        if(CResult!=null)
        {
          int iId;
          String strNombre;
          String strApellido;
          String strFechadeNacimiento;
          String strGenero;
          String strCorreo;
          String strContrasena;
          int iTelefono;
          int iNivel;
          
          try
          {
              while(CResult.next())
              {
                  iId = CResult.getInt("id");
                  strNombre = CResult.getString("nombre");
                  strApellido = CResult.getString("apellido");
                  strFechadeNacimiento = CResult.getString("fechanacimiento");
                  strGenero = CResult.getString("genero");
                  strCorreo = CResult.getString("correo");
                  strContrasena = CResult.getString("contraseña");
                  iTelefono = CResult.getInt("telefono");
                  iNivel = CResult.getInt("nivel");
                  
                  CTemp = new UsuarioObj(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo,strContrasena, iTelefono, iNivel);
              }
          }
              catch (SQLException ex) 
            {
                Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
            }   
          }
          return CTemp;       
    }
    // </editor-fold>   
    
    // <editor-fold defaultstate="collapsed" desc="Verificar registro">
    
        public boolean register(String correo)
        {
            DatabaseX database = getDatabase(); 
            PreparedStatement ps = null;
            ResultSet rs = null;

            String strSql = "SELECT id, correo, contraseña FROM mascotasdb.usuario WHERE BINARY correo=?;";
            
            try {

                ps = database.getConnection().prepareStatement(strSql);
                ps.setString(1, correo);
                rs = ps.executeQuery();

                if(rs.absolute(1))
                {
                    return true;
                }
            }
            catch (SQLException ex) {
                Logger.getLogger(UsuarioLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
                
           return false;
        }     
    // </editor-fold>
}

