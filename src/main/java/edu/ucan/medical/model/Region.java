package edu.ucan.medical.model;

import java.io.Serializable;

/**
 * @author tio-hecro
 */
public class Region implements Serializable {
    private int pkRegion;
    private String name;
    private int fkRegion;

    public Region() {}
    
    public Region(int pkRegion) {
        this.pkRegion = pkRegion;
    }

    public Region(int pkRegion, String name, int fkRegion) {
        this.pkRegion = pkRegion;
        this.name = name;
        this.fkRegion = fkRegion;
    }

    public int getPkRegion() {
        return pkRegion;
    }

    public void setPkRegion(int pkRegion) {
        this.pkRegion = pkRegion;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFkRegion() {
        return fkRegion;
    }

    public void setFkRegion(int fkRegion) {
        this.fkRegion = fkRegion;
    }

    @Override
    public String toString() {
        return "Region{" + "pkRegion=" + pkRegion + ", nome=" + name + ", fkRegion=" + fkRegion + '}';
    }   
}
