function confirmDelete(id) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "¿Quieres borrar este cliente?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('delete-form-' + id).submit();
        }
    });
}

document.getElementById('help-button').addEventListener('click', function() {
    const accordion = document.getElementById('accordion-open');
    accordion.classList.toggle('hidden');
    if (!accordion.classList.contains('hidden')) {
        this.textContent = 'Cerrar Ayuda';
        accordion.classList.add('animate__animated', 'animate__fadeIn');
    } else {
        this.textContent = 'Ayuda';
    }
});

function confirmReactivation(clientId) {
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
            document.getElementById('reactivate-form-' + clientId).submit();
        }
    });
}
