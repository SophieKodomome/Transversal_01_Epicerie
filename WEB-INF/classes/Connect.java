package connect;

import java.sql.*;

public class Connect {

    public Connection connectit(String db, String user, String password) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/" + db;

        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
}