package edu.ucan.medical.model;

/**
 * @author tio-hecro
 */
public class Doctor extends Person {
    private String taxIdentificationNumber;
    private Specialty specialty;
    
    public Doctor() {}
    
    public Doctor(String taxIdentificationNumber) {
        this.taxIdentificationNumber = taxIdentificationNumber;
    }

    public Doctor(String taxIdentificationNumber, Specialty specialty) {
        this.taxIdentificationNumber = taxIdentificationNumber;
        this.specialty = specialty;
    }

    public String getTaxIdentificationNumber() {
        return taxIdentificationNumber;
    }

    public void setTaxIdentificationNumber(String TaxIdentificationNumber) {
        this.taxIdentificationNumber = TaxIdentificationNumber;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    @Override
    public String toString() {
        return "Doctor{" + "taxIdentificationNumber=" + taxIdentificationNumber +
            ", specialty=" + specialty + '}';
    }
}
