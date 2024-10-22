package test.client;

import service.CrudClientService;

public class SoftDeleteClient {
    public static void main(String[] args) {
        // ID del cliente a eliminar
        int clientId = 1; // Reemplaza con el ID del cliente que deseas eliminar

        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Llamar al método softDelete para eliminar suavemente al cliente
        clientService.softDelete(clientId);

        // Imprimir mensaje de éxito
        System.out.println("Cliente eliminado suavemente con ID: " + clientId);
    }
}