<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar horario</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipaAdmin.jsp">
                        <img src="imagenes/logoo.png" alt="B - DENTAL">
                    </a>
                </div>
            </header>
            <main class="main">
                <div class="about">
                    <div class="text-content">
                        <div class="Titulo modify-title"><h1>Modificar horario</h1></div>
                    </div>
                </div>
                <!-- Schedule container -->
                <div class="schedule-container">
                    <!-- Form container -->
                    <div class="form-container">
                        <div class="form-group">
                            <label for="hora-apertura">Hora de apertura:</label>
                            <select id="hora-apertura">
                                <option value="---">---</option>
                                <option value="08:00">08:00</option>
                                <option value="09:00">09:00</option>
                                <option value="10:00">10:00</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="hora-cierre">Hora de cierre:</label>
                            <select id="hora-cierre"> 
                                <option value="---">---</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                            </select>
                        </div>
                        <!-- Button group -->
                        <div class="button-group">
                            <button id="bloquear">Bloquear</button>
                            <button id="desbloquear">Desbloquear</button>
                        </div>
                    </div>
                    <!-- Calendar container -->
                    <div class="calendar-container">
                        <h2 id="nombreMes"></h2>
                        <table class="calendar">
                            <thead>
                                <tr>
                                    <th>Dom.</th>
                                    <th>Lun.</th>
                                    <th>Mar.</th>
                                    <th>Mié.</th>
                                    <th>Jue.</th>
                                    <th>Vie.</th>
                                    <th>Sáb.</th>

                                </tr>
                            </thead>
                            <tbody id="cuerpoCalendario">
                                <!-- Los días del mes se generarán aquí dinámicamente -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Button modify -->
                <div class="button-modify">
                    <button id="modificar">Modificar</button>
                </div>
            </main>
            <footer>
                <!-- Footer content -->
            </footer>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Obtener una referencia al cuerpo del calendario y al encabezado del mes
                var cuerpoCalendario = document.getElementById('cuerpoCalendario');
                var nombreMes = document.getElementById('nombreMes');

                // Obtener el nombre del mes actual y el año actual
                var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                var fechaActual = new Date();
                var mesActual = fechaActual.getMonth();
                var anoActual = fechaActual.getFullYear();

                // Actualizar el nombre del mes en el encabezado
                nombreMes.textContent = meses[mesActual] + ' ' + anoActual;

                // Función para generar los días del mes y agregarlos al cuerpo del calendario
                function generarCalendario(mes, ano) {
                    // Eliminar cualquier día existente en el calendario
                    cuerpoCalendario.innerHTML = '';

                    // Obtener el primer día del mes y el último día del mes
                    var primerDia = new Date(ano, mes, 1);
                    var ultimoDia = new Date(ano, mes + 1, 0);

                    // Actualizar el nombre del mes en el encabezado
                    nombreMes.textContent = meses[mes] + ' ' + ano;

                    var diaSemana = primerDia.getDay(); // Día de la semana (0: Domingo, 1: Lunes, ...)
                    var diaActual = 1;

                    // Iterar sobre las semanas del mes
                    for (var semana = 0; semana < 6; semana++) {
                        var fila = document.createElement('tr'); // Crear una fila para cada semana

                        // Iterar sobre los días de la semana
                        for (var dia = 0; dia < 7; dia++) {
                            var celda = document.createElement('td'); // Crear una celda para cada día
                            if (semana === 0 && dia < diaSemana) {
                                // Dejar las celdas vacías hasta que llegue el primer día del mes
                                fila.appendChild(celda);
                            } else if (diaActual > ultimoDia.getDate()) {
                                // Dejar las celdas vacías después del último día del mes
                                fila.appendChild(celda);
                            } else {
                                // Agregar el número
                                // Agregar el número del día al contenido de la celda
                                celda.textContent = diaActual;

                                // Agregar la clase 'selectable' a la celda
                                celda.classList.add('selectable');

                                // Agregar un evento de clic a la celda
                                celda.addEventListener('click', function () {
                                    // Remover la clase 'selected' de todas las celdas
                                    document.querySelectorAll('.calendar .selected').forEach(selectedCell => {
                                        selectedCell.classList.remove('selected');
                                    });

                                    // Agregar la clase 'selected' a la celda seleccionada
                                    this.classList.add('selected');
                                });

                                // Agregar la celda a la fila
                                fila.appendChild(celda);

                                // Incrementar el día actual
                                diaActual++;
                            }
                        }

                        // Agregar la fila al cuerpo del calendario
                        cuerpoCalendario.appendChild(fila);

                        // Si ya se han añadido todos los días del mes, salir del bucle
                        if (diaActual > ultimoDia.getDate()) {
                            break;
                        }
                    }
                }

                // Llamar a la función para generar el calendario
                generarCalendario(mesActual, anoActual);

            });
            // JavaScript for dynamic calendar functionality
            document.querySelectorAll('.calendar .selectable').forEach(cell => {
                cell.addEventListener('click', function () {
                    document.querySelectorAll('.calendar .selected').forEach(selectedCell => {
                        selectedCell.classList.remove('selected');
                    });
                    this.classList.add('selected');
                });
            });
        </script>

    </body>
</html>
