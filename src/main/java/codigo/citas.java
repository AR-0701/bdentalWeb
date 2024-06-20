/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;

public class citas {
    
    public int getStartDayOfWeek(int month, int year) {
        // Crear una fecha al primer día del mes
        LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);
        // Obtener el día de la semana
        DayOfWeek startDay = firstDayOfMonth.getDayOfWeek();
        // Devolver el día de la semana como un número (1 = Lunes, ..., 7 = Domingo)
        return startDay.getValue();
    }

    // Método para obtener el día de la semana del último día del mes
    public int getEndDayOfWeek(int month, int year) {
        // Obtener el último día del mes
        YearMonth yearMonth = YearMonth.of(year, month);
        LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();
        // Obtener el día de la semana
        DayOfWeek endDay = lastDayOfMonth.getDayOfWeek();
        // Devolver el día de la semana como un número (1 = Lunes, ..., 7 = Domingo)
        return endDay.getValue();
    }
    
    public String getMonthName(int month) {
        String[] months = {"", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                            "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        if (month < 1 || month > 12) {
            throw new IllegalArgumentException("El número del mes debe estar entre 1 y 12.");
        }
        return months[month];
    }

    // Método para obtener el nombre del día de la semana a partir del número del día
    public String getDayName(int day) {
        String[] days = {"", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
        if (day < 1 || day > 7) {
            throw new IllegalArgumentException("El número del día debe estar entre 1 y 7.");
        }
        return days[day];
    }
    
    public int obtenerDiaInicioMes(int year, int month) {
        LocalDate primerDiaMes = LocalDate.of(year, month, 1);
        DayOfWeek diaSemana = primerDiaMes.getDayOfWeek();
        return diaSemana.getValue(); // Devuelve 1 para Lunes, 2 para Martes, etc.
    }

    // Método para obtener el día final del mes
    public int obtenerDiaFinalMes(int year, int month) {
        LocalDate ultimoDiaMes = LocalDate.of(year, month, 1).plusMonths(1).minusDays(1);
        return ultimoDiaMes.getDayOfMonth();
    }

    public int obtenerDiaActual() {
        LocalDate fechaActual = LocalDate.now();
        return fechaActual.getDayOfMonth();
    }

    // Método para obtener el mes actual
    public int obtenerMesActual() {
        LocalDate fechaActual = LocalDate.now();
        return fechaActual.getMonthValue();
    }

    // Método para obtener el año actual
    public int obtenerAnioActual() {
        LocalDate fechaActual = LocalDate.now();
        return fechaActual.getYear();
    }
    
    public static void main(String[] args) {
        citas a=new citas();
        System.out.println(a.obtenerDiaInicioMes(2024, 6));
    }
}

