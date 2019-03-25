package programmer.pojos;
public class adopcionObj {
    private int m_Id;
    private int m_IdMascota;
    private int m_IdUsuario;

    public adopcionObj(int p_Id, int p_IdMascota, int p_IdUsuario) {
        setId(p_Id);
        setIdMascota(p_IdMascota);
        setIdUsuario(p_IdUsuario);
    }

    public int getId() {
        return m_Id;
    }

    private void setId(int p_Id) {
        m_Id = p_Id;
    }

    public int getIdMascota() {
        return m_IdMascota;
    }

    private void setIdMascota(int p_IdMascota) {
        m_IdMascota = p_IdMascota;
    }

    public int getIdUsuario() {
        return m_IdUsuario;
    }

    private void setIdUsuario(int p_IdUsuario) { 
        m_IdUsuario = p_IdUsuario;
    }
    
    
}
