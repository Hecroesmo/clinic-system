package edu.ucan.medical.connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author tio-hecro
 */
public class ConnectionFactory {
    private final String url;
    private final String username;
    private final String password;
    private final String driver;

    public ConnectionFactory(String url, String username,
            String password, String driver) 
    {
        this.url = url;
        this.username = username;
        this.password = password;
        this.driver = driver;
    }
    
    public Connection getConnection() throws Exception {
        Class.forName(driver);
        return DriverManager.getConnection(url, username, password);
    }
}
