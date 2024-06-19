package logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class clientes implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idCliente;

    @ManyToOne
    @JoinColumn(name = "idUsuario", nullable = false)
    private usuarios usuario;


    public clientes() {
    }
    
    public clientes(int idCliente, usuarios usuario, String fechaNacimiento, String genero) {
        this.idCliente = idCliente;
        this.usuario = usuario;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(usuarios usuario) {
        this.usuario = usuario;
    }

}
