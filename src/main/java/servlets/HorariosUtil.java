package servlets;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class HorariosUtil {

    public static List<LocalTime> generarHorariosDisponibles(LocalTime apertura, LocalTime cierre) {
        List<LocalTime> horariosDisponibles = new ArrayList<>();
        LocalTime current = apertura;

        while (current.isBefore(cierre)) {
            horariosDisponibles.add(current);
            current = current.plusHours(1);
        }

        return horariosDisponibles;
    }

}
