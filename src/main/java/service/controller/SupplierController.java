package service.controller;

import model.Supplier;
import service.CrudServiceSupplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/suppliers")
public class SupplierController extends HttpServlet {

    private CrudServiceSupplier service;

    @Override
    public void init() throws ServletException {
        service = new CrudServiceSupplier();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Supplier> suppliers = service.getAll();
            request.setAttribute("suppliers", suppliers);
            request.getRequestDispatcher("supplier.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Supplier newSupplier = new Supplier();
            newSupplier.setNames(request.getParameter("names"));
            newSupplier.setAddres(request.getParameter("addres"));
            newSupplier.setCity(request.getParameter("city"));
            newSupplier.setPhone_number(request.getParameter("phone_number"));
            newSupplier.setWhatsapp_number(request.getParameter("whatsapp_number"));
            newSupplier.setReference_number(request.getParameter("reference_number"));
            newSupplier.setEmail(request.getParameter("email"));
            newSupplier.setAdmin_id(request.getParameter("admin_id"));

            service.create(newSupplier);

            response.sendRedirect("suppliers");
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.softDelete(id);
            response.sendRedirect("suppliers");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
}