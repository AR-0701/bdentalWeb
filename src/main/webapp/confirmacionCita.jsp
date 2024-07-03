<%@ page import="logica.usuarios" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Confirmaci�n de Cita</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .confirmation-message {
                background-color: #dff0d8;
                color: #3c763d;
                padding: 20px;
                border: 1px solid #d6e9c6;
                border-radius: 4px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="confirmation-message" id="confirmationMessage">
            �Cita agendada exitosamente!
        </div>
        <script>
            // Mostrar el mensaje de confirmaci�n si el par�metro success est� presente en la URL
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('success')) {
                document.getElementById('confirmationMessage').style.display = 'none';
            } else {
                // Obtener el rol del usuario desde la sesi�n
                const userRole = '<%= (session.getAttribute("usuario") != null) ? ((usuarios) session.getAttribute("usuario")).getRol() : "none"%>';

                // Determinar la p�gina de redirecci�n seg�n el rol del usuario
                let principalPage = "login.jsp"; // Default fallback in case session or user is not found
                if (userRole === "Administrador") {
                    principalPage = "admin/PrincipalAdmin.jsp";
                } else if (userRole === "Asistente") {
                    principalPage = "asistentes/PrincipalAsistente.jsp";
                } else if (userRole === "Cliente") {
                    principalPage = "clientes/InicioClientes.jsp";
                } else {
                    principalPage = "index.jsp";
                }

                // Redirigir a la p�gina principal seg�n el rol del usuario despu�s de 5 segundos
                setTimeout(() => {
                    window.location.href = principalPage;
                }, 10000);
            }
        </script>
    </body>
</html>
