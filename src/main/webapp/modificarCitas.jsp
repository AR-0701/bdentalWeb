<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Cita</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Estilos personalizados -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
        }
        .header .logo img {
            max-width: 50px;
            margin-right: 10px;
        }
        .header .logout {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s;
        }
        .header .logout:hover {
            color: #f8f9fa;
        }
        .content {
            display: flex;
            padding: 20px;
        }
        .form-container {
            flex: 1;
            margin-right: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], .form-group input[type="email"], .form-group select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
        }
        .button {
            text-align: center;
            margin-top: 20px;
        }
        .button input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .button input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .calendar-container {
            width: 380px;
            justify-content: center;
            align-items: center;
        }
        .blocked-date a, .blocked-date {
            background-color: #D8BFD8 !important; /* Color lila */
            pointer-events: none !important; /* No seleccionable */
            opacity: 1 !important; /* Asegurar que el color sea visible */
        }
        .ui-datepicker-today a {
            background-color: #FFD700 !important; /* Color amarillo más fuerte */
        }
        .ui-datepicker-calendar td a {
            display: block;
            width: 100%;
            height: 100%;
            text-align: center;
            line-height: 2em;
            text-decoration: none;
            color: inherit;
        }
        .ui-datepicker .ui-datepicker-current-day a {
            background-color: #00b3b3 !important; /* Color para la fecha seleccionada */
            color: white !important;
        }
        .unselectable-date a, .unselectable-date {
            background-color: #b2dfdb !important; /* Color para fechas no seleccionables */
            pointer-events: none !important; /* No seleccionable */
            opacity: 1 !important; /* Asegurar que el color sea visible */
        }
        .ui-datepicker-calendar .ui-state-disabled span {
            background-color: transparent !important; /* Asegura que el fondo sea transparente */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="imagenes/logo.png" alt="Logo">
            </div>
            <a class="logout" href="logout.jsp">Cerrar Sesión</a>
        </div>
        <div class="content">
            <div class="form-container">
                <h2>Modificar Citas</h2>

                <form id="agendarCitaForm">
                    <div class="form-group">
                        <label for="nombreCompleto">Nombre Completo:</label>
                        <input type="text" id="nombreCompleto" name="nombreCompleto" value="${sessionScope.nombreCompleto}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="idCliente">Cliente:</label>
                        <input type="text" id="idCliente" name="idCliente" readonly>
                    </div>
                    <div class="form-group">
                        <label for="fechaCita">Fecha de tu cita:</label>
                        <input type="text" id="fechaCita" name="fechaCita" readonly>
                    </div>
                    <button type="button" onclick="buscarCliente()">Buscar Cliente</button>
                </form>

                <form id="modificarCitaForm" action="SvModificarCita" method="POST">
                    <div class="form-group">
                        <label for="hora">Hora:</label>
                        <select id="hora" name="hora" required>
                            <!-- Opciones se añadirán dinámicamente -->
                        </select>
                    </div>
                    <div class="form-group">
                        <p>Fecha seleccionada: <input type="text" id="fechaSeleccionada" name="fechaSeleccionada" readonly></p>
                    </div>
                    <div class="button">
                        <input type="submit" value="Modificar">
                    </div>
                </form>

                <form id="eliminarCitaForm" action="svElliminarCita" method="POST">
                    <div class="button">
                        <input type="submit" value="Eliminar">
                    </div>
                </form>
            </div>
            <div class="calendar-container">
                <div id="datepicker"></div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
        function populateLastAppointmentDate() {
            fetch('SvGetLastAppointment')
                .then(response => response.json())
                .then(data => {
                    if (data.lastAppointmentDate) {
                        document.getElementById('fechaCita').value = data.lastAppointmentDate.split('T')[0];
                    }
                })
                .catch(error => console.error('Error al obtener la fecha de la última cita:', error));
        }

        document.addEventListener('DOMContentLoaded', populateLastAppointmentDate);

        function buscarCliente() {
            var nombreCompleto = document.getElementById("nombreCompleto").value;
            console.log(`Buscando cliente con nombre: ${nombreCompleto}`);
            fetch(`SvBuscarCliente?nombreCompleto=${nombreCompleto}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Datos recibidos:', data);
                    if (data.idCliente) {
                        document.getElementById("idCliente").value = data.idCliente;
                        document.getElementById("idCita").value = data.idCita;
                    } else {
                        alert("Cliente no encontrado");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Ocurrió un error al buscar el cliente");
                });
        }

        $(document).ready(function () {
            var hoy = new Date();
            var maxDate = new Date();
            maxDate.setDate(hoy.getDate() + 7);

            function obtenerHorarios(fecha) {
                if (!fecha) {
                    console.error('Fecha inválida:', fecha);
                    alert('Seleccione una fecha válida.');
                    return;
                }

                console.log('Obteniendo horarios para:', fecha);
                $('#horarios-disponibles').empty();

                $.ajax({
                    url: 'svCalculaHorario',
                    method: 'GET',
                    data: { fecha: fecha },
                    cache: false,
                    success: function (response) {
                        console.log('Datos recibidos:', response);

                        var horarios = Array.isArray(response) ? response : [];

                        var html = '<h2>Horarios Disponibles</h2>';
                        if (horarios.length > 0) {
                            html += '<ul>';
                            horarios.forEach(function (horario) {
                                var horaFormateada = horario.hour + ':' + (horario.minute < 10 ? '0' : '') + horario.minute;
                                html += '<li>' + horaFormateada + '</li>';
                            });
                            html += '</ul>';
                        } else {
                            html += '<p>No hay horarios disponibles para esta fecha.</p>';
                        }

                        $('#horarios-disponibles').html(html);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error:', error);
                        alert('Ocurrió un error al obtener los horarios disponibles.');
                    }
                });
            }

            function customDayRender(date) {
                var day = date.getDate();
                var isSaturday = date.getDay() === 6;
                var isSunday = date.getDay() === 0;

                var dateString = $.datepicker.formatDate('yy-mm-dd', date);
                var isBlocked = unavailableDates.includes(dateString);

                var className = '';

                if (isBlocked) {
                    className = 'blocked-date';
                } else if (isSaturday || isSunday) {
                    className = 'unselectable-date';
                }

                return [!isBlocked && !isSaturday && !isSunday, className];
            }

            $('#datepicker').datepicker({
                minDate: hoy,
                maxDate: maxDate,
                beforeShowDay: customDayRender,
                onSelect: function (dateText) {
                    $('#fechaSeleccionada').val(dateText);
                    obtenerHorarios(dateText);
                }
            });

            var unavailableDates = [];

            function fetchUnavailableDates() {
                $.ajax({
                    url: 'SvGetUnavailableDates',
                    method: 'GET',
                    success: function (response) {
                        console.log('Fechas no disponibles recibidas:', response);

                        if (Array.isArray(response)) {
                            unavailableDates = response;
                        } else {
                            console.error('El formato de las fechas no disponibles es incorrecto:', response);
                        }

                        $('#datepicker').datepicker('refresh');
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al obtener las fechas no disponibles:', error);
                        alert('Ocurrió un error al obtener las fechas no disponibles.');
                    }
                });
            }

            fetchUnavailableDates();
        });
    </script>
</body>
</html>
