package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccessDB {

    private AccessDB() {
        // Constructor privado para evitar que se instancie la clase
    }

    public static Connection getConnection() throws SQLException {
        Connection cn = null;
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String DB = "SistV_MC";
        String server = "dbvallegrande.database.windows.net:1433";
        String urlDB = "jdbc:sqlserver://"+ server +";databaseName="+ DB +";encrypt=True;TrustServerCertificate=True;loginTimeout=30;";
        String user = "sa_hilares";
        String pass = "9B&3W845EJ$@Yyr7E2FAqc";
        try {
            Class.forName(driver).getDeclaredConstructor().newInstance();
            cn = DriverManager.getConnection(urlDB, user, pass);
        } catch (SQLException e) {
            throw e;
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontro el driver de la base de datos.");
        } catch (Exception e) {
            throw new SQLException("No se puede establecer la conexion con la BD:");
        }
        return cn;
    }

}