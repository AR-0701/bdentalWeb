
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>B - DENTAL - Principal</title>
        <link rel="stylesheet" href="inicio.css">
    </head>
    <body class="login-page">
        <div class="containe3r">
            <!-- Flecha de regreso -->
            <div class="back-arrow">
                <a href="index.jsp">
                    <img src="imagenes/flecha.svg" alt="Regresar">
                </a>
            </div>
            <!-- Sección de Login -->
            <div class="login-wrapper">
                <div class="image-container">
                    <img src="imagenes/login.png" alt="Imagen Dental">
                </div>
                <div class="form-container">
                    <header>
                        <div class="logo2">
                            <a href="index.jsp">
                                <img src="imagenes/logo.png" class="logo" alt="B - DENTAL">
                            </a>
                        </div>
                    </header>
                       <!-- Mostrar mensaje de error si existe -->
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                        <div style="color: red; text-align: center; margin-bottom: 10px;">
                            <%= errorMessage %>
                        </div>
                    <%
                        }
                    %>
                    <form action="SvLogin" method="POST">
                        <input type="email" placeholder="Correo Electronico" name="email" required>
                        <input type="password" placeholder="Contraseña" name="password" required>
                        <button type="submit">Iniciar Sesión</button>
                    </form> 
                   
                     <a href = "RegistroClientes.jsp">
                        <button id="registro-button" name="registro-button"  >Registrarse</button>
                    </a>
             
                </div>
            </div>
        </div>
    </body>
</html>

