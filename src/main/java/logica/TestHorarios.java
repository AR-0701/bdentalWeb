package logica;

import persistencia.horariosJpaController;
import java.sql.Date;

public class TestHorarios {

    public static void main(String[] args) {
        horariosJpaController horariosController = new horariosJpaController();
        
        // Reemplaza con la fecha que quieres probar
        Date fecha = Date.valueOf("2024-06-19");

        horarios horario = horariosController.findHorariosByFecha(fecha);
        
        if (horario != null) {
            System.out.println("Horarios encontrados:");
            System.out.println("Fecha: " + horario.getFecha());
            System.out.println("Hora de Apertura: " + horario.getHoraApertura());
            System.out.println("Hora de Cierre: " + horario.getHoraCierre());
        } else {
            System.out.println("No se encontraron horarios para la fecha: " + fecha);
        }
    }
}
