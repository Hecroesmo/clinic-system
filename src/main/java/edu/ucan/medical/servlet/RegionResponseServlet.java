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
        
        List<Region> regions = null;
        RegionDao regionDao = new RegionDao(connection);
        regions = findWhatRegionIsSelected(regionDao, regions, id, name);

        Gson gson = new Gson();
        String RegionJson = gson.toJson(regions);

        Writer writer = response.getWriter();
        writer.write(RegionJson);
    }
    
    
    //  support methods --------------------------------------------------------
    
    private List<Region> findWhatRegionIsSelected (RegionDao regionDao,
        List<Region> regions, int id, String name) 
    {
        
        if (null != name) switch (name) {
            case "province":
                regions = regionDao.getProvincesById(id);
                break;
            case "municipality":
                regions = regionDao.getMunicipalitiesById(id);
                break;
            case "commune":
                regions = regionDao.getCommunesById(id);
                break;
            case "neighborhood":
                regions = regionDao.getNeighborhoodsById(id);
                break;
            default:
                break;
        }
        
        return regions;
    }
}
