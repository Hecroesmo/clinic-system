package edu.ucan.medical.connection;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */
public class ConnectionFactoryTest {
    public static void main (String [] args) {
        
        try (Connection c = new ConnectionFactory(
            "jdbc:postgresql://localhost:5432/medical-system",
            "postgres", "postgres", "org.postgresql.Driver").getConnection())
        {
            System.out.println("Connection opened!");
        } catch (Exception ex) {
            Logger.getLogger(ConnectionFactoryTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
