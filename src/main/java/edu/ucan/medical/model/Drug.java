package edu.ucan.medical.model;

import java.io.Serializable;

/**
 * @author tio-hecro
 */
public class Drug implements Serializable {
    private int pkDrug;
    private String name;
    private String description;
    private Category category;
    
    public Drug() {}
     
    public Drug(int pkDrug, String name, String descrption) {
        this.pkDrug = pkDrug;
        this.name = name;
        this.description = descrption;
    }

    public Drug(int pkDrug, String name, String description, Category category) {
        this.pkDrug = pkDrug;
        this.name = name;
        this.description = description;
        this.category = category;
    }

    public int getPkDrug() {
        return pkDrug;
    }

    public void setPkDrug(int pkDrug) {
        this.pkDrug = pkDrug;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Drug{" + "pkDrug=" + pkDrug + ", name=" + name +
            ", description=" + description + ", category=" + category + '}';
    }
}
