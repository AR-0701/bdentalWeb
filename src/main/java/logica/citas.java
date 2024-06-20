package logica;

import java.io.Serializable;
import java.util.Date;
import java.sql.Time;
import javax.persistence.*;

@Entity
public class citas implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idCita;

    @Basic
    private Time horario;

    @Basic
    private Date dia;

    @ManyToOne
    @JoinColumn(name = "idCliente")
    private clientes cliente;

    @ManyToOne
    @JoinColumn(name = "registro")
    private usuarios usuario;

    @ManyToOne
    @JoinColumn(name = "idHorarios", nullable = false)
    private horarios horarioObj;

    public citas() {
    }

    public citas(int idCita, Time horario, Date dia, clientes cliente, usuarios usuario, horarios horarioObj) {
        this.idCita = idCita;
        this.horario = horario;
        this.dia = dia;
        this.cliente = cliente;
        this.usuario = usuario;
        this.horarioObj = horarioObj;
    }

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public Time getHorario() {
        return horario;
    }

    public void setHorario(Time horario) {
        this.horario = horario;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public clientes getCliente() {
        return cliente;
    }

    public void setCliente(clientes cliente) {
        this.cliente = cliente;
    }

    public usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(usuarios usuario) {
        this.usuario = usuario;
    }

    public horarios getHorarioObj() {
        return horarioObj;
    }

    public void setHorarioObj(horarios horarioObj) {
        this.horarioObj = horarioObj;
    }
    

}
