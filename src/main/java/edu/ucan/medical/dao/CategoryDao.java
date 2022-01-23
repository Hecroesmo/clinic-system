package edu.ucan.medical.dao;

import edu.ucan.medical.model.Category;
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
public class CategoryDao {
    private final Connection connection;
    private PreparedStatement statement;

    public CategoryDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Category category) {
        String sql = "INSERT INTO category (name) VALUES (?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setString(1, category.getName());
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM category WHERE pk_category = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            Category category = new Category(
                rs.getInt("pk_category"),
                rs.getString("name")
            );
            
            return category;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get category by id", ex);
        }
    }
    
    public List<Category> getAllCategories () {
        String sql = "SELECT * FROM category";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Category> categories = new ArrayList<>();
            
            do
            {                
                Category category = new Category(
                    rs.getInt("pk_category"),
                    rs.getString("name")
                );
                
                categories.add(category);
            } 
            while (rs.next());
            
            return categories;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all categories", ex);
        }
    }
}
