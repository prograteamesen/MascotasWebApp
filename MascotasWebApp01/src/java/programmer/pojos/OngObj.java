
package programmer.pojos;

public class OngObj 
{
    private int m_iId;
    private String m_strNombre;
    private String m_strContacto;
    private String m_strDescripcion;
    private String m_strNCuenta;
    private String m_strLink;
    
    //Constructor
    public OngObj(int p_iId, String p_strNombre, String p_strContacto, 
            String p_strDescripcion, String p_strNCuenta, String p_strLink) 
    {
        setId(p_iId);
        setNombre(p_strNombre);
        setContacto(p_strContacto);
        setDescripcion(p_strDescripcion);
        setNCuenta(p_strNCuenta);
        setLink(p_strLink);
    }
    
    
    //getters and setters
    public int getId() 
    {
        return m_iId;
    }

    private void setId(int p_iId) 
    {
        m_iId = p_iId;
    }

    public String getNombre() 
    {
        return m_strNombre;
    }

    private void setNombre(String p_strNombre) 
    {
        m_strNombre = p_strNombre;
    }

    public String getContacto() 
    {
        return m_strContacto;
    }

    private void setContacto(String p_strContacto) 
    {
        m_strContacto = p_strContacto;
    }

    public String getrDescripcion() 
    {
        return m_strDescripcion;
    }

    private void setDescripcion(String p_strDescripcion) 
    {
        m_strDescripcion = p_strDescripcion;
    }

    public String getNCuenta() 
    {
        return m_strNCuenta;
    }

    private void setNCuenta(String p_strNCuenta) 
    {
        m_strNCuenta = p_strNCuenta;
    }

    public String getLink() 
    {
        return m_strLink;
    }

    private void setLink(String p_strLink) 
    {
        m_strLink = p_strLink;
    }
    
}
