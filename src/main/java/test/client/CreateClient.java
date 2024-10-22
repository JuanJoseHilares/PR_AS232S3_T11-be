package test.client;

import model.Client;
import service.CrudClientService;

public class CreateClient {
    public static void main(String[] args) {
        // Crear un nuevo objeto Client
        Client client = new Client();

        // Establecer las propiedades del objeto client
        client.setPaternal_surname("Smith");
        client.setMaternal_surname("Johnson");
        client.setNames("Alice");
        client.setSex("F");
        client.setDocument_type("DNI");
        client.setDocument_number("987654321");
        client.setBirth_date("1990-05-15"); // Cambiar al formato adecuado
        client.setPhone_number("987654321");
        client.setWhatsapp_number("987654321");
        client.setReference_number("123456789");
        client.setEmail("alice.smith@example.com");
        client.setStates("A"); // Estado activo
        client.setAdmin_id(1); // Establecer un admin_id válido

        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Llamar al método create para crear el cliente
        clientService.create(client);

        // Imprimir un mensaje de éxito
        System.out.println("Cliente creado exitosamente.");
    }
}