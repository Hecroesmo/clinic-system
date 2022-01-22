package edu.ucan.medical.model;

import java.io.Serializable;

/**
 * @author tio-hecro
 */
public class Category implements Serializable {
    private int pkCategory;
    private String name;
    
    public Category() {}

    public Category(int pkCategory, String name) {
        this.pkCategory = pkCategory;
        this.name = name;
    }
    
    public int getPkCategory() {
        return pkCategory;
    }

    public void setPkCategory(int pkCategory) {
        this.pkCategory = pkCategory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category{" + "pkCategory=" + pkCategory + ", name=" + name + '}';
    } 
}
