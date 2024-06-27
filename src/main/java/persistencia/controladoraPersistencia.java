package persistencia;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import logica.*;
import org.mindrot.jbcrypt.BCrypt;
import persistencia.exceptions.NonexistentEntityException;

public class controladoraPersistencia {

    administradorJpaController admin = new administradorJpaController();
    asistentesJpaController asist = new asistentesJpaController();
    citasJpaController citas = new citasJpaController();
    clientesJpaController clientes = new clientesJpaController();
    horariosJpaController horarios = new horariosJpaController();
    usuariosJpaController usuarios = new usuariosJpaController();

    public void crearCliente(usuarios usu, clientes clie) {
        usuarios.create(usu);
        clientes.create(clie);
    }

    public void crearAsistente(usuarios usu, asistentes asis) {
        usuarios.create(usu);
        asist.create(asis);
    }

    public boolean existeCorreo(String email) {
        return usuarios.findUsuarioByEmail(email) != null;
    }

    public usuarios verificarCredenciales(String email, String password) {
        usuarios user = usuarios.findUsuarioByEmail(email);
        if (user != null && BCrypt.checkpw(password, user.getContraseña())) {
            return user;
        }
        return null;
    }

    public List<asistentes> obtenerAsistentes() {
        return asist.findasistentesEntities();
    }

    public List<usuarios> getUsuarios() {
        return usuarios.findusuariosEntities();
    }

    public void eliminarAsistente(int id) throws NonexistentEntityException {
        asistentes asistente = asist.findasistentes(id);
        if (asistente != null) {
            try {
                // Obtener el usuario asociado al asistente
                usuarios usuarioAsistente = asist.findUsuarioByAsistentes(id);

                // Eliminar el asistente
                asist.destroy(id);

                // Verificar y eliminar el usuario asociado si existe
                if (usuarioAsistente != null) {
                    usuarios.destroy(usuarioAsistente.getIdUsuario());
                }
            } catch (NonexistentEntityException ex) {
                throw new NonexistentEntityException("Error al eliminar el asistente con ID " + id, ex);
            }
        } else {
            throw new NonexistentEntityException("El asistente con ID " + id + " no existe.");
        }
    }

    public horarios obtenerHorariosPorFecha(Date fecha) {
        return horarios.findHorariosByFecha(fecha);
    }

    public void actualizarHorarios(horarios horario) throws Exception {
        horarios.edit(horario);
    }

    public List<horarios> obtenerHorariosBloqueados() {
        EntityManager em = horarios.getEntityManager();
        try {
            Query query = em.createQuery("SELECT h FROM horarios h WHERE h.vigente = false");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<String> obtenerDiasBloqueados() {
        return horarios.findDiasBloqueados();
    }

    public boolean existeFecha(Date fecha) {
        return horarios.findIDByFecha(fecha) != null;
    }

    public horarios obtenerIDPorFecha(Date fecha) {
        return horarios.findIDByFecha(fecha);
    }

    public void modificarHorarios(horarios hora) {
        try {
            horarios.edit(hora);
        } catch (Exception ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean verificarDisponibilidad(Date dia, LocalTime horario) {
        List<citas> citasList = citas.findCitasByDia(dia);
        for (citas cita : citasList) {
            if (cita.getHorario().toLocalTime().equals(horario)) {
                return false;
            }
        }
        return true;
    }

    public void crearCita(citas cita) {
        citas.create(cita);
    }

    public clientes obtenerClientePorId(int idCliente) {
        EntityManager em = citas.getEntityManager();
        try {
            return em.find(clientes.class, idCliente);
        } finally {
            em.close();
        }
    }

    public usuarios buscarUsuarioPorNombre(String nombre, String apellidoPa, String apellidoMa) {
        try {
            return usuarios.findUsuarioByNombreCompleto(nombre, apellidoPa, apellidoMa);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public clientes buscarClientePorUsuario(int idUsuario) {
        return clientes.findClienteByUsuario(idUsuario);
    }

    public Date getUltimaFechaCita(int idCliente) {
        return citas.getUltimaFechaCita(idCliente);
    }

    public citas obtenerUltimaCitaPorCliente(int idCliente) {
        return citas.findUltimaCitaByCliente(idCliente);
    }
}
