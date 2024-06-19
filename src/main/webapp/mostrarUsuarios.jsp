<%-- 
    Document   : mostrarUsuarios
    Created on : 12/05/2024, 09:44:50 PM
    Author     : wendy
--%>

<%@page import="paquete2.usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Usuarios</title>
    </head>
    <body>
        <h1>Lista de usuarios registrados</h1>
        <%
            List<usuario> ListaUsuarios = (List) request.getSession().getAttribute("ListaUsuarios");
            int cont = 1;
            for (usuario usu : ListaUsuarios) {
        %>
        <p><b>Usuario N<%=cont%></b></p>
        <p>Dni:<%= usu.getDni()%></p>
        <p>Nombre:<%= usu.getNombre()%></p>
        <p>Apellido:<%= usu.getApellido()%></p>
        <p>Telefono:<%= usu.getTelefono()%></p>
        <p>-----------------------------------</p>
        <%cont = cont + 1;%>
        <%
            }
        %>
    </body>
</html>
