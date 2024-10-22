package test.client;

import service.CrudClientService;

public class ReactivateClient {
    public static void main(String[] args) {
        // ID del cliente a reactivar
        int clientId = 1; // Reemplaza con el ID del cliente que deseas reactivar

        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Llamar al método reactivate para reactivar al cliente
        clientService.reactivate(clientId);

        // Imprimir mensaje de éxito
        System.out.println("Cliente reactivado exitosamente con ID: " + clientId);
    }
}