package edu.ucan.medical.dao;

import edu.ucan.medical.model.Region;
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
public class RegionDao {
    private final Connection connection;
    private PreparedStatement statement;
    
    public RegionDao(Connection connection) {
        this.connection = connection;
    }
    
    public void saveCountry(Region region) {
        boolean isCountry = region.getFkRegion() == 0;
        
        String sql = "INSERT INTO country (name) VALUES (?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setString(1, region.getName());
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(RegionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Region> getCountries() {
        String sql = "SELECT * FROM country";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Region> regions = new ArrayList<>();
            
            do {                
                Region region = new Region();
                region.setPkRegion(rs.getInt("pk_country"));
                region.setName(rs.getString("name"));
                regions.add(region);
            } while (rs.next());
            
            return regions;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get all contries", ex);
        }
    }
    
    public Region getCountryById(int id) {
        String sql = "SELECT * FROM country WHERE pk_country = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                                      
            Region country = new Region();
            country.setPkRegion(rs.getInt("pk_country"));
            country.setName(rs.getString("name"));
            
            return country;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a contry by id", ex);
        }
    }
    
    public Region getProvinceById(int id) {
        String sql = "SELECT * FROM province WHERE pk_province = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                            
            Region province = new Region();
            province.setPkRegion(rs.getInt("pk_province"));
            province.setName(rs.getString("name"));
            province.setFkRegion(rs.getInt("fk_country"));
            
            return province;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a province by id", ex);
        }
    }
    
    public Region getMunicipalityById(int id) {
        String sql = "SELECT * FROM municipality WHERE pk_municipality = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                            
            Region municipality = new Region();
            municipality.setPkRegion(rs.getInt("pk_municipality"));
            municipality.setName(rs.getString("name"));
            municipality.setFkRegion(rs.getInt("fk_province"));
            
            return municipality;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a municipality by id", ex);
        }
    }
    
    public Region getCommuneById(int id) {
        String sql = "SELECT * FROM commune WHERE pk_commune = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                            
            Region commune = new Region();
            commune.setPkRegion(rs.getInt("pk_commune"));
            commune.setName(rs.getString("name"));
            commune.setFkRegion(rs.getInt("fk_municipality"));
            
            return commune;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a municipality by id", ex);
        }
    }
    
    public Region getNeighborhoodById(int id) {
        String sql = "SELECT * FROM neighborhood WHERE pk_neighborhood = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
                            
            Region neighborhood = new Region();
            neighborhood.setPkRegion(rs.getInt("pk_neighborhood"));
            neighborhood.setName(rs.getString("name"));
            neighborhood.setFkRegion(rs.getInt("fk_commune"));
            
            return neighborhood;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get a municipality by id", ex);
        }
    }
    
    public List<Region> getProvincesById(int id) {
        String sql = "SELECT * FROM province WHERE fk_country = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Region> regions = new ArrayList<>();
            
            do 
            {                
                Region region = new Region();
                region.setPkRegion(rs.getInt("pk_province"));
                region.setName(rs.getString("name"));
                region.setFkRegion(rs.getInt("fk_country"));
                regions.add(region);
            } 
            while (rs.next());
            
            return regions;            
            
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get provinces by id", ex);
        }
    }
    
    public List<Region> getMunicipalitiesById(int id) {
        String sql = "SELECT * FROM municipality WHERE fk_province = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Region> regions = new ArrayList<>();
            
            do 
            {                
                Region region = new Region();
                region.setPkRegion(rs.getInt("pk_municipality"));
                region.setName(rs.getString("name"));
                region.setFkRegion(rs.getInt("fk_province"));
                regions.add(region);
            } 
            while (rs.next());
            
            return regions;            
            
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get municipalities by id", ex);
        }
    }
    
    public List<Region> getCommunesById(int id) {
        String sql = "SELECT * FROM commune WHERE fk_municipality = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Region> regions = new ArrayList<>();
            
            do 
            {                
                Region region = new Region();
                region.setPkRegion(rs.getInt("pk_commune"));
                region.setName(rs.getString("name"));
                region.setFkRegion(rs.getInt("fk_municipality"));
                regions.add(region);
            } 
            while (rs.next());
            
            return regions;            
            
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get communes by id", ex);
        }
    }
    
    public List<Region> getNeighborhoodsById(int id) {
        String sql = "SELECT * FROM neighborhood WHERE fk_commune = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Region> regions = new ArrayList<>();
            
            do 
            {                
                Region region = new Region();
                region.setPkRegion(rs.getInt("pk_neighborhood"));
                region.setName(rs.getString("name"));
                region.setFkRegion(rs.getInt("fk_commune"));
                regions.add(region);
            } 
            while (rs.next());
            
            return regions;            
            
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Fail to get neighborhood by id", ex);
        }
    }
}
