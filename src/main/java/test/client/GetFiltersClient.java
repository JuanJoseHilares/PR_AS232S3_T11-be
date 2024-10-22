package test.client;

import model.Client;
import service.CrudClientService;

import java.util.List;

public class GetFiltersClient {
    public static void main(String[] args) {
        // Crear una instancia de CrudClientService
        CrudClientService clientService = new CrudClientService();

        // Crear un objeto Client con los valores de los filtros
        Client filter = new Client();
        filter.setNames(null); // O establece un valor específico para filtrar
        filter.setPaternal_surname(null); // O establece un valor específico para filtrar
        filter.setMaternal_surname(null); // O establece un valor específico para filtrar
        filter.setDocument_number(null); // O establece un valor específico para filtrar
        filter.setStates("A"); // Estado activo

        // Llamar al método getFilters para obtener la lista de resultados
        List<Client> clients = clientService.getFilters(filter);

        // Imprimir los resultados en formato de tabla
        if (clients.isEmpty()) {
            System.out.println("No se encontraron resultados.");
        } else {
            System.out.println("Resultados encontrados:");
            System.out.println("-----------------------------------------------------------------");
            System.out.printf("%-10s | %-20s | %-20s | %-20s | %-10s | %-10s%n",
                    "ID", "Nombres", "Apellido Paterno", "Apellido Materno", "Tipo de Documento", "Estados");
            System.out.println("-----------------------------------------------------------------");
            for (Client client : clients) {
                System.out.printf("%-10s | %-20s | %-20s | %-20s | %-10s | %-10s%n",
                        client.getClient_id(), client.getNames(), client.getPaternal_surname(),
                        client.getMaternal_surname(), client.getDocument_type(), client.getStates());
            }
            System.out.println("-----------------------------------------------------------------");
        }
    }
}