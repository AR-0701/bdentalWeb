<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="logica.citas" %>
<%@ page import="logica.asistentes" %>
<%@page import="persistencia.controladoraPersistencia"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Citas</title>
        <link rel="stylesheet" href="admiprue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <div class="container">
            <header>
                <!-- Encabezado de la página -->
            </header>
            <main class="main">
                <div class="about">
                    <div class="text-content">
                        <div class="Titulo modify-title"><h1>Ver Citas</h1></div>
                    </div>
                </div>
                <form id="dateForm" action="SvMostrarCitas" method="POST">
                    <div class="date-form-group">
                        <label for="fecha">Seleccionar Fecha:</label>
                        <input type="date" id="fecha" name="fecha" required>                   
                    </div>
                    <button type="submit">Ver Citas</button>
                </form>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Cita</th>
                                <th>Nombre del Cliente</th>
                                <th>Hora</th>
                                <th>Registrado por</th>
                            </tr>
                        </thead>
                        <%
                            List<citas> listaCitas = (List<citas>) request.getSession().getAttribute("listaCitas");
                            controladoraPersistencia control = new controladoraPersistencia();
                            List<asistentes> listaAsistentes = control.obtenerAsistentes();

                        %>
                        <tbody> 
                            <%                                if (listaCitas != null) {
                                    for (citas cita : listaCitas) {
                                        String registradoPor = cita.getUsuario().getRol();
                                        String nombreRegistradoPor = "Desconocido";
                                        String identificadorColor = null;
                                        int idAsis = 0;

                                        System.out.println(" " + registradoPor);
                                        if ("Cliente".equals(registradoPor)) {
                                            nombreRegistradoPor = "Cliente";
                                            System.out.println("tipo c " + registradoPor);
                                        } else if ("Administrador".equals(registradoPor)) {
                                            nombreRegistradoPor = "Admin";
                                            System.out.println(" tipoa" + registradoPor);

                                        } else {
                                            for (asistentes asist : listaAsistentes) {
                                               identificadorColor= asist.getIdentificador();
                                                
                                            }
                                        }
                            %>
                            <tr>
                                <td><%= cita.getIdCita()%></td>
                                <td><%= cita.getCliente().getUsuario().getNombre()%> <%= cita.getCliente().getUsuario().getApellidoPa()%> <%= cita.getCliente().getUsuario().getApellidoMa()%></td>
                                <td><%= cita.getHorario()%></td>
                                <td>
                                    <% if (identificadorColor != null) {%>
                                    <div style="width: 20px; height: 20px; background-color: <%= identificadorColor%>; border-radius: 50%; margin: auto;"></div>
                                    <% } else {%>
                                    <%= nombreRegistradoPor%>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </main>
            <footer>
            </footer>
        </div>
    </body>
</html>
