<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/verificarSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar Asistentes</title>
        <link rel="stylesheet" href="Admi1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipalAdmin.jsp">
                        <img src="imagenes/loogo.png" alt="B - DENTAL">
                    </a>
                </div>
            </header>
            <main class="main">
                <div class="about">
                    <div class="text-content">
                        <div class="Titulo modify-title"><h1>Registrar Asistentes</h1></div>
                    </div>
                </div>
                <!-- Mostrar mensaje de error si existe -->
                <%                String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <div style="color: red; text-align: center; margin-bottom: 10px;">
                    <%= errorMessage%>
                </div>
                <%
                    }
                %>
                <form id="registrationForm" action="SvAsistentes" method="POST">
                    <div class="form-container">
                        <!-- Lado izquierdo -->
                        <div class="form-left">
                            <div class="form-group">
                                <i class="fa-solid fa-envelope" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="email" id="email" name="email" placeholder="Correo Electrónico" required>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-lock" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                                <div id="passwordError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-lock" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar Contraseña" required>
                                <div id="confirmPasswordError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-phone" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="tel" id="phone" name="phone" placeholder="Teléfono" required>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-palette" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="color" id="colorPicker" name="color" required>
                            </div>
                        </div>
                        <!-- Lado derecho -->
                        <div class="form-right">
                            <div class="form-group">
                                <i class="fa-solid fa-user" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="text" id="firstName" name="firstName" placeholder="Nombre" required>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-user" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="text" id="lastName" name="lastName" placeholder="Apellido Paterno" required>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-user" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="text" id="motherLastName" name="motherLastName" placeholder="Apellido Materno" required>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-venus-mars" style="color: #00b3b3; font-size: 30px;"></i>
                                <select id="gender" name="gender" required>
                                    <option value="">Selecciona</option>
                                    <option value="male">Masculino</option>
                                    <option value="female">Femenino</option>
                                    <option value="other">Otro</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-cake-candles" style="color: #00b3b3; font-size: 30px;"></i>
                                <input type="date" id="birthdate" name="birthdate" required>
                                <div id="birthdateError" class="error-message"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Button modify -->
                    <div class="button-modify">
                        <button id="Registrar" type="submit">Registrar</button>
                    </div>
                </form>
            </main>
            <footer>
                <!-- Footer content -->
            </footer>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const passwordInput = document.getElementById('password');
                const confirmPasswordInput = document.getElementById('confirmPassword');
                const birthdateInput = document.getElementById('birthdate');
                const registrationForm = document.getElementById('registrationForm');
                const passwordError = document.getElementById('passwordError');
                const confirmPasswordError = document.getElementById('confirmPasswordError');
                const birthdateError = document.getElementById('birthdateError');
                const ageLimit = 18;

                function validatePassword() {
                    if (passwordInput.value !== confirmPasswordInput.value) {
                        confirmPasswordError.textContent = "Las contraseñas no coinciden.";
                    } else {
                        confirmPasswordError.textContent = '';
                    }
                }

                function validateAge() {
                    const birthdate = new Date(birthdateInput.value);
                    const today = new Date();
                    let age = today.getFullYear() - birthdate.getFullYear();
                    const monthDifference = today.getMonth() - birthdate.getMonth();
                    if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthdate.getDate())) {
                        age--;
                    }
                    if (age < ageLimit) {
                        birthdateError.textContent = "Debes ser mayor de 18 años.";
                    } else {
                        birthdateError.textContent = '';
                    }
                }

                passwordInput.addEventListener('input', validatePassword);
                confirmPasswordInput.addEventListener('input', validatePassword);
                birthdateInput.addEventListener('input', validateAge);

                registrationForm.addEventListener('submit', function (event) {
                    validatePassword();
                    validateAge();
                    if (!registrationForm.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                });
            });
        </script>
    </body>
</html>
