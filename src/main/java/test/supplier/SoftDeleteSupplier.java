package test.supplier;

import service.CrudServiceSupplier;

public class SoftDeleteSupplier {
    public static void main(String[] args) {
        // ID del proveedor a eliminar
        int supplierId = 6; // Reemplaza con el ID del proveedor que deseas eliminar

        // Crear una instancia de CrudServiceSupplier
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Llamar al método softDelete para eliminar suavemente al proveedor
        supplierService.softDelete(supplierId);
    }
}
