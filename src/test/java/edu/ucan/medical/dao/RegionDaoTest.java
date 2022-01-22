package edu.ucan.medical.dao;

import edu.ucan.medical.connection.ConnectionFactory;
import edu.ucan.medical.filter.ConnectionFilter;
import edu.ucan.medical.model.Region;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */
public class RegionDaoTest {
    public static void main (String [] args) {
        Region region = new Region();
        region.setName("Angola");
        
        try 
        {
            Connection connection;
            connection = new ConnectionFactory(
                    "jdbc:postgresql://localhost:5432/medical-system",
                    "postgres", "postgres", "org.postgresql.Driver").getConnection();
            
            System.out.println(new RegionDao(connection).getNeighborhoodById(1));
            
            connection.close();
        }
        catch (Exception ex) {
            Logger.getLogger(
                ConnectionFilter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
