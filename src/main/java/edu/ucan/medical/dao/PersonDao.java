package edu.ucan.medical.dao;

import edu.ucan.medical.model.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */

public class PersonDao {
    private final Connection connection;
    private PreparedStatement statement;

    public PersonDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Person person) {
        String sql = "INSERT INTO person VALUES (?,?,?,?,?,?,?,?,?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            setPersonData(person);
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(PersonDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //  support functions
    
    private void setPersonData(Person person) throws SQLException 
    {
        statement.setString(1, person.getIdentifyCardNumber());
        statement.setString(2, person.getFirstName());
        statement.setString(3, person.getPhoneNumber());
        statement.setString(4, person.getLastName());
        statement.setInt(5, person.getCountry().getPkRegion());
        statement.setInt(6, person.getProvince().getPkRegion());
        statement.setInt(7, person.getMunicipality().getPkRegion());
        statement.setInt(8, person.getCommune().getPkRegion());
        statement.setInt(9, person.getNeighborhood().getPkRegion());
    }
}
