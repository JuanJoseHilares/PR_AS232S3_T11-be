package test.supplier;

import model.Supplier;
import service.CrudServiceSupplier;

import java.util.List;

public class GetAllSupplier {
    public static void main(String[] args) {
        // Crear una instancia del servicio
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Obtener todos los registros
        List<Supplier> suppliers = supplierService.getAll();

        // Verificar si se obtuvieron registros
        if (suppliers.isEmpty()) {
            System.out.println("No se encontraron registros de proveedor.");
        } else {
            System.out.println("Registros de proveedor encontrados:");
            for (Supplier supplier : suppliers) {
                System.out.println(supplier);
            }
        }
    }
}
