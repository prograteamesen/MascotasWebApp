
package programmer.pojos;

public class UsuarioObj {
    private int m_iId;
    private String m_strNombre;
    private String m_strApellido;
    private String m_strFechadeNacimiento;
    private String m_strGenero;
    private String m_strCorreo;
    private String m_strContraseña;
    private int m_iTelefono;
    private int m_iNivel;

    public UsuarioObj(int p_iId, String p_strNombre, String p_strApellido, String p_strFechadeNacimiento, String p_strGenero, String p_strCorreo, String p_strContraseña, int p_iTelefono, int p_iNivel) {
        setId(p_iId);
        setNombre(p_strNombre);
        setApellido(p_strApellido);
        setFechadeNacimiento(p_strFechadeNacimiento);
        setGenero(p_strGenero);
        setCorreo(p_strCorreo);
        setContraseña(p_strContraseña);
        setTelefono(p_iTelefono);
        setNivel(p_iNivel);
    }
  
    
    public int getId() {
        return m_iId;
    }

    private void setId(int p_iId) {
        m_iId = p_iId;
    }

    public String getNombre() {
        return m_strNombre;
    }

    private void setNombre(String p_strNombre) {
        m_strNombre = p_strNombre;
    }

    public String getApellido() {
        return m_strApellido;
    }

    private void setApellido(String p_strApellido) {
        m_strApellido = p_strApellido;
    }

    public String getFechadeNacimiento() {
        return m_strFechadeNacimiento;
    }

    private void setFechadeNacimiento(String p_strFechadeNacimiento) {
        m_strFechadeNacimiento = p_strFechadeNacimiento;
    }

    public String getGenero() {
        return m_strGenero;
    }

    private void setGenero(String p_strGenero) {
        m_strGenero = p_strGenero;
    }

    public String getCorreo() {
        return m_strCorreo;
    }

    private void setCorreo(String p_strCorreo) {
        m_strCorreo = p_strCorreo;
    }

    public String getContraseña() {
        return m_strContraseña;
    }

    private void setContraseña(String p_strContraseña) {
        m_strContraseña = p_strContraseña;
    }

    public int getTelefono() {
        return m_iTelefono;
    }

    private void setTelefono(int p_iTelefono) {
        m_iTelefono = p_iTelefono;
    }

    public int getNivel() {
        return m_iNivel;
    }

    private void setNivel(int p_iNivel) {
        m_iNivel = p_iNivel;
    }

    @Override
    public String toString() {
        return "UsuarioObj{" + "m_iId=" + m_iId + ", m_strNombre=" + m_strNombre + ", m_strApellido=" + m_strApellido + ", m_strFechadeNacimiento=" + m_strFechadeNacimiento + ", m_strGenero=" + m_strGenero + ", m_strCorreo=" + m_strCorreo + ", m_strContraseña=" + m_strContraseña + ", m_iTelefono=" + m_iTelefono + ", m_iNivel=" + m_iNivel + '}';
    }
    
    
}
