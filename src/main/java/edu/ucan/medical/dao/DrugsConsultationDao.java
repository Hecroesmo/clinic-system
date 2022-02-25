package edu.ucan.medical.dao;

import edu.ucan.medical.model.Consultation;
import edu.ucan.medical.model.Drug;
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
    
    public List<Drug> getPrescriptionByConsultationId(int pkConsultation) {
        String sql = "SELECT d.* FROM drug d"
            + " JOIN drugs_consultation ON fk_drug = pk_drug"
            + " WHERE fk_consultation = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pkConsultation);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Drug> drugs = new ArrayList<>();
            
            do 
            {                
                Drug drug = new Drug();
                drug.setPkDrug(rs.getInt("pk_drug"));
                drug.setName(rs.getString("name"));
                drug.setDescription(rs.getString("description"));
                
                drug.setCategory(new CategoryDao(connection).getCategoryById(
                    rs.getInt("fk_category")));
                
                drugs.add(drug);
            }
            while (rs.next());
            System.out.println(drugs);
            return drugs;
        } 
        catch (SQLException ex) {
            throw new RuntimeException(
                "Fail to get prescription by consulatation id", ex);
        }
    }
}
