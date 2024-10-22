<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Cliente</title>
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
<form id="clientForm" class="form-container max-w-md mx-auto" action="clients" method="post">
    <input type="hidden" name="action" value="create" />

    <!-- Apellido Paterno -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="paternal_surname" id="paternal_surname" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="30" required />
        <label for="paternal_surname" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Apellido Paterno</label>
    </div>

    <!-- Apellido Materno -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="maternal_surname" id="maternal_surname" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="30" required />
        <label for="maternal_surname" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Apellido Materno</label>
    </div>

    <!-- Nombres -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="names" id="names" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="60" required />
        <label for="names" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nombres</label>
    </div>

    <!-- Sexo -->
    <div class="relative z-0 w-full mb-5 group">
        <label for="sex" class="block mb-2 text-sm font-medium text-gray-400">Sexo</label>
        <select id="sex" name="sex" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
            <option value="">Selecciona el sexo</option>
            <option value="M">Masculino</option>
            <option value="F">Femenino</option>
        </select>
    </div>

    <!-- Tipo de Documento -->
    <div class="relative z-0 w-full mb-5 group">
        <label for="document_type" class="block mb-2 text-sm font-medium text-gray-400">Tipo de Documento</label>
        <select id="document_type" name="document_type" class="bg-gray-700 border border-gray-600 text-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
            <option value="">Selecciona tipo de documento</option>
            <option value="DNI">DNI</option>
            <option value="CNE">CNE</option>
        </select>
    </div>

    <!-- Número de Documento -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="text" name="document_number" id="document_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="12" required />
        <label for="document_number" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de Documento</label>
    </div>

    <!-- Fecha de Nacimiento -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="date" name="birth_date" id="birth_date" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="birth_date" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Fecha de Nacimiento</label>
    </div>

    <!-- Teléfono -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="tel" name="phone_number" id="phone_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="9" pattern="[0-9]{9}" />
        <label for="phone_number" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Teléfono</label>
    </div>

    <!-- WhatsApp -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="tel" name="whatsapp_number" id="whatsapp_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="9" pattern="[0-9]{9}" required />
        <label for="whatsapp_number" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">WhatsApp</label>
    </div>

    <!-- Número de Referencia -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="tel" name="reference_number" id="reference_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="9" pattern="[0-9]{9}" />
        <label for="reference_number" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Número de Referencia</label>
    </div>

    <!-- Email -->
    <div class="relative z-0 w-full mb-5 group">
        <input type="email" name="email" id="email" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " maxlength="90" required />
        <label for="email" class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Correo Electrónico</label>
    </div>

    <div class="card-footer flex justify-center space-x-4 mt-4">
        <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center" onclick="return confirmRegistration(event)">Registrar Cliente</button>
        <a href="clients" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5">Volver</a>
    </div>
</form>

<script>
    function confirmRegistration(event) {
        event.preventDefault();

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¿Deseas registrar este cliente?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, registrar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('clientForm').submit();
            }
        });
    }
</script>
</body>
</html>
