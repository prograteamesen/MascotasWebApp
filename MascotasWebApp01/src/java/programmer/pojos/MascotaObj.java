
package programmer.pojos;

public class MascotaObj 
{

    private int m_iId;
    private String m_strNombre;
    private int m_iEdad;
    private int m_iIdCategoria;
    private String m_strRaza;
    private String m_strTamaño;
    private String m_strDescripcion;
    private int m_iIdOng;

    //constructor

    public MascotaObj(int p_iId, String p_strNombre, int p_iEdad, 
            int p_iIdCategoria, String p_strRaza, String p_strTamaño, 
            String p_strDescripcion, int p_iIdOng) 
    {
        setId(p_iId);
        setNombre(p_strNombre);
        setEdad(p_iEdad);
        setIdCategoria(p_iIdCategoria);
        setRaza(p_strRaza);
        setTamaño(p_strTamaño);
        setDescripcion(p_strDescripcion);
        setIdOng(p_iIdOng);
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

    public int getEdad() 
    {
        return m_iEdad;
    }

    private void setEdad(int p_iEdad) 
    {
        m_iEdad = p_iEdad;
    }

    public int getIdCategoria() 
    {
        return m_iIdCategoria;
    }

    private void setIdCategoria(int p_iIdCategoria) 
    {
        m_iIdCategoria = p_iIdCategoria;
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

    public int getIdOng() 
    {
        return m_iIdOng;
    }

    private void setIdOng(int p_iIdOng) 
    {
        m_iIdOng = p_iIdOng;
    }
  
}
