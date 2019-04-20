package programmer.pojos;

public class MascotaViewObj 
{
    private int m_iId;
    private String m_strNombre;
    private int m_iEdad;
    private String m_strCategoria;
    private String m_strRaza;
    private String m_strTamaño;
    private String m_strDescripcion;
    private String m_strOng;

    public MascotaViewObj(int p_iId, String p_strNombre, int p_iEdad, 
            String p_strCategoria, String p_strRaza, String p_strTamaño, 
            String p_strDescripcion, String p_strOng) 
    {
        setId(p_iId);
        setNombre(p_strNombre);
        setEdad(p_iEdad);
        setCategoria(p_strCategoria);
        setRaza(p_strRaza);
        setTamaño(p_strTamaño);
        setDescripcion(p_strDescripcion);
        setOng(p_strOng);
    }

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

    public int getEdad() 
    {
        return m_iEdad;
    }

    private void setEdad(int p_iEdad) 
    {
        m_iEdad = p_iEdad;
    }

    public String getCategoria() 
    {
        return m_strCategoria;
    }

    private void setCategoria(String p_strCategoria) 
    {
        m_strCategoria = p_strCategoria;
    }

    public String getRaza() 
    {
        return m_strRaza;
    }

    private void setRaza(String p_strRaza) 
    {
        m_strRaza = p_strRaza;
    }

    public String getTamaño() 
    {
        return m_strTamaño;
    }

    private void setTamaño(String p_strTamaño) 
    {
        m_strTamaño = p_strTamaño;
    }

    public String getDescripcion() 
    {
        return m_strDescripcion;
    }

    private void setDescripcion(String p_strDescripcion) 
    {
        m_strDescripcion = p_strDescripcion;
    }

    public String getOng() 
    {
        return m_strOng;
    }

    private void setOng(String p_strOng) 
    {
        m_strOng = p_strOng;
    }
}
