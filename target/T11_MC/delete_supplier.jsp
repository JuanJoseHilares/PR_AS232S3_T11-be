<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="dark">
<head>
    <title>Proveedores Inactivos</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet">
    <link rel="icon" href="icon/icon.ico" type="image/x-icon">
    <style>
        tbody tr:nth-child(even) {
            background-color: #2D3748;
        }
    </style>
</head>
<body class="bg-gray-900 text-white">
<div class="container p-4">
    <h4 class="text-4xl font-bold text-center mb-6">Lista de Proveedores Inactivos</h4>
    <div class="card bg-gray-800">
        <div class="card-body">
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-400 dark:text-gray-400">
                    <thead class="text-xs text-gray-300 uppercase bg-gray-700">
                    <tr>
                        <th scope="col" class="px-6 py-3">ID</th>
                        <th scope="col" class="px-6 py-3">Nombre</th>
                        <th scope="col" class="px-6 py-3">Dirección</th>
                        <th scope="col" class="px-6 py-3">Ciudad</th>
                        <th scope="col" class="px-6 py-3">Número de Teléfono</th>
                        <th scope="col" class="px-6 py-3">Número de WhatsApp</th>
                        <th scope="col" class="px-6 py-3">Número de Referencia</th>
                        <th scope="col" class="px-6 py-3">Correo</th>
                        <th scope="col" class="px-6 py-3">Administrador</th>
                        <th scope="col" class="px-6 py-3">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="supplier" items="${inactiveSuppliers}">
                        <tr class="border-b border-gray-700">
                            <td class="px-6 py-4 text-center">${supplier.supplier_id}</td>
                            <td class="px-6 py-4">${supplier.names}</td>
                            <td class="px-6 py-4">${supplier.addres}</td>
                            <td class="px-6 py-4">${supplier.city}</td>
                            <td class="px-6 py-4">${supplier.phone_number}</td>
                            <td class="px-6 py-4">${supplier.whatsapp_number}</td>
                            <td class="px-6 py-4">${supplier.reference_number}</td>
                            <td class="px-6 py-4">${supplier.email}</td>
                            <td class="px-6 py-4">${supplier.admin_id}</td>
                            <td class="px-6 py-4 text-center">
                                <form action="suppliers" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="${supplier.supplier_id}">
                                    <input type="hidden" name="action" value="reactivate">
                                    <button type="submit" class="font-medium text-green-400 hover:underline">
                                        Restaurar
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card-footer flex justify-center space-x-4 mt-4">
        <a href="index.jsp" class="text-white bg-blue-700 hover:bg-blue-800 font-medium rounded-lg text-sm px-5 py-2.5">
            Regresar al Inicio
        </a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
</body>
</html>