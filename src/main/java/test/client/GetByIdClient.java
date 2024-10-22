package test.client;

import model.Client;
import service.CrudClientService;

public class GetByIdClient {
    public static void main(String[] args) {
        // ID del cliente a buscar
        int clientId = 1; // Reemplaza con el ID del cliente que deseas buscar

        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Llamar al método getById para obtener el cliente por su ID
        Client client = clientService.getById(clientId);

        // Imprimir el cliente obtenido
        if (client != null) {
            System.out.println("Cliente encontrado:");
            System.out.println(client);
        } else {
            System.out.println("No se encontró ningún cliente con el ID proporcionado: " + clientId);
        }
    }
}