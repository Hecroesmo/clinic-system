package edu.ucan.medical.dao;

import edu.ucan.medical.model.Consultation;
import edu.ucan.medical.model.Drug;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */

public class DrugsConsultationDao {
    private final Connection connection;
    private PreparedStatement statement;

    public DrugsConsultationDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (int pkConsultation, int pkDrug) {
        String sql = "INSERT INTO drugs_consultation VALUES (?,?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pkConsultation);
            statement.setInt(2, pkDrug);
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(DrugsConsultationDao.class.getName()).
                log(Level.SEVERE, null, ex);
        }
    }
}
