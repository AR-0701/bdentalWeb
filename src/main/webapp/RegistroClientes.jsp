<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Clientes</title>
    <link rel="stylesheet" href="Admi1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        function validarEdad() {
            const birthdate = document.getElementById('birthdate').value;
            const birthdateDate = new Date(birthdate);
            const today = new Date();
            const age = today.getFullYear() - birthdateDate.getFullYear();
            const monthDiff = today.getMonth() - birthdateDate.getMonth();
            const dayDiff = today.getDate() - birthdateDate.getDate();

            if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
                age--;
            }

            if (age < 18) {
                document.getElementById('birthdateError').textContent = 'Debe ser mayor de 18 años para registrarse.';
                return false;
            } else {
                document.getElementById('birthdateError').textContent = '';
                return true;
            }
        }

        function validarContraseñas() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                document.getElementById('passwordError').textContent = 'Las contraseñas no coinciden.';
                return false;
            } else {
                document.getElementById('passwordError').textContent = '';
                return true;
            }
        }

        function validarFormulario() {
            return validarEdad() && validarContraseñas();
        }

        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('birthdate').addEventListener('change', validarEdad);
            document.getElementById('password').addEventListener('input', validarContraseñas);
            document.getElementById('confirmPassword').addEventListener('input', validarContraseñas);
        });
    </script>
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
                    <div class="Titulo modify-title"><h1>Registrar Clientes</h1></div>
                </div>
            </div>
            
            <!-- Mostrar mensaje de error si existe -->
            <% String errorMessage = (String) request.getAttribute("errorMessage"); if (errorMessage != null) { %>
            <div style="color: red; text-align: center; margin-bottom: 10px;">
                <%= errorMessage %>
            </div>
            <% } %>
            
            <form id="registrationForm" action="SvClientes" method="POST" onsubmit="return validarFormulario()">
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
                        </div>
                        <div class="form-group">
                            <i class="fa-solid fa-lock" style="color: #00b3b3; font-size: 30px;"></i>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar Contraseña" required>
                        </div>
                        <div id="passwordError" style="color: red; text-align: center; margin-bottom: 10px;"></div>
                        <div class="form-group">
                            <i class="fa-solid fa-phone" style="color: #00b3b3; font-size: 30px;"></i>
                            <input type="tel" id="phone" name="phone" placeholder="Teléfono" required>
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
                        </div>
                        <div id="birthdateError" style="color: red; text-align: center; margin-bottom: 10px;"></div>
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
            const togglePassword = document.querySelector('.toggle-password');
            const passwordInput = document.getElementById('password');
            if (togglePassword) {
                togglePassword.addEventListener('click', function () {
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);
                    this.classList.toggle('fa-eye-slash');
                });
            }
        });
    </script>
</body>
</html>
