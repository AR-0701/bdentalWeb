<%-- 
    Document   : citas
    Created on : 13 jun. 2024, 09:30:53
    Author     : edriv
--%>

<%@page import="codigo.citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="consultarcitas.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>


            .container {
                width: 100%;
                max-width: 1200px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }



            .logo2 img {
                max-width: 150px;
            }

            .main {
                padding: 20px 0;
            }

            .modify-title {
                text-align: center;
                margin-bottom: 20px;
            }

            .schedule-container {
                display: flex;
                flex-wrap: wrap;
            }

            .form-container {
                flex: 1;
                padding: 20px;
                background-color: #f2f2f2;
                margin-right: 20px;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }

            .form-group {
                margin-bottom: 10px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input[type="text"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 3px;
                box-sizing: border-box;
                font-size: 14px;
            }



            .calendar-container {
                flex: 1;
                padding: 20px;
                background-color: #f2f2f2;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: center;
                align-items: center;
            }

            #datepicker {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 3px;
                box-sizing: border-box;
                font-size: 14px;
                width: 100%;
                max-width: 300px; /* Ajustar el ancho máximo según sea necesario */
            }

            #fechaSeleccionada {
                margin-top: 10px;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 3px;
                font-size: 14px;
                width: 100%;
                box-sizing: border-box;
            }

            .button-modify {
                text-align: center;
                margin-top: 20px;
            }

            .button-modify button {
                padding: 10px 20px;
                cursor: pointer;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                font-size: 14px;
            }

            .button-modify button:hover {
                background-color: #0056b3;
            }

            footer {
                margin-top: 20px;
                padding: 10px 0;
                text-align: center;
                border-top: 1px solid #ddd;
            }
            .blocked-date a {
                background-color: #D8BFD8 !important; /* Color lila */
                color: white !important;
            }

        </style>
    </head>
    <body>
        <div class="principal">
            <div class="cabesera">
                <div class="p1">
                    <img src="imagenes\logo.png">
                    <p>B - Dental</p>
                </div>
                <div class="p2">
                    <img src="imagenes\cerrarsesion.png">
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="principal_clientes.html">Principal</a></li>
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
                <div class="calendar-container">
                    <div id="datepicker"></div>
                </div>

                <div class="calendario">

                    <div class="horas">
                        <label for="opciones">Hora:</label>
                        <select id="opciones" name="opciones">
                            <option value="opcion1">Opción 1</option>
                            <option value="opcion2">Opción 2</option>
                            <option value="opcion3">Opción 3</option>
                        </select>
                    </div>
                </div>

                <div class="boton">
                    <input type="submit" value="Modificar">
                </div>

                <div class="boton2">
                    <input type="submit" value="Eliminar">
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                var fechaSeleccionadaInput = $('#datepicker');

                // Función para obtener horarios
                function obtenerHorarios(fecha) {
                    if (!fecha) {
                        console.error('Fecha inválida:', fecha);
                        alert('Seleccione una fecha válida.');
                        return;
                    }

                    console.log('Obteniendo horarios para:', fecha);

                    fetch('SvMostrarHorarios?fecha=' + fecha)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error en la respuesta del servidor: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Datos recibidos:', data);
                                if (data) {
                                    $('#hora-apertura').val(data.horaApertura || '---');
                                    $('#hora-cierre').val(data.horaCierre || '---');
                                } else {
                                    $('#hora-apertura').val('---');
                                    $('#hora-cierre').val('---');
                                }
                            })
                            .catch(error => console.error('Error:', error));
                }

                // Función para actualizar estado de día (bloquear o desbloquear)
                function actualizarEstadoDia(bloquear) {
                    var fechaSeleccionada = fechaSeleccionadaInput.val();
                    if (fechaSeleccionada) {
                        fetch('SvActualizarHorarios', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: `fecha=${fechaSeleccionada}&bloquear=${bloquear}`
                        })
                                .then(response => response.json())
                                .then(data => {
                                    if (data) {
                                        location.reload();
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                    } else {
                        alert('Por favor, seleccione una fecha primero.');
                    }
                }
                // Obtener fechas bloqueadas y configurar el datepicker
                $.ajax({
                    url: 'pruebasCalendarios',
                    method: 'GET',
                    success: function (response) {
                        console.log("Raw response from server:", response);

                        var blockedDates;

                        // Manejamos la respuesta según el tipo
                        if (Array.isArray(response)) {
                            blockedDates = response;
                        } else {
                            // Si no es un array, asumimos que es un objeto con las fechas bloqueadas
                            blockedDates = response.dates;  // Ajusta esto según la estructura de tu JSON
                        }

                        // Inicializar el datepicker con fechas bloqueadas
                        $("#datepicker").datepicker({
                            dateFormat: 'yy-mm-dd',
                            beforeShowDay: function (date) {
                                var string = $.datepicker.formatDate('yy-mm-dd', date);
                                if (blockedDates.indexOf(string) !== -1) {
                                    return [true, 'blocked-date', 'Fecha Bloqueada'];
                                } else {
                                    return [true, '', ''];
                                }
                            },
                            onSelect: function (dateText) {
                                $('#fechaSeleccionada').val(dateText);
                                obtenerHorarios(dateText);
                            }
                        });

                    },
                    error: function (xhr, status, error) {
                        console.error("Error al hacer la petición AJAX:", status, error);
                        alert("Error al cargar las fechas bloqueadas.");
                    }
                });

                // Evento click para bloquear
                $('#bloquear').click(function () {
                    actualizarEstadoDia(true);
                });

                // Evento click para desbloquear
                $('#desbloquear').click(function () {
                    actualizarEstadoDia(false);
                });
            });

        </script>
    </body>
</html>
