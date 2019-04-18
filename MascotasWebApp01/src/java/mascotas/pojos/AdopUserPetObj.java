package mascotas.pojos;

public class AdopUserPetObj 
{
    private int m_iId;
    private int m_iIdUser;
    private String m_strNombre;
    private int m_iIdPet;
    private String m_strMascota;

    public AdopUserPetObj(int p_iId, int p_iIdUser, String p_strNombre, int p_iIdPet, String p_strMascota) 
    {
        setId(p_iId);
        setIdUser(p_iIdUser);
        setNombre(p_strNombre);
        setIdPet(p_iIdPet);
        setMascota(p_strMascota);
    }
   
    public int getId() {
        return m_iId;
    }

    private void setId(int p_iId) {
        m_iId = p_iId;
    }

    public int getIdUser() {
        return m_iIdUser;
    }

    private void setIdUser(int p_iIdUser) {
        m_iIdUser = p_iIdUser;
    }

    public String getNombre() {
        return m_strNombre;
    }

    private void setNombre(String p_strNombre) {
        m_strNombre = p_strNombre;
    }

    public int getIdPet() {
        return m_iIdPet;
    }

    private void setIdPet(int p_iIdPet) {
        m_iIdPet = p_iIdPet;
    }

    public String getMascota() {
        return m_strMascota;
    }

    private void setMascota(String p_strMascota) {
        m_strMascota = p_strMascota;
    }
    
    
}
