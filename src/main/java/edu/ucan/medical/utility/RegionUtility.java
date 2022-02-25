package edu.ucan.medical.utility;

/**
 * @author tio-hecro
 */
      
public class RegionUtility {
    
    public static final String [] INSERT_REGION = {
        "INSERT INTO country (name) VALUES (?)",
        "INSERT INTO province (name, fk_country) VALUES (?,?)",
        "INSERT INTO municipality (name, fk_province) VALUES (?,?)",
        "INSERT INTO commune (name, fk_municipality) VALUES (?,?)",
        "INSERT INTO neighborhood (name, fk_commune) VALUES (?,?)"
    };
    
    public static final String [] SELECT_REGION = {
        "SELECT * FROM country",
        "SELECT * FROM province",
        "SELECT * FROM municipality",
        "SELECT * FROM commune",
        "SELECT * FROM neighborhood"
    };
    
    public static final String [] PK_REGION = {
        "pk_country",
        "pk_province",
        "pk_municipality",
        "pk_commune",
        "pk_neighborhood"
    };
    
    public static final String [] FK_REGION = {
        "none",
        "fK_country",
        "fk_province",
        "fk_municipality",
        "fk_commune",
        "fk_neighborhood"
    };
}
