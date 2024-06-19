package logica;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;

@Entity
public class usuarios implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUsuario;

    @Basic
    private String nombre;
    private String apellidoPa;
    private String apellidoMa;
    private String email;
    private String telefono;
    private String rol;
    private String contraseña;
    private String genero;
    private Date acimiento;
    
    public usuarios() {
    }

    public usuarios(int idUsuario, String nombre, String apellidoPa, String apellidoMa, String email, String telefono, String rol, String contraseña, String genero, Date acimiento) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellidoPa = apellidoPa;
        this.apellidoMa = apellidoMa;
        this.email = email;
        this.telefono = telefono;
        this.rol = rol;
        this.contraseña = contraseña;
        this.genero = genero;
        this.acimiento = acimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Date getAcimiento() {
        return acimiento;
    }

    public void setAcimiento(Date acimiento) {
        this.acimiento = acimiento;
    }

    

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPa() {
        return apellidoPa;
    }

    public void setApellidoPa(String apellidoPa) {
        this.apellidoPa = apellidoPa;
    }

    public String getApellidoMa() {
        return apellidoMa;
    }

    public void setApellidoMa(String apellidoMa) {
        this.apellidoMa = apellidoMa;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
