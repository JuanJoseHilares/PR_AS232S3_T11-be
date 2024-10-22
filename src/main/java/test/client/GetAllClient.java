package test.client;

import model.Client;
import service.CrudClientService;

import java.util.List;

public class GetAllClient {
    public static void main(String[] args) {
        // Crear una instancia del servicio
        CrudClientService clientService = new CrudClientService();

        // Obtener todos los registros
        List<Client> clients = clientService.getAll();

        // Verificar si se obtuvieron registros
        if (clients.isEmpty()) {
            System.out.println("No se encontraron registros de cliente.");
        } else {
            System.out.println("Registros de cliente encontrados:");
            for (Client client : clients) {
                System.out.println(client);
            }
        }
    }
}
