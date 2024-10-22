package test.supplier;

import model.Supplier;
import service.CrudServiceSupplier;

public class GetByIdSupplier {
    public static void main(String[] args) {
        // ID del proveedor a buscar
        int supplierId = 4; // Reemplaza con el ID del proveedor que deseas buscar

        // Crear una instancia de CrudServiceSupplier
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Llamar al método getById para obtener el proveedor por su ID
        Supplier supplier = supplierService.getById(supplierId);

        // Imprimir el proveedor obtenido
        if (supplier != null) {
            System.out.println("Proveedor encontrado:");
            System.out.println(supplier);
        } else {
            System.out.println("No se encontró ningún proveedor con el ID proporcionado: " + supplierId);
        }
    }
}