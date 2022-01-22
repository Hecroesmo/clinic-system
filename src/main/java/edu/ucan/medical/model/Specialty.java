package edu.ucan.medical.model;

import java.io.Serializable;

/**
 * @author tio-hecro
 */
public class Specialty implements Serializable {
    private int pkSpecialty;
    private String name;

    public Specialty() {}
    
    public Specialty(int pkSpecialty) {
        this.pkSpecialty = pkSpecialty;
    }

    public Specialty(int pkSpecialty, String name) {
        this.pkSpecialty = pkSpecialty;
        this.name = name;
    }

    public int getPkSpecialty() {
        return pkSpecialty;
    }

    public void setPkSpecialty(int pkSpecialty) {
        this.pkSpecialty = pkSpecialty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Specialty{" + "pkSpecialty=" + pkSpecialty + ", name=" + name + '}';
    }    
    
}
