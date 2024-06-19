package logica;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;

@Entity
public class vigencias implements Serializable {

 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idDiaBloqueado;

    @Basic
    private Date fecha;

    public vigencias() {
    }

    public vigencias(int idDiaBloqueado, Date fecha) {
        this.idDiaBloqueado = idDiaBloqueado;
        this.fecha = fecha;
    }

    public int getIdDiaBloqueado() {
        return idDiaBloqueado;
    }

    public void setIdDiaBloqueado(int idDiaBloqueado) {
        this.idDiaBloqueado = idDiaBloqueado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
}
