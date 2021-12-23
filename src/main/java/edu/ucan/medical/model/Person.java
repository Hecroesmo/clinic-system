package edu.ucan.medical.model;

/**
 * @author tio-hecro
 */
public class Person {
    private String identifyCardNumber;
    private String name;
    private String phoneNumber;
    private Region country;
    private Region province;
    private Region municipality;
    private Region commune;
    private Region neighborhood;

    public Person() {}

    public Person(String identifyCardNumber, String name, String phoneNumber) {
        this.identifyCardNumber = identifyCardNumber;
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public Person(String name, String phoneNumber, Region country,
        Region province, Region municipality, Region commune, Region neighborhood) 
    {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.country = country;
        this.province = province;
        this.municipality = municipality;
        this.commune = commune;
        this.neighborhood = neighborhood;
    }

    public String getIdentifyCardNumber() {
        return identifyCardNumber;
    }

    public void setIdentifyCardNumber(String identifyCardNumber) {
        this.identifyCardNumber = identifyCardNumber;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Region getCountry() {
        return country;
    }

    public void setCountry(Region country) {
        this.country = country;
    }

    public Region getProvince() {
        return province;
    }

    public void setProvince(Region province) {
        this.province = province;
    }

    public Region getMunicipality() {
        return municipality;
    }

    public void setMunicipality(Region municipality) {
        this.municipality = municipality;
    }

    public Region getCommune() {
        return commune;
    }

    public void setCommune(Region commune) {
        this.commune = commune;
    }

    public Region getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(Region neighborhood) {
        this.neighborhood = neighborhood;
    }

    @Override
    public String toString() {
        return "Person{" + "identifyCardNumber=" + identifyCardNumber + ", name=" + name + ", phoneNumber=" + phoneNumber + ", country=" + country + ", province=" + province + ", municipality=" + municipality + ", commune=" + commune + ", neighborhood=" + neighborhood + '}';
    }
}
