package edu.ucan.medical.dao;

import edu.ucan.medical.model.Doctor;
import edu.ucan.medical.model.Specialty;
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
public class DoctorDao {
    private final Connection connection;
    private PreparedStatement statement;

    public DoctorDao(Connection connection) {
        this.connection = connection;
    }
   
    
    public void save (Doctor doctor) {
        String sql = "INSERT INTO doctor VALUES (?, ?, ?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            setDoctorsData(doctor);            
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(DoctorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Doctor> getAllDoctors() {
        String sql = "SELECT tax_identification_number,"
            + " fk_person, first_name, last_name, phone_number,"
            + " fk_specialty, fk_country, fk_province, fk_municipality,"
            + " fk_commune, fk_neighborhood FROM doctor"
            + " JOIN person ON pk_identify_card_number = fk_person";
   
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            if (rs.next() == false) return null;
            
            List<Doctor> doctors = new ArrayList<>();
            SpecialtyDao specialtyDao = new SpecialtyDao(connection);
            RegionDao regionDao = new RegionDao(connection);
            
            do 
            {                
                Doctor doctor = new Doctor();
                setDoctorsData(doctor, rs, specialtyDao, regionDao);
                doctors.add(doctor);
            } 
            while (rs.next());
            
            return doctors;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all doctors", ex);
        }
    }
    
    //  support methods --------------------------------------------------------
    
    private void setDoctorsData(Doctor doctor, ResultSet rs,
        SpecialtyDao specialtyDao, RegionDao regionDao) throws SQLException 
    {
        doctor.setTaxIdentificationNumber(rs.getString("tax_identification_number"));
        doctor.setIdentifyCardNumber(rs.getString("fk_person"));
        doctor.setFirstName(rs.getString("first_name"));
        doctor.setLastName(rs.getString("last_name"));
        doctor.setPhoneNumber(rs.getString("phone_number"));
        doctor.setSpecialty(specialtyDao.getSpecialtyById(rs.getInt("fk_specialty")));
        doctor.setCountry(regionDao.getCountryById(rs.getInt("fk_country")));
        doctor.setProvince(regionDao.getProvinceById(rs.getInt("fk_province")));
        doctor.setMunicipality(regionDao.getMunicipalityById(rs.getInt("fk_municipality")));
        doctor.setCommune(regionDao.getCommuneById(rs.getInt("fk_commune")));
        doctor.setNeighborhood(regionDao.getNeighborhoodById(rs.getInt("fk_commune")));
    }
    
    
    private void setDoctorsData(Doctor doctor) throws SQLException 
    {
        statement.setString(1, doctor.getTaxIdentificationNumber());
        statement.setString(2, doctor.getIdentifyCardNumber());
        statement.setInt(3, doctor.getSpecialty().getPkSpecialty());
    }
}
