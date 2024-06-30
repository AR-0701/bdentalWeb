<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Principal</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
    </head>
    <body class="login-page"> 
        <div class="containe3r">
            <!-- Flecha de regreso -->
            <div class="back-arrow">
                <a href="index.jsp">
                    <img src="${pageContext.request.contextPath}/imagenes/flecha.svg" alt="Regresar">
                </a>
            </div>
            <!-- Sección de Login -->
            <div class="login-wrapper">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/login.png" alt="Imagen Dental">
                </div>
                <div class="form-container">
                    <header>
                        <div class="logo2">
                            <a href="index.jsp">
                                <img src="${pageContext.request.contextPath}/imagenes/logo.png" class="logo" alt="B - DENTAL">
                            </a>
                        </div>
                    </header>
                    <!-- Mostrar mensaje de error si existe -->
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div style="color: red; text-align: center; margin-bottom: 10px;">
                        <%= errorMessage%>
                    </div>
                    <%
                        }
                    %>
                    <form action="${pageContext.request.contextPath}/SvLogin" method="POST">
                        <input type="email" placeholder="Correo Electronico" name="email" required>
                        <input type="password" placeholder="Contraseña" name="password" required>
                        <button type="submit">Iniciar Sesión</button>
                    </form> 

                    <a href = "${pageContext.request.contextPath}/RegistroClientes.jsp">
                        <button id="registro-button" name="registro-button"  >Registrarse</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>

