<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar horario</title>
        <link rel="stylesheet" href="Admi1.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipaAdmin.jsp">
                        <img src="imagenes/loogo.png" alt="B - DENTAL">
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
                var cuerpoCalendario = document.getElementById('cuerpoCalendario');
                var nombreMes = document.getElementById('nombreMes');
                var horaAperturaLabel = document.getElementById('hora-apertura');
                var horaCierreLabel = document.getElementById('hora-cierre');

                var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                var fechaActual = new Date();
                var mesActual = fechaActual.getMonth();
                var anoActual = fechaActual.getFullYear();

                nombreMes.textContent = meses[mesActual] + ' ' + anoActual;

                function generarCalendario(mes, ano) {
                    cuerpoCalendario.innerHTML = '';

                    var primerDia = new Date(ano, mes, 1);
                    var ultimoDia = new Date(ano, mes + 1, 0);

                    nombreMes.textContent = meses[mes] + ' ' + ano;

                    var diaSemana = primerDia.getDay();
                    var diaActual = 1;

                    for (var semana = 0; semana < 6; semana++) {
                        var fila = document.createElement('tr');

                        for (var dia = 0; dia < 7; dia++) {
                            var celda = document.createElement('td');
                            if (semana === 0 && dia < diaSemana) {
                                fila.appendChild(celda);
                            } else if (diaActual > ultimoDia.getDate()) {
                                fila.appendChild(celda);
                            } else {
                                celda.textContent = diaActual;
                                celda.classList.add('selectable');
                                celda.dataset.fecha = `${ano}-${mes + 1}-${diaActual}`;

                                                        celda.addEventListener('click', function () {
                                                            document.querySelectorAll('.calendar .selected').forEach(selectedCell => {
                                                                selectedCell.classList.remove('selected');
                                                            });
                                                            this.classList.add('selected');
                                                            obtenerHorarios(this.dataset.fecha);
                                                        });

                                                        fila.appendChild(celda);
                                                        diaActual++;
                                                    }
                                                }

                                                cuerpoCalendario.appendChild(fila);

                                                if (diaActual > ultimoDia.getDate()) {
                                                    break;
                                                }
                                            }
                                        }

                                        function obtenerHorarios(fecha) {
                                            fetch('ObtenerHorariosServlet?fecha=' + fecha)
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data) {
                                                            horaAperturaLabel.value = data.horaApertura;
                                                            horaCierreLabel.value = data.horaCierre;
                                                        } else {
                                                            horaAperturaLabel.value = '---';
                                                            horaCierreLabel.value = '---';
                                                        }
                                                    })
                                                    .catch(error => console.error('Error:', error));
                                        }

                                        generarCalendario(mesActual, anoActual);
                                    });
        </script>

    </body>
</html>
