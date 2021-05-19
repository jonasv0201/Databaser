package com.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by TrulsElg on 14/03/17.
 */
public class DatabaseManager {


    public void createDatabase(String databaseNavn) {
        Connection connection = null;
        Statement statement =null;


        try {
            connection=ConnectionConfig.getConnection("");
            statement=connection.createStatement();

            String sql = "CREATE DATABASE IF NOT EXISTS "+databaseNavn;
            statement.executeUpdate(sql);

        } catch (SQLException se){
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


    }

    public void deleteDatabase(String databaseNavn) {
        Connection connection = null;
        Statement statement =null;


        try {
            connection=ConnectionConfig.getConnection("");
            statement=connection.createStatement();

            String sql = "DROP DATABASE IF EXISTS "+databaseNavn;
            statement.executeUpdate(sql);

        } catch (SQLException se){
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


    }

    public void selectDatabase() {

    }

}
