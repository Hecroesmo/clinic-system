package edu.ucan.medical.model;

import java.io.Serializable;

/**
 * @author tio-hecro
 */
public class ConsultationType implements Serializable {
    private int pkConsultationType;
    private String description;
    
    public ConsultationType() {}
    
    public ConsultationType(int pkConsultationType, String description) {
        this.pkConsultationType = pkConsultationType;
        this.description = description;
    }

    public int getPkConsultationType() {
        return pkConsultationType;
    }

    public void setPkConsultationType(int pkConsultationType) {
        this.pkConsultationType = pkConsultationType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ConsultationType{" + "pkConsultationType=" + pkConsultationType + ", description=" + description + '}';
    }
}
