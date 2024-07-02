<%@ include file="/verificarSesion.jsp" %>

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
                background-color: #00b3b3;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                max-width: 1200px;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding-bottom: 10px;
                flex-wrap: wrap;
            }


            .header.logo img {
                height: 80px;
            }
            .header .user-menu {
                display: flex;
                align-items: center;
                margin-left: auto;
                position: relative;
            }

            .header .user-icon {
                height: 60px;
                cursor: pointer;
                margin-right: 20px; /* Añade un margen derecho para moverla a la izquierda */
                position: relative; /* Asegúrate de que la posición es relativa si vas a usar 'left' */
                left: -20px; /* Ajusta este valor para mover la imagen más a la izquierda */

            }

            .dropdown-menu {
                display: none;
                position: absolute;
                top: 50px;
                right: 5px;
                background-color: white;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 200px; /* Ajusta el ancho según sea necesario */
            }

            .dropdown-menu a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #000;
            }

            .dropdown-menu.show {
                display: block;
            }

            .content {
                display: flex;
                padding: 20px;
                margin-top: 20px;
            }
            .form-container {
                flex: 1;
                margin-right: 20px;
            }
            .form-group {
                margin-bottom: 11px;
            }
            .form-group label {
                display: block;
                font-weight: bold;
                margin-top: 12px;
                margin-bottom: 12px;
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
            .fecha-seleccionada {
                font-weight: bold; /* Hace que el texto sea negrita */
                font-size: 16px; /* Ajusta el tamaño de la fuente */
                margin-top: 12px; /* Añade margen superior */
                margin-bottom: 12px;
                padding: 5px; /* Añade padding */
            }
            #agendarCitaForm input[type="text"] {
                width: 50%;
                padding: 8px;
                font-size: 14px;
                border: 1px solid #ddd;
                border-radius: 3px;
                box-sizing: border-box;
                margin-top: 12px;
                margin-bottom: 12px;
            }
            #agendarCitaForm button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s;
            }
            #agendarCitaForm button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="logo">
                    <%                        String principalPage = "login.jsp"; // Default fallback in case session or user is not found
                        if (session != null && session.getAttribute("usuario") != null) {
                            String userRole = usuario.getRol();

                            if ("Administrador".equals(userRole)) {
                                principalPage = "admin/PrincipaAdmin.jsp";
                            } else if ("Asistente".equals(userRole)) {
                                principalPage = "asistentes/PrincipalAsistente.jsp";
                            } else if ("Cliente".equals(userRole)) {
                                principalPage = "clientes/InicioClientes.jsp";
                            } else {
                                principalPage = "index.jsp";
                            }
                        }
                    %>
                    <a href="${pageContext.request.contextPath}/<%= principalPage%>">
                        <img src="${pageContext.request.contextPath}/imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                <div class="user-menu">
                    <img src="${pageContext.request.contextPath}/imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="${pageContext.request.contextPath}/SvCerrarSesion">Cerrar sesión</a>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="form-container">
                    <h2>Agendar Citas</h2>
                    <div class="form-group">
                        <label for="nombreCompleto">Nombre completo:</label>
                        <input type="text" id="nombreCompleto" name="nombreCompleto" value="${sessionScope.nombreCompleto}" readonly>
                    </div>
                    <!-- Agrega más campos del formulario de acuerdo a tus necesidades -->

                    <form id="agendarCitaForm">
                        <input type="text" id="nombreCompleto" name="nombreCompleto" value="${sessionScope.nombreCompleto}" readonly>
                        <!-- Otros campos de formulario -->
                        <button type="button" onclick="buscarCliente()">Buscar Cliente</button>
                    </form>

                    <form id="guardarCitaForm" action="SvAgendarCita"  method="POST">
                        <div class="form-group">
                            <label for="hora">Hora:</label>
                            <select id="hora" name="hora" required>
                            </select>
                            <label for="idCliente">Cliente:</label>
                            <input type="text" id="idCli" name="idCli" readonly>

                            <p class="fecha-seleccionada">Fecha seleccionada: <input type="text" id="fechaSeleccionada" name="fechaSeleccionada" readonly></p>
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
                                                var inputIdCliente = document.getElementById("idCli");
                                                inputIdCliente.value = data.idCliente;
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

                                            var selectHora = $('#hora');
                                            selectHora.empty();
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

                                        if (Array.isArray(response)) {
                                            blockedDates = response;
                                        } else {
                                            blockedDates = response.dates;
                                        }

                                        $("#datepicker").datepicker({
                                            dateFormat: 'yy-mm-dd',
                                            beforeShowDay: function (date) {
                                                var string = $.datepicker.formatDate('yy-mm-dd', date);
                                                if (blockedDates.indexOf(string) !== -1) {
                                                    return [false, 'blocked-date', 'Fecha Bloqueada'];
                                                } else if (date < hoy || date > maxDate) {
                                                    return [false, 'unselectable-date', 'Fecha no disponible'];
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
        <script >
            document.addEventListener('DOMContentLoaded', function () {
                var userIcon = document.querySelector(".user-icon");
                var dropdownMenu = document.getElementById("dropdownMenu");
                userIcon.addEventListener("click", function () {
                    dropdownMenu.classList.toggle("show");
                });
            });
        </script>
    </body>
</html>
