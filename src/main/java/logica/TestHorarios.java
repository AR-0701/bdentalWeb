package logica;

import persistencia.horariosJpaController;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

public class TestHorarios {

    public static void main(String[] args) {
        horariosJpaController horariosController = new horariosJpaController();

        // Obtener las fechas bloqueadas
        List<String> diasBloqueados = horariosController.findDiasBloqueados();

        // Formatear y mostrar las fechas bloqueadas
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println("Fechas bloqueadas:");
        for (String fecha : diasBloqueados) {
            System.out.println(fecha);
        }
    }
}
