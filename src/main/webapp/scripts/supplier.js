document.getElementById('openModal').onclick = function() {
    document.getElementById('supplierModal').style.display = 'flex';
}

document.getElementById('closeModal').onclick = function() {
    const modal = document.getElementById('supplierModal');
    modal.classList.add('modal-close');
    setTimeout(() => {
        modal.style.display = 'none';
        modal.classList.remove('modal-close');
    }, 300);
}

window.onclick = function(event) {
    const modal = document.getElementById('supplierModal');
    if (event.target == modal) {
        modal.classList.add('modal-close');
        setTimeout(() => {
            modal.style.display = 'none';
            modal.classList.remove('modal-close');
        }, 300);
    }
}

function confirmDelete(id) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "No podrás revertir esto!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar!'
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('delete-form-' + id).submit();
        }
    });
}