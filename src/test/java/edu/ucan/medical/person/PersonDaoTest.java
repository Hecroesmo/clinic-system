package edu.ucan.medical.person;

import edu.ucan.medical.connection.ConnectionFactory;
import edu.ucan.medical.dao.PersonDao;
import edu.ucan.medical.filter.ConnectionFilter;
import edu.ucan.medical.model.Person;
import edu.ucan.medical.model.Region;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */
public class PersonDaoTest {
    
    public static void main (String [] args) {
        Region country = new Region();
        country.setPkRegion(1);
        
        Region province = new Region();
        province.setPkRegion(2);
        
        Region municipality = new Region();
        municipality.setPkRegion(12);
        
        Region commune = new Region();
        commune.setPkRegion(13);
        
        Region neighborhood = new Region();
        neighborhood.setPkRegion(14);
        
        Person person = new Person("0064826LN73r", "Raquel", "Enice", "926780495");
        person.setCountry(country);
        person.setProvince(province);
        person.setMunicipality(municipality);
        person.setCommune(commune);
        person.setNeighborhood(neighborhood);
   
        
        try 
        {
            Connection connection;
            connection = new ConnectionFactory(
                "jdbc:postgresql://localhost:5432/medical-system",
                "postgres", "postgres", "org.postgresql.Driver").getConnection();
            
            new PersonDao(connection).save(person);
            
            connection.close();
        }
        catch (Exception ex) {
            Logger.getLogger(
                ConnectionFilter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
