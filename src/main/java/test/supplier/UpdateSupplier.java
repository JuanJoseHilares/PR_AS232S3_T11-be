package test.supplier;

import model.Supplier;
import service.CrudServiceSupplier;

public class UpdateSupplier {
    public static void main(String[] args) {
        // Crear un nuevo objeto Supplier con los datos actualizados
        Supplier supplier = new Supplier();
        supplier.setSupplier_id(1); // Reemplaza con el ID del proveedor que deseas actualizar
        supplier.setNames("Servicios S.A.");
        supplier.setAddres("Calle Ejemplo 456");
        supplier.setCity("Ciudad Ejemplo");
        supplier.setPhone_number("123456789");
        supplier.setWhatsapp_number("902269439");
        supplier.setReference_number("REF-001");
        supplier.setEmail("contacto@servicios.com");
        supplier.setAdmin_id("1"); // Establecer un admin_id válido

        // Crear una instancia de CrudServiceSupplier
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Llamar al método update para actualizar el proveedor
        supplierService.update(supplier);

        // Imprimir mensaje de éxito
        System.out.println("Proveedor actualizado exitosamente con ID: " + supplier.getSupplier_id());
    }
}
