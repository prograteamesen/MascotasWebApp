
package mascotas.pojos;

public class CategoriaObj 
{
    private int m_iId;
    private String m_strCategoria;
    
    //Constructor
    public CategoriaObj(int p_iId, String p_strCategoria) 
    {
        setId(p_iId);
        setCategoria(p_strCategoria);
    }

    //getters and setters
    public int getId() {
        return m_iId;
    }

    private void setId(int p_iId) 
    {
        m_iId = p_iId;
    }

    public String getCategoria() 
    {
        return m_strCategoria;
    }

    private void setCategoria(String p_strCategoria) 
    {
        m_strCategoria = p_strCategoria;
    }
    
}
