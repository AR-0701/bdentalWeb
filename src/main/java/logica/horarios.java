package logica;

import java.io.Serializable;
import java.util.Date;
import java.sql.Time;
import javax.persistence.*;

@Entity
public class horarios implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idHorarios;

    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic
    private Time horaApertura;
    private Time horaCierre;
    private boolean vigente;

    public horarios() {
    }

    public horarios(int idHorarios, Date fecha, Time horaApertura, Time horaCierre, boolean vigente) {
        this.idHorarios = idHorarios;
        this.fecha = fecha;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.vigente = vigente;
    }

    public boolean isVigente() {
        return vigente;
    }

    public void setVigente(boolean vigente) {
        this.vigente = vigente;
    }

    // Getters y Setters
    public int getIdHorarios() {
        return idHorarios;
    }

    public void setIdHorarios(int idHorarios) {
        this.idHorarios = idHorarios;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(Time horaApertura) {
        this.horaApertura = horaApertura;
    }

    public Time getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(Time horaCierre) {
        this.horaCierre = horaCierre;
    }

}
