package test.supplier;

import model.Supplier;
import service.CrudServiceSupplier;

public class CreateSupplier {
    public static void main(String[] args) {
        // Crear un nuevo objeto Supplier
        Supplier supplier = new Supplier();

        // Establecer las propiedades del objeto supplier
        supplier.setNames("Comercializadora ABC");
        supplier.setAddres("Avenida Libertad 789");
        supplier.setCity("Ciudad Nueva");
        supplier.setPhone_number("956123789");
        supplier.setWhatsapp_number("921654987");
        supplier.setReference_number("920226439");
        supplier.setEmail("info@comercializadoraabc.com");
        supplier.setAdmin_id("3"); // Establecer un admin_id válido



        // Crear una instancia de CrudServiceSupplier
        CrudServiceSupplier supplierService = new CrudServiceSupplier();

        // Llamar al método create para crear el proveedor
        supplierService.create(supplier);

        // Imprimir un mensaje de éxito con los datos del proveedor sin el ID
        System.out.println("Proveedor creado exitosamente:");
        System.out.println("Nombre: " + supplier.getNames());
        System.out.println("Dirección: " + supplier.getAddres());
        System.out.println("Ciudad: " + supplier.getCity());
        System.out.println("Teléfono: " + supplier.getPhone_number());
        System.out.println("WhatsApp: " + supplier.getWhatsapp_number());
        System.out.println("Referencia: " + supplier.getReference_number());
        System.out.println("Email: " + supplier.getEmail());
        System.out.println("Admin ID: " + supplier.getAdmin_id());
    }
}
