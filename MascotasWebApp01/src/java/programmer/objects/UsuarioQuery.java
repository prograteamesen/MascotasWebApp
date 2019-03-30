
package programmer.objects;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import programmer.pojos.UsuarioObj;

public class UsuarioQuery extends Query<UsuarioObj>{
    public UsuarioQuery(String p_strSql) 
    {
        super(p_strSql);
    }
    
    @Override
    public ArrayList<UsuarioObj> createArrayList(ResultSet p_CResult) {
        
        ArrayList<UsuarioObj> arreglo = null;
        
            UsuarioObj cTemp;
            
            int iId;
            String strNombre;
            String strApellido;
            String strFechadeNacimiento;
            String strGenero;
            String strCorreo;
            String strContraseña;
            int iTelefono;
            int iNivel;
            
        
      if(p_CResult != null)
        {
            try {
                arreglo = new ArrayList<>();
                while(p_CResult.next())
                {
                  iId = p_CResult.getInt("id");
                  strNombre = p_CResult.getString("nombre");
                  strApellido = p_CResult.getString("apellido");
                  strFechadeNacimiento = p_CResult.getString("fechanacimiento");
                  strGenero = p_CResult.getString("genero");
                  strCorreo = p_CResult.getString("correo");
                  strContraseña = p_CResult.getString("contraseña");
                  iTelefono = p_CResult.getInt("telefono");
                  iNivel = p_CResult.getInt("nivel");
                  
                  cTemp = new UsuarioObj(iId, strNombre, strApellido, strFechadeNacimiento, strGenero, strCorreo, strContraseña, iTelefono, iNivel);
                  arreglo.add(cTemp);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return arreglo;
    }
    
}

