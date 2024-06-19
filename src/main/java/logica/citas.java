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
    @JoinColumn(name = "idAsistente")
    private asistentes asistente;

    @ManyToOne
    @JoinColumn(name = "idAdministrador")
    private administrador administrador;

    @ManyToOne
    @JoinColumn(name = "idCliente", nullable = false)
    private clientes cliente;

    @ManyToOne
    @JoinColumn(name = "idHorarios", nullable = false)
    private horarios horarioObj;

    public citas() {
    }

    public citas(int idCita, Time horario, Date dia, asistentes asistente, administrador administrador, clientes cliente, horarios horarioObj) {
        this.idCita = idCita;
        this.horario = horario;
        this.dia = dia;
        this.asistente = asistente;
        this.administrador = administrador;
        this.cliente = cliente;
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

    public asistentes getAsistente() {
        return asistente;
    }

    public void setAsistente(asistentes asistente) {
        this.asistente = asistente;
    }

    public administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(administrador administrador) {
        this.administrador = administrador;
    }

    public clientes getCliente() {
        return cliente;
    }

    public void setCliente(clientes cliente) {
        this.cliente = cliente;
    }

    public horarios getHorarioObj() {
        return horarioObj;
    }

    public void setHorarioObj(horarios horarioObj) {
        this.horarioObj = horarioObj;
    }
    
    
}
