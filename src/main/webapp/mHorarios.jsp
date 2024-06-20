<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar horario</title>
        <link rel="stylesheet" href="Admi1.css">
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: center;
                padding: 8px;
                cursor: pointer;
            }
            th {
                background-color: #f2f2f2;
            }
            td.selected {
                background-color: #4CAF50;
                color: white;
            }
        </style>
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
                        <table id="calendar">
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
                            <tbody>
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
                var calendarBody = document.querySelector('#calendar tbody');
                var nombreMes = document.getElementById('nombreMes');
                var horaAperturaLabel = document.getElementById('hora-apertura');
                var horaCierreLabel = document.getElementById('hora-cierre');
                var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                var fechaActual = new Date();
                var mesActual = fechaActual.getMonth();
                var anoActual = fechaActual.getFullYear();
                nombreMes.textContent = meses[mesActual] + ' ' + anoActual;

                // Variable para almacenar la fecha seleccionada
                let fechaSeleccionada = '';

                // Función para obtener la fecha en formato AAAA-MM-DD
                function obtenerFechaAAAAMMDD(d) {
                    let year = d.getFullYear();
                    let month = ('0' + (d.getMonth() + 1)).slice(-2);
                    let day = ('0' + d.getDate()).slice(-2);
                    return `${year}-${month}-${day}`;
                }

                // Crear calendario para el mes actual
                function crearCalendario(mes, año) {
                    calendarBody.innerHTML = '';

                    let primerDiaMes = new Date(año, mes, 1);
                    let ultimoDiaMes = new Date(año, mes + 1, 0);

                    let diaSemanaInicio = primerDiaMes.getDay();
                    let diasEnMes = ultimoDiaMes.getDate();

                    let date = 1;
                    for (let i = 0; i < 6; i++) {
                        let row = document.createElement('tr');
                        for (let j = 0; j < 7; j++) {
                            if (i === 0 && j < diaSemanaInicio) {
                                let cell = document.createElement('td');
                                row.appendChild(cell);
                            } else if (date > diasEnMes) {
                                break;
                            } else {
                                let cell = document.createElement('td');
                                cell.textContent = date;
                                cell.setAttribute('data-date', obtenerFechaAAAAMMDD(new Date(año, mes, date)));
                                cell.addEventListener('click', function () {
                                    // Remover clase de selección de la celda anteriormente seleccionada
                                    let selectedCell = document.querySelector('.selected');
                                    if (selectedCell) {
                                        selectedCell.classList.remove('selected');
                                    }

                                    // Agregar clase de selección a la celda clickeada
                                    this.classList.add('selected');

                                    // Guardar fecha seleccionada en la variable y mostrar en consola
                                    fechaSeleccionada = this.getAttribute('data-date');
                                    console.log('Fecha seleccionada:', fechaSeleccionada);

                                    // Mostrar fecha seleccionada en el span
                                    obtenerHorarios(fechaSeleccionada);
                                });
                                row.appendChild(cell);
                                date++;
                            }
                        }
                        calendarBody.appendChild(row);
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

                // Crear calendario para el mes actual al cargar la página
                crearCalendario(mesActual, anoActual);
            });
        </script>
    </body>
</html>
