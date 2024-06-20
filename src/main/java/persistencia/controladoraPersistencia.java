package persistencia;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
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
   

}
