<%@page import="util.Conexion"%>
<%@page import="java.sql.Connection" %>
<%@page import="util.Conexion" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Prueba de conexión</h1>
        <%
            Conexion conexion = new Conexion();
            Connection con = conexion.getConexion();
        %>
        
        <h1>Prueba exitosa !!!!</h1>
        
    </body>
</html>