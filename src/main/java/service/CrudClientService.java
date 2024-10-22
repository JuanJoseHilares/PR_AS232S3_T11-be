package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.AccessDB;
import model.Client;
import service.spec.CrudServiceSpec;
import service.spec.RowMapper;

public class CrudClientService implements CrudServiceSpec<Client>, RowMapper<Client> {

    // Definiendo consultas
    private final String SQL_SELECT_BASE = "SELECT client_id, paternal_surname, maternal_surname, names, sex, document_type, document_number, birth_date, phone_number, whatsapp_number, reference_number, email, states, admin_id FROM CLIENT";
    private final String SQL_CREATE = "INSERT INTO CLIENT (paternal_surname, maternal_surname, names, sex, document_type, document_number, birth_date, phone_number, whatsapp_number, reference_number, email, states, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_UPDATE = "UPDATE CLIENT SET paternal_surname=?, maternal_surname=?, names=?, sex=?, document_type=?, document_number=?, birth_date=?, phone_number=?, whatsapp_number=?, reference_number=?, email=?, states=?, admin_id=? WHERE client_id=?";
    private final String SQL_STATES = "UPDATE CLIENT SET states=? WHERE client_id=?";

    // Mapeado de listas
    @Override
    public Client mapRow(ResultSet rs) throws SQLException {
        Client bean = new Client();

        bean.setClient_id(rs.getInt("client_id"));
        bean.setPaternal_surname(rs.getString("paternal_surname"));
        bean.setMaternal_surname(rs.getString("maternal_surname"));
        bean.setNames(rs.getString("names"));
        bean.setSex(rs.getString("sex"));
        bean.setDocument_type(rs.getString("document_type"));
        bean.setDocument_number(rs.getString("document_number"));
        bean.setBirth_date(rs.getString("birth_date")); // Cambiado a String
        bean.setPhone_number(rs.getString("phone_number"));
        bean.setWhatsapp_number(rs.getString("whatsapp_number"));
        bean.setReference_number(rs.getString("reference_number"));
        bean.setEmail(rs.getString("email"));
        bean.setStates(rs.getString("states"));
        bean.setAdmin_id(rs.getInt("admin_id"));

        return bean;
    }

    // Creación de registros
    @Override
    public void create(Client bean) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_CREATE, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, bean.getPaternal_surname());
            pstmt.setString(2, bean.getMaternal_surname());
            pstmt.setString(3, bean.getNames());
            pstmt.setString(4, bean.getSex());
            pstmt.setString(5, bean.getDocument_type());
            pstmt.setString(6, bean.getDocument_number());
            pstmt.setString(7, bean.getBirth_date());
            pstmt.setString(8, bean.getPhone_number());
            pstmt.setString(9, bean.getWhatsapp_number());
            pstmt.setString(10, bean.getReference_number());
            pstmt.setString(11, bean.getEmail());
            pstmt.setString(12, bean.getStates());
            pstmt.setInt(13, bean.getAdmin_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Registro insertado: " + bean);
            } else {
                System.out.println("Error al crear el registro");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Reactivación de registros
    @Override
    public void reactivate(int id) {
        try (Connection conn = AccessDB.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL_STATES)) {

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

    // Actualizar registros
    @Override
    public void update(Client bean) {
        try (Connection conn = AccessDB.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE)) {
            pstmt.setString(1, bean.getPaternal_surname());
            pstmt.setString(2, bean.getMaternal_surname());
            pstmt.setString(3, bean.getNames());
            pstmt.setString(4, bean.getSex());
            pstmt.setString(5, bean.getDocument_type());
            pstmt.setString(6, bean.getDocument_number());
            pstmt.setString(7, bean.getBirth_date());
            pstmt.setString(8, bean.getPhone_number());
            pstmt.setString(9, bean.getWhatsapp_number());
            pstmt.setString(10, bean.getReference_number());
            pstmt.setString(11, bean.getEmail());
            pstmt.setString(12, bean.getStates());
            pstmt.setInt(13, bean.getAdmin_id());
            pstmt.setInt(14, bean.getClient_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cliente actualizado con ID: " + bean.getClient_id());
            } else {
                System.out.println("No se encontró ningún cliente con el ID proporcionado: " + bean.getClient_id());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Eliminado lógico
    @Override
    public void softDelete(int id) {
        try (Connection conn = AccessDB.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL_STATES)) {

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

    // Mostrar todos
    @Override
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

    // Buscar por ID
    @Override
    public Client getById(int id) {
        Client client = null;

        try (Connection conn = AccessDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BASE + " WHERE client_id = ?")) {

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

    // Buscar por filtros (si es necesario)
    @Override
    public List<Client> getFilters(Client bean) {
        // Similar a la implementación en CrudAttorneyService
        // Puedes implementar filtros según los atributos de Client
        return null; // Implementar según sea necesario
    }
}
