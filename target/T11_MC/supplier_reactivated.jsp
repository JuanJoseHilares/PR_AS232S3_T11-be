<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Proveedores Inactivos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container p-4">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Proveedores Inactivos</h1>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead class="thead-light">
                <tr class="text-center">
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>DIRECCIÓN</th>
                    <th>CIUDAD</th>
                    <th>TELÉFONO</th>
                    <th>WHATSAPP</th>
                    <th>REFERENCIA</th>
                    <th>CORREO</th>
                    <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="supplier" items="${suppliersInactivos}">
                    <tr class="text-center">
                        <td>${supplier.supplier_id}</td>
                        <td>${supplier.names}</td>
                        <td>${supplier.addres}</td>
                        <td>${supplier.city}</td>
                        <td>${supplier.phone_number}</td>
                        <td>${supplier.whatsapp_number}</td>
                        <td>${supplier.reference_number}</td>
                        <td>${supplier.email}</td>
                        <td>
                            <form id="reactivate-form-${supplier.supplier_id}" action="suppliers" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="${supplier.supplier_id}">
                                <input type="hidden" name="action" value="reactivate">
                                <button type="button" class="btn btn-success btn-sm" onclick="confirmReactivate(${supplier.supplier_id})">Reactivar</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer text-center">
            <a href="index.jsp" class="btn btn-secondary">Regresar al Inicio</a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function confirmReactivate(id) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Vas a reactivar este proveedor!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, reactivarlo!',
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
