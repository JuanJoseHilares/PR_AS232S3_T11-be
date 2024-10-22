package test.client;

import model.Client;
import service.CrudClientService;

public class UpdateClient {
    public static void main(String[] args) {
        // Crear un nuevo objeto Client con los datos actualizados
        Client client = new Client();
        client.setClient_id(1); // Reemplaza con el ID del cliente que deseas actualizar
        client.setPaternal_surname("Smith");
        client.setMaternal_surname("Johnson");
        client.setNames("Alice");
        client.setSex("F");
        client.setDocument_type("DNI");
        client.setDocument_number("CD987654");
        client.setBirth_date("1990-05-15"); // Cambia al formato adecuado si es necesario
        client.setPhone_number("987654321");
        client.setWhatsapp_number("987654321");
        client.setReference_number("123456789");
        client.setEmail("alice.smith@example.com");
        client.setStates("A"); // Estado activo
        client.setAdmin_id(1); // Establecer un admin_id válido

        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Llamar al método update para actualizar el cliente
        clientService.update(client);

        // Imprimir mensaje de éxito
        System.out.println("Cliente actualizado exitosamente con ID: " + client.getClient_id());
    }
}