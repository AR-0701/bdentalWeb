package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
public class asistentes implements Serializable {
 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAsistente;

    @ManyToOne
    @JoinColumn(name = "idUsuario", nullable = false)
    private usuarios usuario;

    @Basic
    private String identificador;

    public asistentes() {
    }

    public asistentes(int idAsistente, usuarios usuario, String identificador) {
        this.idAsistente = idAsistente;
        this.usuario = usuario;
        this.identificador = identificador;
    }

    public int getIdAsistente() {
        return idAsistente;
    }

    public void setIdAsistente(int idAsistente) {
        this.idAsistente = idAsistente;
    }

    public usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(usuarios usuario) {
        this.usuario = usuario;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

}
