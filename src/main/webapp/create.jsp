<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Proveedor</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet">
    <link rel="icon" href="icon/icon.ico" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #1f2937;
            color: #ffffff;
        }
        .form-container {
            background-color: #2c2f33;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        input, select {
            background-color: transparent;
            color: #ffffff;
        }
        input::placeholder, select::placeholder {
            color: #a1a1a1;
        }
        select {
            border: 2px solid #4b5563;
        }
    </style>
</head>
<body>
<form id="supplierForm" class="form-container max-w-md mx-auto" action="suppliers" method="post">
    <input type="hidden" name="action" value="create" />
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="names" id="nombre" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="nombre" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nombre</label>
    </div>
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="addres" id="direccion" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="direccion" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Dirección</label>
    </div>
    <div class="relative z-0 w-full mb-5 group">
        <label for="ciudad" class="block mb-2 text-sm font-medium text-gray-400">Ciudad</label>
        <select id="ciudad" name="city" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
            <option value="">Selecciona una ciudad</option>
            <option value="Lima">Lima</option>
            <option value="Cusco">Cusco</option>
            <option value="Arequipa">Arequipa</option>
            <option value="Trujillo">Trujillo</option>
        </select>
    </div>
    <div class="grid md:grid-cols-2 md:gap-6">
        <div class="relative z-0 w-full mb-5 group">
            <input type="tel" name="phone_number" id="telefono" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
            <label for="telefono" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de teléfono</label>
        </div>
        <div class="relative z-0 w-full mb-5 group">
            <input type="text" name="whatsapp_number" id="whatsapp" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
            <label for="whatsapp" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de WhatsApp</label>
        </div>
    </div>
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="reference_number" id="referencia" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="referencia" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de Referencia</label>
    </div>
    <div class="relative z-0 w-full mb-5 group">
        <input type="email" name="email" id="email" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="email" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Correo Electrónico</label>
    </div>
    <div class="relative z-0 w-full mb-5 group">
        <label for="admin" class="block mb-2 text-sm font-medium text-gray-400">Administrador</label>
        <select id="admin" name="admin_id" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
            <option value="">Selecciona un Administrador Para el Proveedor</option>
            <option value="1">amir</option>
            <option value="2">juan</option>
            <option value="3">henry</option>
        </select>
    </div>
    <div class="card-footer flex justify-center space-x-4 mt-4">
        <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center" onclick="return confirmRegistration(event)">Registrar Proveedor</button>
        <a href="suppliers" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5">Volver</a>
    </div>
</form>

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

    function confirmRegistration(event) {
        event.preventDefault();

        if (validateForm()) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "¿Deseas registrar este proveedor?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, registrar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('supplierForm').submit();
                }
            });
        }
    }
</script>
</body>
</html>