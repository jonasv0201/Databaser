package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by TrulsElg on 14/03/17.
 */
public class ConnectionConfig {

    public static Connection getConnection (String databasenavn) {
        Connection connection = null;

        String dbURL="jdbc:mysql://localhost:3306/"+databasenavn+"?autoReconnect=true&useSSL=false";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, "root", "sqlPassord");
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
