package edu.ucan.medical.servlet;

import edu.ucan.medical.interface_.Logic;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tio-hecro
 */
@WebServlet("/mvc")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException 
    {
        final String parameter = req.getParameter("logic");
        final String className = "edu.ucan.medical.logic." + parameter;

        try 
        {
            Class<?> clazz = Class.forName(className);
            Logic logic = (Logic) clazz.getDeclaredConstructor().newInstance();

            String page = logic.execute(req, resp);
            req.getRequestDispatcher(page).forward(req, resp);
        } 
        catch (
            IOException | ClassNotFoundException | IllegalAccessException |
            IllegalArgumentException | InstantiationException |
            NoSuchMethodException | SecurityException |
            InvocationTargetException | ServletException e) 
        {
            throw new RuntimeException("Fail to process " + className + " logic", e);
        }
    }
}
