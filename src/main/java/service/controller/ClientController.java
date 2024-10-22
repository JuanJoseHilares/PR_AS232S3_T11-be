package service.controller;

import model.Client;
import service.CrudServiceClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/clients")
public class ClientController extends HttpServlet {

    private CrudServiceClient service;

    @Override
    public void init() throws ServletException {
        service = new CrudServiceClient();
    }

    // Manejo de solicitudes GET (consulta de clientes)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> clients = service.getAll();
        request.setAttribute("clients", clients);
        request.getRequestDispatcher("client/client.jsp").forward(request, response);
    }

    // Manejo de solicitudes POST (crear y eliminar clientes)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Crear un nuevo cliente
        if ("create".equals(action)) {
            Client newClient = new Client();
            newClient.setPaternal_surname(request.getParameter("paternal_surname"));
            newClient.setMaternal_surname(request.getParameter("maternal_surname"));
            newClient.setNames(request.getParameter("names"));
            newClient.setSex(request.getParameter("sex"));
            newClient.setDocument_type(request.getParameter("document_type"));
            newClient.setDocument_number(request.getParameter("document_number"));
            newClient.setBirth_date(request.getParameter("birth_date"));
            newClient.setPhone_number(request.getParameter("phone_number"));
            newClient.setWhatsapp_number(request.getParameter("whatsapp_number"));
            newClient.setReference_number(request.getParameter("reference_number"));
            newClient.setEmail(request.getParameter("email"));
            newClient.setAdmin_id(Integer.parseInt(request.getParameter("admin_id")));

            service.create(newClient);
            response.sendRedirect("clients");

            // Eliminar (soft delete) un cliente existente
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.softDelete(id);
            response.sendRedirect("clients");

        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
}
