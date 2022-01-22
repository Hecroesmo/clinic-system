package edu.ucan.medical.dao;

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
public class SpecialtyDao {
    private final Connection connection;
    private PreparedStatement statement;

    public SpecialtyDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Specialty specialty) {
        String sql = "INSERT INTO specialty (name) VALUES (?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setString(1, specialty.getName());
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(SpecialtyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Specialty getSpecialtyById (int id) {
        String sql = "SELECT * FROM specialty WHERE pk_specialty = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                            
            Specialty specialty = new Specialty();
            setSpecialtyData(specialty, rs);
            
            return specialty;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a specialty by id", ex);
        }
    }
    
    public List<Specialty> getAllSpecialty () {
        String sql = "SELECT * FROM specialty";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Specialty> specialties = new ArrayList<>();
            
            do 
            {                
                Specialty specialty = new Specialty();
                setSpecialtyData(specialty, rs);
                specialties.add(specialty);
            } 
            while (rs.next());
            
            return specialties;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get all specialties", ex);
        }
    }
    
    //  support methods
    
    private void setSpecialtyData (Specialty specialty, ResultSet rs)
        throws SQLException 
    {
        specialty.setPkSpecialty(rs.getInt("pk_specialty"));
        specialty.setName(rs.getString("name"));
    }
}
