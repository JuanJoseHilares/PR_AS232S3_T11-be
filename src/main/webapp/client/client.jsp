<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %> <!-- Incluimos el menú de navegación -->
<html class="dark">
<head>
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="icon" href="icon/icon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        tbody tr:nth-child(even) {
            background-color: #2D3748;
        }
        .action-icons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .action-icons a {
            color: inherit;
            text-decoration: none;
        }
        .action-icons a:hover {
            color: #3085d6;
        }
        .inactive-client {
            display: none; /* Ocultar inicialmente los clientes inactivos */
        }
        .hidden-message {
            display: none;
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body class="bg-gray-900 text-white">
<div class="container p-4">
    <div class="flex justify-between items-center mb-6">
        <h4 class="text-4xl font-bold">Lista de Clientes</h4>

        <!-- Buscador para filtrar clientes -->
        <input type="text" id="searchInput" placeholder="Buscar cliente..." class="text-gray-900 p-2 rounded-md border-2 border-gray-400 focus:border-blue-600">

        <!-- Botón para alternar clientes activos/inactivos y crear nuevo cliente -->
        <div class="flex space-x-4">
            <button id="toggleInactive" class="bg-blue-700 text-white px-4 py-2 rounded-lg hover:bg-blue-800">
                Mostrar Clientes Inactivos
            </button>
            <a href="form.jsp" class="bg-green-700 text-white px-4 py-2 rounded-lg hover:bg-green-800">Crear Nuevo Cliente</a>
        </div>
    </div>

    <!-- Mensaje en caso de no encontrar registros -->
    <div id="noResultsMessage" class="hidden-message">No se encontraron registros.</div>

    <div class="card bg-gray-800">
        <div class="card-body">
            <div class="relative shadow-md sm:rounded-lg">
                <table id="clientTable" class="w-full text-sm text-left text-gray-400 dark:text-gray-400 table-fixed">
                    <thead class="text-xs text-gray-300 uppercase bg-gray-700">
                    <tr>
                        <th scope="col" class="px-6 py-3">ID</th>
                        <th scope="col" class="px-6 py-3">Apellido Paterno</th>
                        <th scope="col" class="px-6 py-3">Apellido Materno</th>
                        <th scope="col" class="px-6 py-3">Nombres</th>
                        <th scope="col" class="px-6 py-3">Sexo</th>
                        <th scope="col" class="px-6 py-3">Tipo de Documento</th>
                        <th scope="col" class="px-6 py-3">Número de Documento</th>
                        <th scope="col" class="px-6 py-3">Fecha de Nacimiento</th>
                        <th scope="col" class="px-6 py-3">Teléfono</th>
                        <th scope="col" class="px-6 py-3">WhatsApp</th>
                        <th scope="col" class="px-6 py-3">Referencia</th>
                        <th scope="col" class="px-6 py-3">Correo</th>
                        <th scope="col" class="px-6 py-3">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="client" items="${clients}">
                        <tr class="border-b border-gray-700 client-row ${client.states == 'I' ? 'inactive-client' : ''}">
                            <td class="px-6 py-4 text-center">${client.client_id}</td>
                            <td class="px-6 py-4">${client.paternal_surname}</td>
                            <td class="px-6 py-4">${client.maternal_surname}</td>
                            <td class="px-6 py-4">${client.names}</td>
                            <td class="px-6 py-4">${client.sex}</td>
                            <td class="px-6 py-4">${client.document_type}</td>
                            <td class="px-6 py-4">${client.document_number}</td>
                            <td class="px-6 py-4">${client.birth_date}</td>
                            <td class="px-6 py-4">${client.phone_number}</td>
                            <td class="px-6 py-4">${client.whatsapp_number}</td>
                            <td class="px-6 py-4">${client.reference_number}</td>
                            <td class="px-6 py-4 truncate">${client.email}</td>
                            <td class="px-6 py-4 text-center">
                                <div class="action-icons">
                                    <c:choose>
                                        <c:when test="${client.states == 'I'}">
                                            <form id="reactivate-form-${client.client_id}" action="clients" method="post" style="display: inline;">
                                                <input type="hidden" name="id" value="${client.client_id}">
                                                <input type="hidden" name="action" value="reactivate">
                                                <a href="javascript:void(0);" onclick="confirmReactivation(${client.client_id})" title="Reactivar" style="color: #28a745;">
                                                    <i class="fas fa-undo-alt"></i>
                                                </a>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="editarCliente?id=${client.client_id}" title="Actualizar" style="color: #1e90ff;">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form id="delete-form-${client.client_id}" action="clients" method="post" style="display: inline;">
                                                <input type="hidden" name="id" value="${client.client_id}">
                                                <input type="hidden" name="action" value="delete">
                                                <a href="javascript:void(0);" onclick="confirmDelete(${client.client_id})" title="Eliminar" style="color: #ff4d4d;">
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Función para alternar la visibilidad de los clientes inactivos
    document.getElementById('toggleInactive').addEventListener('click', function(e) {
        e.preventDefault();
        const inactiveRows = document.querySelectorAll('.inactive-client');
        const toggleButton = this;

        inactiveRows.forEach(row => {
            if (row.style.display === 'none' || row.style.display === '') {
                row.style.display = 'table-row';
                toggleButton.textContent = 'Listar Activos';
            } else {
                row.style.display = 'none';
                toggleButton.textContent = 'Listar Inactivos';
            }
        });
    });

    // Función para filtrar los clientes por nombre o apellido
    document.getElementById('searchInput').addEventListener('keyup', function() {
        const searchValue = this.value.toLowerCase();
        const rows = document.querySelectorAll('.client-row');
        let found = false;

        rows.forEach(row => {
            const clientData = row.innerText.toLowerCase();
            if (clientData.includes(searchValue)) {
                row.style.display = '';
                found = true;
            } else {
                row.style.display = 'none';
            }
        });

        document.getElementById('noResultsMessage').style.display = found ? 'none' : 'block';
    });

    function confirmReactivation(id) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "El cliente será reactivado",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, reactivar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('reactivate-form-' + id).submit();
            }
        });
    }
</script>
</body>
</html>
