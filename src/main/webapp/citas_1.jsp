<%@page import="codigo.citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="citas1.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="principal">
            <div class="cabesera">
                <div class="p1"><%--imagen con la letra--%>
                    <img src="imagenes\logo.png">
                    <p>B - Dental</p>
                </div><%--imagen con la letra--%>
                <div class="p2">
                    <img src="imagenes\cerrarsesion.png">
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="inicioclientes.jsp">Principal</a></li>
                    <li><a href="Casos_clinicos.jsp">Casos clinicos</a></li>
                    <li><a href="Promociones.jsp">Promociones</a></li>
                    <li><a href="Servicios.jsp">Servicios</a></li>
                    <li><a href="inicioClientes.jsp">Agendar citas</a></li>
                </ul>
            </div>
            <%
                citas a = new citas();
                int dia = 13, mes = 12, anio = 2024;
            %>
            <div class="contenido_principal">
                <div class="pedir_datos">
                    <div class="p3">
                        <label for="nombre">Nombre completo:</label>
                    </div>
                    <div class="p4">
                        <input type="text" id="nombre" name="nombre" required><br><br>
                    </div>
                </div>
                <div class="pedir_datos">
                    <div class="p3">
                        <label for="nombre">Genero:</label>
                    </div>
                    <div class="p4">
                        <input type="text" id="nombre" name="nombre" required><br><br>
                    </div>
                </div>
                <div class="calendario">
                    <div class="caler">
                        <div class="calendario_pos">
                            <table>
                                <tr>
                                    <th colspan="7">Mes de Ejemplo</th>
                                </tr>
                                <tr>
                                    <th>Lun.</th>
                                    <th>Mar.</th>
                                    <th>Mie.</th>
                                    <th>Jue.</th>
                                    <th>Vie.</th>
                                    <th>Sab.</th>
                                    <th>Dom.</th>
                                </tr>
                                <tr>
                                    <%                                        int diat = 1;
                                        int y = 1;
                                        if (a.getStartDayOfWeek(mes, anio) != 1) {
                                            diat = a.obtenerDiaFinalMes(anio, mes - 1);
                                            for (int x = a.getStartDayOfWeek(mes, anio); x > 1; x--) {
                                    %><td><%out.println(diat - (x - 2));%></td><%
                                        }
                                        diat = 1;
                                        for (int x = a.getStartDayOfWeek(mes, anio); x <= 7; x++) {
                                    %><td><%out.println(diat);%></td><%
                                                diat++;
                                            }
                                            y++;
                                        }
                                        diat--;
                                        for (y = 0; y <= 4; y++) {
                                    %>
                                <tr>
                                    <%
                                        for (int x = 0; x <= 6; x++) {
                                    %>
                                    <td>
                                        <%
                                            if (diat > a.obtenerDiaFinalMes(anio, mes) - 1) {
                                                diat = 1;
                                            } else {
                                                diat++;
                                            }
                                            out.print(diat);
                                        %>    
                                    </td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>

                            </table>
                        </div>
                    </div>
                    <div class="horas">
                        <label for="opciones">Hora:</label>
                        <select id="opciones" name="opciones">
                            <option value="opcion1">11:00</option>
                            <option value="opcion2">12:00</option>
                            <option value="opcion3">13:00</option>
                            <option value="opcion3">14:00</option>
                            <option value="opcion3">15:00</option>
                        </select>
                    </div>
                </div>
                <div class="boton">
                    <input type="submit" value="Agendar">
                </div>
            </div>
        </div>
    </body>
</html>
