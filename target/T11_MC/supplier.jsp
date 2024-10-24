<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="dark">
<head>
    <title>Lista de Proveedores</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="icon" href="icon/icon.ico" type="image/x-icon">
    <script src="scripts/supplier.js"></script>
    <style>
        tbody tr:nth-child(even) {
            background-color: #2D3748;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 50;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            animation: fadeIn 0.3s;
        }
        .modal-content {
            background-color: #1A202C;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            transform: translateY(-50px);
            opacity: 0;
            animation: slideIn 0.3s forwards;
        }
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 30px #1A202C inset !important;
            box-shadow: 0 0 0 30px #1A202C inset !important;
            -webkit-text-fill-color: #fff !important;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .modal-close {
            animation: fadeOut 0.3s forwards;
        }
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>
<body class="bg-gray-900 text-white">
<div class="container p-4">
    <h4 class="text-4xl font-bold text-center mb-6">Lista de Proveedores</h4>
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
                    <c:forEach var="supplier" items="${suppliers}">
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
                                <a href="editarProveedor?id=${supplier.supplier_id}" class="font-medium text-blue-400 hover:underline flex items-center">Actualizar</a>
                                <form id="delete-form-${supplier.supplier_id}" action="suppliers" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="${supplier.supplier_id}">
                                    <input type="hidden" name="action" value="delete">
                                    <button type="button" class="font-medium text-red-400 hover:underline flex items-center" onclick="confirmDelete(${supplier.supplier_id})">Eliminar</button>
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
        <button id="openModal" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">
            Crear Nuevo Proveedor
        </button>
        <a href="index.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
            Regresar al Inicio
        </a>
        <a href="inactiveSuppliers" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">
            Ver Proveedores Eliminados
        </a>
    </div>
</div>

<div id="supplierModal" class="modal">
    <div class="modal-content">
        <h2 class="text-xl font-bold text-center mb-4">Registrar Proveedor</h2>
        <form id="supplierForm" action="suppliers" method="post" onsubmit="return validateForm() && confirmRegistration(event)" class="max-w-md mx-auto">
            <input type="hidden" name="action" value="create" />
            <div class="relative z-0 w-full mb-5 group">
                <input type="text" name="names" id="nombre" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                <label for="nombre" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nombre</label>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <input type="text" name="addres" id="direccion" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                <label for="direccion" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Dirección</label>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <label for="ciudad" class="block mb-2 text-sm font-medium text-gray-400">Ciudad</label>
                <select id="ciudad" name="city" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    <option value="">Selecciona una ciudad</option>
                    <option value="Lima">Lima</option>
                    <option value="Cusco">Cusco</option>
                    <option value="Arequipa">Arequipa</option>
                    <option value="Trujillo">Trujillo</option>
                </select>
            </div>
            <div class="grid md:grid-cols-2 md:gap-6">
                <div class="relative z-0 w-full mb-5 group">
                    <input type="tel" name="phone_number" id="telefono" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                    <label for="telefono" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de teléfono</label>
                </div>
                <div class="relative z-0 w-full mb-5 group">
                    <input type="text" name="whatsapp_number" id="whatsapp" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                    <label for="whatsapp" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de WhatsApp</label>
                </div>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <input type="text" name="reference_number" id="referencia" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                <label for="referencia" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de referencia</label>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <input type="email" name="email" id="email" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                <label for="email" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Correo</label>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <label for="admin" class="block mb-2 text-sm font-medium text-gray-400">Administrador</label>
                <select id="admin" name="admin_id" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    <option value="">Selecciona un Administrador Para el Proveedor</option>
                    <option value="1">amir</option>
                    <option value="2">juan</option>
                    <option value="3">henry</option>
                </select>
            </div>
            <div class="flex justify-center space-x-4 mt-4">
                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5">Registrar Proveedor</button>
                <button type="button" class="text-red-500 hover:text-red-700" id="closeModal">Cancelar</button>
            </div>
        </form>
    </div>
</div>
    <script src="scripts/supplier.js"></script>
<script>
    function validateForm() {
        const address = document.getElementById('direccion').value.trim();
        const names = document.getElementById('nombre').value.trim();
        const city = document.getElementById('ciudad').value.trim();
        const phoneNumber = document.getElementById('telefono').value.trim();
        const whatsappNumber = document.getElementById('whatsapp').value.trim();
        const referenceNumber = document.getElementById('referencia').value.trim();
        const email = document.getElementById('email').value.trim();

        // Validar dirección
        if (!address || address.includes('  ') || /[^A-Za-z0-9 .,]/.test(address)) {
            Swal.fire('Error', 'La dirección no puede tener espacios consecutivos ni caracteres no permitidos.', 'error');
            return false;
        }

        // Validar nombres
        if (!names || names.includes('  ') || /[^A-Za-z0-9 .'\-]/.test(names)) {
            Swal.fire('Error', 'El nombre no puede tener espacios consecutivos ni caracteres no permitidos.', 'error');
            return false;
        }

        // Validar ciudad
        if (!city) {
            Swal.fire('Error', 'Por favor selecciona una ciudad.', 'error');
            return false;
        }

        // Validar número de teléfono
        if (!/^\d{9}$/.test(phoneNumber)) {
            Swal.fire('Error', 'El número de teléfono debe tener 9 dígitos.', 'error');
            return false;
        }

        // Validar número de WhatsApp
        if (!/^\d{9}$/.test(whatsappNumber)) {
            Swal.fire('Error', 'El número de WhatsApp debe tener 9 dígitos.', 'error');
            return false;
        }

        // Validar número de referencia
        if (!/^\d{9}$/.test(referenceNumber)) {
            Swal.fire('Error', 'El número de referencia debe tener 9 dígitos.', 'error');
            return false;
        }

        // Validar formato de correo electrónico
        if (!/^[^ ]+@[^ ]+\.[^ ]+$/.test(email)) {
            Swal.fire('Error', 'El correo electrónico no tiene un formato válido.', 'error');
            return false;
        }
        return true;
    }
</script>
</body>
</html>
