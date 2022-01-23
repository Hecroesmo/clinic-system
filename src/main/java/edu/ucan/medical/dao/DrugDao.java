package edu.ucan.medical.dao;

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

public class DrugDao {
    private final Connection connection;
    private PreparedStatement statement;

    public DrugDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Drug drug) {
        String sql = "INSERT INTO drug (name, description, fk_category) VALUES (?,?,?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            setDrugData(drug);
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(DrugDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Drug> getAllDrugs () {
        String sql = "SELECT * FROM  drug";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Drug> drugs = new ArrayList<>();
            CategoryDao categoryDao = new CategoryDao(connection);
            
            do 
            {                
                Drug drug = new Drug();
                setDrugData(drug, rs, categoryDao);
                drugs.add(drug);
            } 
            while (rs.next());
            
            return drugs;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all drugs", ex);
        }
    }
    
    
    //  support methods --------------------------------------------------------
    
    private void  setDrugData(Drug drug) throws SQLException {
        statement.setString(1, drug.getName());
        statement.setString(2, drug.getDescription());
        statement.setInt(3, drug.getCategory().getPkCategory());
    }
    
    private void  setDrugData(Drug drug, ResultSet rs, CategoryDao categoryDao)
        throws SQLException 
    {
        drug.setPkDrug(rs.getInt("pk_drug"));
        drug.setName(rs.getString("name"));
        drug.setDescription(rs.getString("description"));
        drug.setCategory(categoryDao.getCategoryById(rs.getInt("fk_category")));
    }
}
