package logica;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import persistencia.controladoraPersistencia;
import persistencia.exceptions.NonexistentEntityException;

public class Controladora {

    controladoraPersistencia controlPersis = new controladoraPersistencia();

    public void crearUsuarioCliente(String nombre, String apellidoPa, String apellidoMa, String email, String telefono, String rol, String contraseña, String genero, Date nacimineto) {
        usuarios usu = new usuarios();
        usu.setNombre(nombre);
        usu.setApellidoPa(apellidoPa);
        usu.setApellidoMa(apellidoMa);
        usu.setEmail(email);
        usu.setTelefono(telefono);
        usu.setRol(rol);
        // Encriptar la contraseña
        String hashedPassword = BCrypt.hashpw(contraseña, BCrypt.gensalt());
        usu.setContraseña(hashedPassword);

        usu.setGenero(genero);
        usu.setAcimiento(nacimineto);

        clientes clie = new clientes();

        clie.setUsuario(usu);
        controlPersis.crearCliente(usu, clie);
    }

    public void crearUsuarioAsistente(String nombre, String apellidoPa, String apellidoMa, String email, String telefono, String rol, String contraseña, String genero, Date nacimiento, String colorIdentificador) {
        usuarios usu = new usuarios();
        usu.setNombre(nombre);
        usu.setApellidoPa(apellidoPa);
        usu.setApellidoMa(apellidoMa);
        usu.setEmail(email);
        usu.setTelefono(telefono);
        usu.setRol(rol);
        // Encriptar la contraseña
        String hashedPassword = BCrypt.hashpw(contraseña, BCrypt.gensalt());
        usu.setContraseña(hashedPassword);

        usu.setGenero(genero);
        usu.setAcimiento(nacimiento);

        asistentes asis = new asistentes();
        asis.setUsuario(usu);
        asis.setIdentificador(colorIdentificador);
        controlPersis.crearAsistente(usu, asis);
    }

    public boolean existeCorreo(String email) {
        return controlPersis.existeCorreo(email);
    }

    public usuarios verificarCredenciales(String email, String password) {
        return controlPersis.verificarCredenciales(email, password);
    }

    public List<asistentes> obtenerAsistentes() {
        return controlPersis.obtenerAsistentes();
    }

    public List<usuarios> getUsuarios() {
        return controlPersis.getUsuarios();
    }

    public void eliminarAsistente(int id) throws NonexistentEntityException {
        controlPersis.eliminarAsistente(id);
    }

}
