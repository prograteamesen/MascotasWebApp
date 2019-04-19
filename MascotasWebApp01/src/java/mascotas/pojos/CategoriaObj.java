
package mascotas.pojos;

public class CategoriaObj 
{
    private int m_intId;
    private String m_strCategoria;

    public CategoriaObj(int p_intId, String p_strCategoria) {
        setId(p_intId);
        setCategoria(p_strCategoria);
    }
    
    

    public int getId() {
        return m_intId;
    }

    private void setId(int p_intId) {
        m_intId = p_intId;
    }

    public String getCategoria() {
        return m_strCategoria;
    }

    private void setCategoria(String p_strCategoria) {
        m_strCategoria = p_strCategoria;
    }

    @Override
    public String toString() {
        return "CategoriaObj{" + "m_intId=" + m_intId + ", m_strCategoria=" + m_strCategoria + '}';
    }
    
    
    
}
