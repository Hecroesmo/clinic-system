package edu.ucan.medical.dao;

import edu.ucan.medical.model.ConsultationType;
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

public class ConsultationTypeDao {
    private final Connection connection;
    private PreparedStatement statement;

    public ConsultationTypeDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (ConsultationType consultationType) {
        String sql = "INSERT INTO consultation_type (description) VALUES (?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setString(1, consultationType.getDescription());
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(ConsultationTypeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<ConsultationType> getAllConsultationTypes () {
        String sql = "SELECT * FROM consultation_type";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<ConsultationType> consultationTypes = new ArrayList<>();
            
            do 
            {
                ConsultationType consultationType = new ConsultationType(
                    rs.getInt("pk_consultation_type"),
                    rs.getString("description")
                );
                
                consultationTypes.add(consultationType);
            } 
            while (rs.next());
            
            return consultationTypes;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all consultation types", ex);
        }
    }
    
    public ConsultationType getConsultationTypeById (int id) {
        String sql = "SELECT * FROM consultation_type WHERE pk_consultation_type = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            ConsultationType consultationType = new ConsultationType(
                rs.getInt("pk_consultation_type"),
                rs.getString("description")
            );
            
            return consultationType;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get consultation types by id", ex);
        }
    }
}
