package test.supplier;

import service.CrudServiceSupplier;

public class ReactivateSupplier {
    public static void main(String[] args) {
        // ID del proveedor a reactivar
        int supplierId = 7; // Reemplaza con el ID del proveedor que deseas reactivar

        // Crear una instancia de CrudServiceSupplier
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Llamar al método reactivate para reactivar al proveedor
        supplierService.reactivate(supplierId);
    }
}
