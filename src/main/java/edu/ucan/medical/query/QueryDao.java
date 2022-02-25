package edu.ucan.medical.query;

import edu.ucan.medical.dao.PatientDao;
import edu.ucan.medical.dao.RegionDao;
import edu.ucan.medical.model.Person;
import edu.ucan.medical.model.Query1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author tio-hecro
 */

public class QueryDao {
    private final Connection connection;
    private PreparedStatement statement;

    public QueryDao(Connection connection) {
        this.connection = connection;
    }
    
    public List<Person> examQuery (int month1, int month2, int year,
            String taxIdentificationNumber, int province) {
        
        String sql = "select p.* from person p  "
            + "join patient pa on pk_identify_card_number = pa.fk_person  "
            + "join consultation c on c.fk_patient = pa.fk_person  "
            + "join doctor d on c.fk_doctor = d.tax_identification_number "
            + "join province pr on pr.pk_province = p.fk_province "
            + "where date_part('month', date_and_time) > ? "
            + "and date_part('month', date_and_time) < ? "
            + "and date_part('year', date_and_time) = ? "
            + "and tax_identification_number = ? "
            + "and pk_province = ?";
        
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, month1);
            statement.setInt(2, month2);
            statement.setInt(3, year);
            statement.setString(4, taxIdentificationNumber);
            statement.setInt(5, province);
             
            
            ResultSet rs = statement.executeQuery();
            
            List<Person> patients = new ArrayList<>();
            RegionDao regionDao = new RegionDao(connection);
            
            if (rs.next() == false) return null;
            
            do {                
                Person patient = new Person();
                patient.setIdentifyCardNumber(rs.getString("pk_identify_card_number"));
                patient.setFirstName(rs.getString("first_name"));
                patient.setPhoneNumber(rs.getString("phone_number"));
                patient.setLastName(rs.getString("last_name"));
                patient.setCountry(regionDao.getCountryById(rs.getInt("fk_country")));
                patient.setProvince(regionDao.getProvinceById(rs.getInt("fk_province")));
                patient.setMunicipality(regionDao.getMunicipalityById(rs.getInt("fk_municipality")));
                patient.setCommune(regionDao.getCommuneById(rs.getInt("fk_commune")));
                patient.setNeighborhood(regionDao.getNeighborhoodById(rs.getInt("fk_commune")));
                
                patients.add(patient);
                
            } while (rs.next());
            
            return patients;
        }
        catch (SQLException ex) {
            throw new RuntimeException("Fail in query1", ex);
        }
    }
}
