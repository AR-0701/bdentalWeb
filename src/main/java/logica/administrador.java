package logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class administrador implements Serializable {

   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAdministrador;

    @ManyToOne
    @JoinColumn(name = "idUsuario", nullable = false)
    private usuarios usuario;

    public administrador() {
    }

    public administrador(int idAdministrador, usuarios usuario) {
        this.idAdministrador = idAdministrador;
        this.usuario = usuario;
    }

    public int getIdAdministrador() {
        return idAdministrador;
    }

    public void setIdAdministrador(int idAdministrador) {
        this.idAdministrador = idAdministrador;
    }

    public usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(usuarios usuario) {
        this.usuario = usuario;
    }
  
}
