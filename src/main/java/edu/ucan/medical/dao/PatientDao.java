package edu.ucan.medical.dao;

import edu.ucan.medical.model.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */

public class PatientDao {
    private final Connection connection;
    private PreparedStatement statement;

    public PatientDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Person patient) {
        String sql = "INSERT INTO patient VALUES (?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setString(1, patient.getIdentifyCardNumber());
            statement.executeUpdate();
        }
        catch (SQLException ex) {
            Logger.getLogger(PatientDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Person> getAllPatients () {
        String sql = "SELECT person.* FROM person"
            + " JOIN patient ON pk_identify_card_number = fk_person";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Person> patients = new ArrayList<>();
            RegionDao regionDao = new RegionDao(connection);
            
            do 
            {                
                Person patient = new Person();
                setPatientData(patient, rs, regionDao);
                patients.add(patient);
            }
            while (rs.next());
            
            return patients;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all patients", ex);
        }
    }
    
    // support methods ---------------------------------------------------------
    
    private void setPatientData (Person patient, ResultSet rs, RegionDao regionDao)
        throws SQLException 
    {
        patient.setIdentifyCardNumber(rs.getString("pk_identify_card_number"));
        patient.setFirstName(rs.getString("first_name"));
        patient.setPhoneNumber(rs.getString("phone_number"));
        patient.setLastName(rs.getString("last_name"));

        patient.setCountry(regionDao.getCountryById(rs.getInt("fk_country")));
        patient.setProvince(regionDao.getProvinceById(rs.getInt("fk_province")));

        patient.setMunicipality(
            regionDao.getMunicipalityById(rs.getInt("fk_municipality")));

        patient.setCommune(regionDao.getCommuneById(rs.getInt("fk_commune")));

        patient.setNeighborhood(
            regionDao.getNeighborhoodById(rs.getInt("fk_neighborhood")));
    }
}
