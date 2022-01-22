/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ucan.medical.servlet;

import com.google.gson.Gson;
import edu.ucan.medical.dao.RegionDao;
import edu.ucan.medical.model.Region;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tio-hecro
 */

@WebServlet(name = "RegionResponseServlet", urlPatterns = {"/RegionResponseServlet"})
public class RegionResponseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("application/json");
        
        int id  = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
		
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<Region> region = null;
   
        if ("province".equals(name)) {
            region = new RegionDao(connection).getProvincesById(id);
        }
        
        else if ("municipality".equals(name)) {
            region = new RegionDao(connection).getMunicipalitiesById(id);
        }
        
        else if ("commune".equals(name)) {
            region = new RegionDao(connection).getCommunesById(id);
        }
        
        else if ("neighborhood".equals(name)) {
            region = new RegionDao(connection).getNeighborhoodsById(id);
        }

        Gson gson = new Gson();
        String RegionJson = gson.toJson(region);

        Writer writer = response.getWriter();
        writer.write(RegionJson);
    }
}
