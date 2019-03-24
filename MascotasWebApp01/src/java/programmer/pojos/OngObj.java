
package programmer.pojos;

public class OngObj {
    //declarando variables de instancia
    private int m_iId;
    private String m_strNombre;
    private String m_strContacto;
    private String m_strDescripcion;
    private int m_iNCuenta;
    private String m_strLink;

    //creando constructor

    public OngObj(int p_iId, String p_strNombre, String p_strContacto, String p_strDescripcion, int p_iNCuenta, String p_strLink) {
        setId(p_iId);
        setNombre(p_strNombre);
        setContacto(p_strContacto);
        setDescripcion(p_strDescripcion);
        setNCuenta(p_iNCuenta);
        setLink(p_strLink);
    }
    
    
    
    //Creando getters y setters
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

    public String getContacto() {
        return m_strContacto;
    }

    private void setContacto(String p_strContacto) {
        m_strContacto = p_strContacto;
    }

    public String getDescripcion() {
        return m_strDescripcion;
    }

    private void setDescripcion(String p_strDescripcion) {
        m_strDescripcion = p_strDescripcion;
    }

    public int getNCuenta() {
        return m_iNCuenta;
    }

    private void setNCuenta(int p_iNCuenta) {
        m_iNCuenta = p_iNCuenta;
    }

    public String getLink() {
        return m_strLink;
    }

    private void setLink(String p_strLink) {
        m_strLink = p_strLink;
    }

    @Override
    public String toString() {
        return "OngObj{" + "m_iId=" + m_iId + ", m_strNombre=" + m_strNombre + ", m_strContacto=" + m_strContacto + ", m_strDescripcion=" + m_strDescripcion + ", m_iNCuenta=" + m_iNCuenta + ", m_strLink=" + m_strLink + '}';
    }

    
}
