package edu.ucan.medical.dao;

import edu.ucan.medical.model.Consultation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author tio-hecro
 */
public class ConsultationDao {
    private final Connection connection;
    private PreparedStatement statement;

    public ConsultationDao(Connection connection) {
        this.connection = connection;
    }
    
    public void save (Consultation consultation) {
        String sql = "INSERT INTO consultation (fk_doctor,"
            + " fk_patient, fk_consultation_type, date_and_time) values (?,?,?,?)";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            setConsultationData(consultation);
            statement.executeUpdate();
        } 
        catch (SQLException ex) {
            Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Consultation getConsultationById(LocalDateTime dateAndTime,
            String identifyCardNumber) 
    {
        String sql = "SELECT * FROM consultation"
            + " WHERE date_and_time = ? AND fk_patient = ?";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            statement.setTimestamp(1, Timestamp.valueOf(dateAndTime));
            statement.setString(2, identifyCardNumber);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            DoctorDao doctorDao = new DoctorDao(connection);
            PatientDao patientDao = new PatientDao(connection);
            ConsultationTypeDao typeDao = new ConsultationTypeDao(connection);
            
            Consultation consultation = new Consultation();
            setConsultationData(consultation, rs, doctorDao, patientDao, typeDao);
           
            return consultation;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get consultation by id", ex);
        }
    }
    
    public List<Consultation> getAllConsultations () {
        String sql = "SELECT * FROM consultation";
        
        try 
        {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next() == false) return null;
            
            List<Consultation> consultations = new ArrayList<>();
            DoctorDao doctorDao = new DoctorDao(connection);
            PatientDao patientDao = new PatientDao(connection);
            ConsultationTypeDao typeDao = new ConsultationTypeDao(connection);
            
            do
            {                
                Consultation consultation = new Consultation();
                setConsultationData(consultation, rs, doctorDao, patientDao, typeDao);
                consultations.add(consultation);
            }
            while (rs.next());
            
            return consultations;
        } 
        catch (SQLException ex) {
            throw new RuntimeException("Failed to get all consultations", ex);
        }
    }
    
    //  support methods --------------------------------------------------------
    
    public void setConsultationData(Consultation consultation) throws SQLException 
    {
        statement.setString(1, consultation.getDoctor().getTaxIdentificationNumber());
        statement.setString(2, consultation.getPatient().getIdentifyCardNumber());
        statement.setInt(3, consultation.getConsultationType().getPkConsultationType());
        statement.setTimestamp(4, Timestamp.valueOf(consultation.getDateAndTime()));
    }
    
    public void setConsultationData(Consultation consultation, ResultSet rs,
        DoctorDao doctorDao, PatientDao patientDao, ConsultationTypeDao typeDao) 
            throws SQLException 
    {
        consultation.setPkConsultation(rs.getInt("pk_consultation"));
                
        consultation.setDoctor(doctorDao.getDoctorByTaxIdentificationNumber(
            rs.getString("fk_doctor")));

        consultation.setPatient(patientDao.getPatientByIdentifyCardNumber(
            rs.getString("fk_patient")));

        consultation.setConsultationType(
            typeDao.getConsultationTypeById(rs.getInt("fk_consultation_type")));

        consultation.setDateAndTime(rs.getTimestamp("date_and_time").toLocalDateTime());
    }
}
