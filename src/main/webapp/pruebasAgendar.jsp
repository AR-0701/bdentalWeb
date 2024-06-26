<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agendar Citas</title>
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
            .header .logo {
                display: flex;
                align-items: center;
            }
            .header .logo img {
                max-width: 50px;
                margin-right: 10px;
            }
            .header .logo h1 {
                font-size: 1.5rem;
                margin: 0;
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
                width: 300px;
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
                    <img src="imagenes/loogo.png" alt="Logo">
                </div>
                <a class="logout" href="logout.jsp">Cerrar Sesión</a>
            </div>
            <div class="content">
                <div class="form-container">
                    <h2>Agendar Citas</h2>

                    <form id="agendarCitaForm">
                        <input type="text" id="nombreCompleto" name="nombreCompleto" value="${sessionScope.nombreCompleto}" readonly>
                        <!-- Otros campos de formulario -->
                        <button type="button" onclick="buscarCliente()">Buscar Cliente</button>
                    </form>

                    <form action="action">
                        <div class="form-group">
                            <label for="hora">Hora:</label>
                            <select id="hora" name="hora" required>
                            </select>
                            <label for="idCliente">Cliente:</label>
                            <p>ID Cliente:  <input type="text" id="idCliente" name="idCliente" readonly></p>


                            <p>Fecha seleccionada: <input type="text" id="fechaSeleccionada" name="fechaSeleccionada" readonly></p>
                        </div>
                        <div class="button">
                            <input type="submit" value="Agendar Cita">
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
                            function buscarCliente() {
                                var nombreCompleto = document.getElementById("nombreCompleto").value;
                                console.log(`Buscando cliente con nombre: ${nombreCompleto}`); // Añadir mensaje de depuración
                                fetch(`SvBuscarCliente?nombreCompleto=${nombreCompleto}`)
                                        .then(response => {
                                            if (!response.ok) {
                                                throw new Error('Network response was not ok');
                                            }
                                            return response.json();
                                        })
                                        .then(data => {
                                            console.log('Datos recibidos:', data); // Añadir mensaje de depuración
                                            if (data.idCliente) {
                                                var selectCliente = document.getElementById("idCliente");
                                                selectCliente.innerHTML = ''; // Limpiar opciones anteriores
                                                selectCliente.innerHTML = `<option value="${data.idCliente}">${data.nombre} ${data.apellidoPa} ${data.apellidoMa}</option>`;
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
                                var fechaSeleccionadaInput = $('#datepicker');
                                var hoy = new Date();
                                var maxDate = new Date();
                                maxDate.setDate(hoy.getDate() + 7);

                                // Función para obtener horarios
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
                                        data: {fecha: fecha},
                                        cache: false,
                                        success: function (response) {
                                            console.log('Datos recibidos:', response);

                                            // Verificar si la respuesta es un array
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

                                            // Cargar las opciones en el select de horarios
                                            var selectHora = $('#hora');
                                            selectHora.empty(); // Limpiar opciones anteriores
                                            horarios.forEach(function (horario) {
                                                var horaFormateada = horario.hour + ':' + (horario.minute < 10 ? '0' : '') + horario.minute;
                                                selectHora.append('<option value="' + horaFormateada + '">' + horaFormateada + '</option>');
                                            });
                                        },
                                        error: function () {
                                            $('#horarios-disponibles').html('<p>Error al obtener horarios disponibles.</p>');
                                        }
                                    });
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
                                                    return [false, 'blocked-date', 'Fecha Bloqueada']; // Hace la fecha no seleccionable
                                                } else if (date < hoy || date > maxDate) {
                                                    return [false, 'unselectable-date', 'Fecha no disponible']; // Fechas fuera del rango seleccionable
                                                } else {
                                                    return [true, '', ''];
                                                }
                                            },
                                            onSelect: function (dateText) {
                                                $('#fechaSeleccionada').val(dateText);
                                                obtenerHorarios(dateText);
                                            },
                                            prevText: '<',
                                            nextText: '>'
                                        });
                                    },
                                    error: function () {
                                        console.error('Error al obtener fechas bloqueadas.');
                                        alert('Error al obtener fechas bloqueadas.');
                                    }
                                });
                            });
        </script>
    </body>
</html>
