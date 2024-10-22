package service;

import db.AccessDB;
import model.Client;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CrudServiceClient {

    // Consultas SQL
    private final String SQL_SELECT_BASE = "SELECT client_id, paternal_surname, maternal_surname, names, sex, document_type, document_number, birth_date, phone_number, whatsapp_number, reference_number, email, admin_id FROM client WHERE states = 'A'";
    private final String SQL_CREATE = "INSERT INTO client (paternal_surname, maternal_surname, names, sex, document_type, document_number, birth_date, phone_number, whatsapp_number, reference_number, email, admin_id, states) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'A')";
    private final String SQL_UPDATE = "UPDATE client SET paternal_surname=?, maternal_surname=?, names=?, sex=?, document_type=?, document_number=?, birth_date=?, phone_number=?, whatsapp_number=?, reference_number=?, email=?, admin_id=? WHERE client_id=?";
    private final String SQL_STATE = "UPDATE client SET states=? WHERE client_id=?";

    // Mapeo del ResultSet a un objeto Client
    public Client mapRow(ResultSet rs) throws SQLException {
        Client client = new Client();
        client.setClient_id(rs.getInt("client_id"));
        client.setPaternal_surname(rs.getString("paternal_surname"));
        client.setMaternal_surname(rs.getString("maternal_surname"));
        client.setNames(rs.getString("names"));
        client.setSex(rs.getString("sex"));
        client.setDocument_type(rs.getString("document_type"));
        client.setDocument_number(rs.getString("document_number"));

        // Convertimos el java.sql.Date a String
        java.sql.Date birthDate = rs.getDate("birth_date");
        client.setBirth_date(birthDate != null ? birthDate.toString() : null);

        client.setPhone_number(rs.getString("phone_number"));
        client.setWhatsapp_number(rs.getString("whatsapp_number"));
        client.setReference_number(rs.getString("reference_number"));
        client.setEmail(rs.getString("email"));
        client.setAdmin_id(rs.getInt("admin_id"));

        return client;
    }

    // Crear un nuevo cliente
    public void create(Client client) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_CREATE, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, client.getPaternal_surname());
            pstmt.setString(2, client.getMaternal_surname());
            pstmt.setString(3, client.getNames());
            pstmt.setString(4, client.getSex());
            pstmt.setString(5, client.getDocument_type());
            pstmt.setString(6, client.getDocument_number());

            // Convertimos el String birth_date a java.sql.Date
            java.sql.Date birthDate = java.sql.Date.valueOf(client.getBirth_date());
            pstmt.setDate(7, birthDate);

            pstmt.setString(8, client.getPhone_number());
            pstmt.setString(9, client.getWhatsapp_number());
            pstmt.setString(10, client.getReference_number());
            pstmt.setString(11, client.getEmail());
            pstmt.setInt(12, client.getAdmin_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    System.out.println("Cliente creado exitosamente: " + client);
                }
            } else {
                System.out.println("Error al crear el cliente");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Actualizar un cliente existente
    public void update(Client client) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE)) {

            pstmt.setString(1, client.getPaternal_surname());
            pstmt.setString(2, client.getMaternal_surname());
            pstmt.setString(3, client.getNames());
            pstmt.setString(4, client.getSex());
            pstmt.setString(5, client.getDocument_type());
            pstmt.setString(6, client.getDocument_number());

            // Convertimos el String birth_date a java.sql.Date
            java.sql.Date birthDate = java.sql.Date.valueOf(client.getBirth_date());
            pstmt.setDate(7, birthDate);

            pstmt.setString(8, client.getPhone_number());
            pstmt.setString(9, client.getWhatsapp_number());
            pstmt.setString(10, client.getReference_number());
            pstmt.setString(11, client.getEmail());
            pstmt.setInt(12, client.getAdmin_id());
            pstmt.setInt(13, client.getClient_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cliente actualizado con ID: " + client.getClient_id());
            } else {
                System.out.println("No se encontró ningún cliente con el ID proporcionado: " + client.getClient_id());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Eliminar suavemente un cliente (soft delete)
    public void softDelete(int id) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_STATE)) {

            pstmt.setString(1, "I");
            pstmt.setInt(2, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cliente eliminado suavemente con ID: " + id);
            } else {
                System.out.println("No se encontró ningún cliente con el ID proporcionado: " + id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Reactivar un cliente
    public void reactivate(int id) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_STATE)) {

            pstmt.setString(1, "A");
            pstmt.setInt(2, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cliente reactivado con ID: " + id);
            } else {
                System.out.println("No se encontró ningún cliente con el ID proporcionado: " + id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Obtener todos los clientes activos
    public List<Client> getAll() {
        List<Client> clients = new ArrayList<>();

        try (Connection conn = AccessDB.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SQL_SELECT_BASE)) {

            while (rs.next()) {
                Client client = mapRow(rs);
                clients.add(client);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clients;
    }

    // Obtener un cliente por su ID
    public Client getById(int id) {
        Client client = null;

        try (Connection conn = AccessDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BASE + " AND client_id = ?")) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                client = mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return client;
    }
}
