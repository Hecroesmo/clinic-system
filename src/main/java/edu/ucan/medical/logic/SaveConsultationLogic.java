package edu.ucan.medical.logic;

import edu.ucan.medical.dao.ConsultationDao;
import edu.ucan.medical.dao.DrugsConsultationDao;
import edu.ucan.medical.interface_.Logic;
import edu.ucan.medical.model.Consultation;
import edu.ucan.medical.model.ConsultationType;
import edu.ucan.medical.model.Doctor;
import edu.ucan.medical.model.Person;
import java.sql.Connection;
import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tio-hecro
 */

public class SaveConsultationLogic implements Logic {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        Consultation consultation = new Consultation();
        setConsultationData(req, consultation);
        
        Connection connection = (Connection) req.getAttribute("connection");

        ConsultationDao consultDao = new ConsultationDao(connection);
        DrugsConsultationDao drugsConsultsDao = new DrugsConsultationDao(connection);
        
        consultDao.save(consultation);
        
        consultation = consultDao.getConsultationById(consultation.getDateAndTime(),
            consultation.getPatient().getIdentifyCardNumber());
        
        String drugs [] = req.getParameterValues("drugs");
        for (String drug : drugs) {
            
            drugsConsultsDao.save(consultation.getPkConsultation(),
                Integer.parseInt(drug));
        }
        
        return "consultation/list-consultations.jsp";
    }
    
    
    
    //  support methods --------------------------------------------------------
    
    public void setConsultationData (HttpServletRequest req,
        Consultation consultation) 
    {
        Doctor doctor = new Doctor(req.getParameter("doctor"));
        Person patient = new Person(req.getParameter("patient"));
        int pkConsultationType = Integer.parseInt(req.getParameter("type"));
        String dateAndTime = req.getParameter("date");
        
        ConsultationType type = new ConsultationType(pkConsultationType);        
        
        consultation.setDateAndTime(LocalDateTime.parse(dateAndTime));
        consultation.setDoctor(doctor);
        consultation.setPatient(patient);
        consultation.setConsultationType(type);
    }
}
