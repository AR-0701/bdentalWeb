<%@page import="codigo.citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="citas_clientes1.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="principal">
            <div class="cabesera">
                <div class="p1"><%--imagen con la letra--%>
                    <img src="imagenes\logo.png">
                    <p>B - Dental</p>
                </div><%--imagen con la letra--%>
                <div class="p2">
                    <img src="imagenes\cerrarsesion.png">
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="inicioclientes.jsp">Principal</a></li>
                    <li><a href="ClienteCasos.jsp">Casos clinicos</a></li>
                    <li><a href="PromocionCliente.jsp">Promociones</a></li>
                    <li><a href="ClienteServicios.jsp">Servicios</a></li>
                    <li><a href="citas_clientes.jsp">Agendar citas</a></li>
                </ul>
            </div>
                <div class="contenido_principal">
                    <div class="izquierda">
                        <div class="texto">
                            <h1>¡ Bienvenido !</h1>
                            <h3>A B - DENTAL</h3>
                            <p>“Sonríe con confianza, cuidamos</p>
                            <p>de tu salud dental.” Agenda tu cita</p>
                            <p>en nuestro consultorio dental.</p>
                        </div>
                        <div class="botones">
                            
                                <div class="boton">
                                    <a href="citas_1.jsp">
                                        <input type="submit" value="Agendar">
                                    </a>
                                </div>
                                <div class="boton">
                                    <a href="consultar_cita_clientes.jsp">
                                        <input type="submit" value="Consultar">
                                    </a>
                                </div>
                        </div>
                    </div>

                    <div class="derecha">
                        <img src="imagenes/brayan.png" class="logo" alt="B - DENTAL">
                    </div>
                </div>
        </div>
    </body>
</html>
