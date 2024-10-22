<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="dark">
<head>
    <title>Página de Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet">
    <link rel="icon" href="icon/icon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="Style/index.css">
</head>
<body>
<div class="container">
    <div class="card shadow-lg">
        <div class="card-body text-center">
            <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight">Bienvenido a la Gestión de Proveedores</h1>
            <p class="mb-6 text-lg font-normal">¡Haz clic en el botón para acceder a la lista de proveedores!</p>
            <a href="suppliers" class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300">
                Ir a la Lista de Proveedores
                <svg class="w-3.5 h-3.5 ms-2 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                </svg>
            </a>
        </div>
    </div>

    <div id="accordion-collapse" data-accordion="collapse" class="w-full max-w-lg">
        <h2 id="accordion-collapse-heading-1">
            <button type="button" class="flex items-center justify-between w-full p-5 font-medium text-gray-300 border border-b-0 border-gray-700 rounded-t-xl focus:ring-4 focus:ring-gray-700 dark:focus:ring-gray-800 gap-3" data-accordion-target="#accordion-collapse-body-1" aria-expanded="true" aria-controls="accordion-collapse-body-1">
                <span>¿Qué es Flowbite?</span>
                <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
                </svg>
            </button>
        </h2>
        <div id="accordion-collapse-body-1" class="hidden" aria-labelledby="accordion-collapse-heading-1">
            <div class="p-5 border border-b-0 border-gray-700 dark:bg-gray-900">
                <p class="mb-2">Flowbite es una biblioteca de componentes interactivos de código abierto construida sobre Tailwind CSS, que incluye botones, menús desplegables, modales, barras de navegación y más.</p>
                <p>Consulta esta guía para aprender cómo <a href="/docs/getting-started/introduction/" class="text-blue-500 hover:underline">comenzar</a> a desarrollar sitios web aún más rápido con componentes sobre Tailwind CSS.</p>
            </div>
        </div>
        <h2 id="accordion-collapse-heading-2">
            <button type="button" class="flex items-center justify-between w-full p-5 font-medium text-gray-300 border border-b-0 border-gray-700 focus:ring-4 focus:ring-gray-700 dark:focus:ring-gray-800 gap-3" data-accordion-target="#accordion-collapse-body-2" aria-expanded="false" aria-controls="accordion-collapse-body-2">
                <span>¿Hay un archivo de Figma disponible?</span>
                <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
                </svg>
            </button>
        </h2>
        <div id="accordion-collapse-body-2" class="hidden" aria-labelledby="accordion-collapse-heading-2">
            <div class="p-5 border border-b-0 border-gray-700">
                <p class="mb-2">Flowbite fue conceptualizado y diseñado utilizando el software Figma, por lo que todo lo que ves en la biblioteca tiene un equivalente de diseño en nuestro archivo de Figma.</p>
                <p>Consulta el <a href="https://flowbite.com/figma/" class="text-blue-500 hover:underline">sistema de diseño de Figma</a> basado en las clases de utilidad de Tailwind CSS y componentes de Flowbite.</p>
            </div>
        </div>
        <h2 id="accordion-collapse-heading-3">
            <button type="button" class="flex items-center justify-between w-full p-5 font-medium text-gray-300 border border-gray-700 focus:ring-4 focus:ring-gray-700 dark:focus:ring-gray-800 gap-3" data-accordion-target="#accordion-collapse-body-3" aria-expanded="false" aria-controls="accordion-collapse-body-3">
                <span>¿Cuáles son las diferencias entre Flowbite y Tailwind UI?</span>
                <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
                </svg>
            </button>
        </h2>
        <div id="accordion-collapse-body-3" class="hidden" aria-labelledby="accordion-collapse-heading-3">
            <div class="p-5 border border-t-0 border-gray-700">
                <p class="mb-2">La principal diferencia es que los componentes centrales de Flowbite son de código abierto bajo la licencia MIT, mientras que Tailwind UI es un producto de pago. Otra diferencia es que Flowbite se basa en componentes más pequeños y autónomos, mientras que Tailwind UI ofrece secciones de páginas.</p>
                <p class="mb-2">Sin embargo, recomendamos usar tanto Flowbite, Flowbite Pro, e incluso Tailwind UI, ya que no hay una razón técnica que impida usar lo mejor de ambos mundos.</p>
                <p class="mb-2">Aprende más sobre estas tecnologías:</p>
                <ul class="ps-5 list-disc">
                    <li><a href="https://flowbite.com/pro/" class="text-blue-500 hover:underline">Flowbite Pro</a></li>
                    <li><a href="https://tailwindui.com/" rel="nofollow" class="text-blue-500 hover:underline">Tailwind UI</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
<script src="scripts/create.js.js"></script>
</body>
</html>
