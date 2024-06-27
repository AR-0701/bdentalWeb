<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.citas" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultar citas</title>
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
                        <div class="Titulo modify-title"><h1>Consultar Citas</h1></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nombreCompleto">Nombre completo:</label>
                    <input type="text" id="nombreCompleto" name="nombreCompleto" value="${sessionScope.nombreCompleto}" readonly>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Cita</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                citas ultimaCita = (citas) request.getAttribute("ultimaCita");
                                if (ultimaCita != null) {
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            %>
                            <tr>
                                <td><%= ultimaCita.getIdCita()%></td>
                                <td><%= sdf.format(ultimaCita.getDia())%></td>
                                <td><%= ultimaCita.getHorario()%></td>
                                <td>
                                    <form action="svElliminarCita" method="POST">
                                        <input type="hidden" name="idCita" value="<%= ultimaCita.getIdCita()%>">
                                        <button type="submit">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                            } else {
                            %>
                            <tr>
                                <td colspan="4">No hay citas disponibles</td>
                            </tr>
                            <%
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
