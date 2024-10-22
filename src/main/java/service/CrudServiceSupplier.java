package service;

import db.AccessDB;
import model.Supplier;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CrudServiceSupplier {

    // Definiendo consultas
    private final String SQL_SELECT_BASE = "SELECT s.supplier_id, s.names AS name, s.addres, s.city, s.phone_number, s.whatsapp_number, s.reference_number, s.email, a.names AS admin_name FROM supplier s JOIN admins a ON s.admin_id = a.admin_id WHERE s.states = 'A'";
    private final String SQL_INACTIVE_BASE = "SELECT s.supplier_id, s.names AS name, s.addres, s.city, s.phone_number, s.whatsapp_number, s.reference_number, s.email, a.names AS admin_name FROM supplier s JOIN admins a ON s.admin_id = a.admin_id WHERE s.states = 'I'";
    private final String SQL_CREATE = "INSERT INTO supplier (names, addres, city, phone_number, whatsapp_number, reference_number, email, admin_id,states) VALUES (?, ?, ?, ?, ?, ?, ?, ?,'A')";
    private final String SQL_UPDATE = "UPDATE supplier SET names=?, addres=?, city=?, phone_number=?, whatsapp_number=?, reference_number=?, email=?, admin_id=? WHERE supplier_id=?";
    private final String SQL_STATE = "UPDATE supplier SET states=? WHERE supplier_id=?";

    public Supplier mapRow(ResultSet rs) throws SQLException {
        Supplier supplier = new Supplier();

        supplier.setSupplier_id(rs.getInt("supplier_id"));
        supplier.setNames(rs.getString("name"));
        supplier.setAddres(rs.getString("addres"));
        supplier.setCity(rs.getString("city"));
        supplier.setPhone_number(rs.getString("phone_number"));
        supplier.setWhatsapp_number(rs.getString("whatsapp_number"));
        supplier.setReference_number(rs.getString("reference_number"));
        supplier.setEmail(rs.getString("email"));
        supplier.setAdmin_id(rs.getString("admin_name"));

        return supplier;
    }

    public void create(Supplier bean) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_CREATE, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, bean.getNames());
            pstmt.setString(2, bean.getAddres());
            pstmt.setString(3, bean.getCity());
            pstmt.setString(4, bean.getPhone_number());
            pstmt.setString(5, bean.getWhatsapp_number());
            pstmt.setString(6, bean.getReference_number());
            pstmt.setString(7, bean.getEmail());
            pstmt.setString(8, bean.getAdmin_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    System.out.println("Registro insertado");
                }
            } else {
                System.out.println("Error al crear el registro");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void reactivate(int id) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_STATE)) {

            pstmt.setString(1, "A");
            pstmt.setInt(2, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Proveedor reactivado");
            } else {
                System.out.println("No se encontró ningún proveedor con el ID proporcionado: " + id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void update(Supplier bean) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE)) {

            pstmt.setString(1, bean.getNames());
            pstmt.setString(2, bean.getAddres());
            pstmt.setString(3, bean.getCity());
            pstmt.setString(4, bean.getPhone_number());
            pstmt.setString(5, bean.getWhatsapp_number());
            pstmt.setString(6, bean.getReference_number());
            pstmt.setString(7, bean.getEmail());
            pstmt.setString(8, bean.getAdmin_id());
            pstmt.setInt(9, bean.getSupplier_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Proveedor actualizado");
            } else {
                System.out.println("No se encontró ningún proveedor con el ID proporcionado: " + bean.getSupplier_id());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void softDelete(int id) {
        try (Connection conn = AccessDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL_STATE)) {

            pstmt.setString(1, "I");
            pstmt.setInt(2, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Proveedor eliminado");
            } else {
                System.out.println("No se encontró ningún proveedor con el ID proporcionado: " + id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Supplier> getAll() {
        List<Supplier> suppliers = new ArrayList<>();

        try (Connection conn = AccessDB.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SQL_SELECT_BASE)) {

            while (rs.next()) {
                Supplier supplier = mapRow(rs);
                suppliers.add(supplier);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }



    public Supplier getById(int id) {
        Supplier supplier = null;

        try (Connection conn = AccessDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BASE + " WHERE supplier_id = ?")) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                supplier = mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supplier;
    }

}