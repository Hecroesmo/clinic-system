/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ucan.medical.servlet;

import edu.ucan.medical.interface_.Logic;
import java.io.IOException;
import java.io.PrintWriter;
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
        String parameter = req.getParameter("logic");
        String className = "restaurant.logic." + parameter;

        try 
        {
            Class<?> clazz = Class.forName(className);
            Logic logic = (Logic) clazz.getDeclaredConstructor().newInstance();

            String page = logic.execute(req, resp);
            req.getRequestDispatcher(page).forward(req, resp);
        } 
        catch (Exception e) 
        {
            throw new ServletException("Fail to process " + className + " logic", e);
        }
    }
    

}
