<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Estilos para el menú */
        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 17px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="index.jsp" class="active">Inicio</a>
    <a href="product">Productos</a>
    <a href="clients">Clientes</a>
    <a href="suppliers">Proveedores</a>
    <a href="category">Categorías</a>
    <a href="admin">Administración</a>
</div>
</body>
</html>
