package com.util;
import java.sql.*;

/**
 * Created by TrulsElg on 14/03/17.
 */
public class TableManager {

    public void createTable(String databaseNavn, String sqlString) {
        Connection connection = null;
        Statement statement = null;

        try {
            connection = ConnectionConfig.getConnection(databaseNavn);
            statement = connection.createStatement();
            statement.execute(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement != null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void insertValues(String databaseNavn, String sqlInsert) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Statement statement = null;

        try {
            connection=ConnectionConfig.getConnection(databaseNavn);

            statement = connection.createStatement();
            String sql = "INSERT INTO person " +
                    "VALUES (2,'Mich', 'Hoyer')";
            statement.executeUpdate(sql);


        }catch (SQLException se) {
            se.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null){
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void makeQuery(String databaseNavn){
        Connection connection = null;
        Statement statement = null;

        try {
            connection = ConnectionConfig.getConnection(databaseNavn);
            statement=connection.createStatement();

            String sqlQuery = "SELECT id, first_name, last_name FROM person";
            ResultSet rs = statement.executeQuery(sqlQuery);

            //Retrieves values from a table with fields id, first_name, last_name
            while(rs.next()){
                //Retrieve by column name
                int id  = rs.getInt("id");
                String first = rs.getString("first_name");
                String last = rs.getString("last_name");

                //Display values
                System.out.print("ID: " + id);
                System.out.print(", First: " + first);
                System.out.println(", Last: " + last);
            }

        } catch (SQLException se){
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement!=null) {
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
}
