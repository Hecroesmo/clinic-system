package edu.ucan.medical.logic;

import edu.ucan.medical.dao.DrugsConsultationDao;
import edu.ucan.medical.interface_.Logic;
import edu.ucan.medical.model.Drug;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tio-hecro
 */
public class GetPrescriptionByConsultationIdLogic implements Logic {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        int consultationId = Integer.parseInt(req.getParameter("id"));
        
        Connection connection = (Connection) req.getAttribute("connection");
        
        List<Drug> drugs = new DrugsConsultationDao(connection).
                getPrescriptionByConsultationId(consultationId);
        
        req.setAttribute("drugs", drugs);
        
        return "prescription/list-prescription.jsp";
    }
    
}
