
import logica.horarios;
import persistencia.horariosJpaController;


public class NewClass {

    public static void main(String[] args) {

        horariosJpaController horarioController = new horariosJpaController();

        String fecha = "2024-06-23";
        horarios horario = horarioController.findIdByFecha(fecha);

        if (horario != null) {
            System.out.println("Horario encontrado: " + horario.getIdHorarios());
        } else {
            System.out.println("No se encontró ningún horario para la fecha proporcionada.");
        }

    }

}
