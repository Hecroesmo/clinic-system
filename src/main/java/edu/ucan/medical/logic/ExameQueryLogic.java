package edu.ucan.medical.logic;

import edu.ucan.medical.interface_.Logic;
import edu.ucan.medical.model.Person;
import edu.ucan.medical.query.QueryDao;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tio-hecro
 */
public class ExameQueryLogic implements Logic {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        int fMonth = Integer.parseInt(req.getParameter("month1"));
        int sMonth = Integer.parseInt(req.getParameter("month2"));
        String year = req.getParameter("year");
        String doctor = req.getParameter("doctor");
        int province = Integer.parseInt(req.getParameter("province"));
        
        int yearInt = Integer.parseInt(year.split("-")[0]);        
        
        Connection connection = (Connection) req.getAttribute("connection");
        
        List<Person> patients = new QueryDao(connection).examQuery(
            fMonth, sMonth, yearInt, doctor, province);
        
        req.setAttribute("patients", patients);
        
        return "list-patients-exam.jsp";
    }
    
}
