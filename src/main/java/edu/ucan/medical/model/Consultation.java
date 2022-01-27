package edu.ucan.medical.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

/**
 * @author tio-hecro
 */

public class Consultation implements Serializable {
    private int pkConsultation;
    private Doctor doctor;
    private Person patient;
    private ConsultationType consultationType;
    private Date date;
    private LocalDateTime dateAndTime;
    private List<Drug> drugs;
    
    public Consultation() {}

    public int getPkConsultation() {
        return pkConsultation;
    }

    public void setPkConsultation(int pkConsultation) {
        this.pkConsultation = pkConsultation;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Person getPatient() {
        return patient;
    }

    public void setPatient(Person patient) {
        this.patient = patient;
    }

    public ConsultationType getConsultationType() {
        return consultationType;
    }

    public void setConsultationType(ConsultationType consultationType) {
        this.consultationType = consultationType;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Drug> getDrugs() {
        return drugs;
    }

    public LocalDateTime getDateAndTime() {
        return dateAndTime;
    }

    public void setDateAndTime(LocalDateTime dateAndTime) {
        this.dateAndTime = dateAndTime;
    }

    public void setDrugs(List<Drug> drugs) {
        this.drugs = drugs;
    }
    
    @Override
    public String toString() {
        return "Consultation{" + "pkConsultation=" + pkConsultation +
            ", doctor=" + doctor + ", patient=" + patient +
            ", consultationType=" + consultationType + ", date=" + date + '}';
    }
}
