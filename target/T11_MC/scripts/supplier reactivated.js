function confirmReactivation(supplierId) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "El proveedor será reactivado",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, reactivar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('reactivate-form-' + supplierId).submit();
        }
    });
}
