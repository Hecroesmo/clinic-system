package edu.ucan.medical.model;

/**
 * @author tio-hecro
 */
public class Consultation {
    private int pkConsultation;
    private Doctor doctor;
    private Person patient;
    private ConsultationType consultationType;
    private String date;
    
    public Consultation() {}
    
    public Consultation(int pkConsultation, Doctor doctor, Person patient,
        ConsultationType consultationType, String date) 
    {
        this.pkConsultation = pkConsultation;
        this.doctor = doctor;
        this.patient = patient;
        this.consultationType = consultationType;
        this.date = date;
    }

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Consultation{" + "pkConsultation=" + pkConsultation + ", doctor=" + doctor + ", patient=" + patient + ", consultationType=" + consultationType + ", date=" + date + '}';
    }
}
