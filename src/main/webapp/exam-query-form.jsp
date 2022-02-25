<%-- 
    Document   : query1
    Created on : Feb 15, 2022, 2:25:15 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="edu.ucan.medical.utility.RegionUtility"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="edu.ucan.medical.dao.DoctorDao"%>
<%@page import="edu.ucan.medical.model.Doctor"%>
<%@page import="edu.ucan.medical.query.QueryDao"%>
<%@page import="edu.ucan.medical.model.Query1"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query1</title>
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
    </head>
    <body>        
        <%
            Connection connection = (Connection) request.getAttribute("connection");
            
            List<Region> provinces = new RegionDao(connection).getAllRegions(
            RegionUtility.SELECT_REGION[1],
            RegionUtility.PK_REGION[1],
            RegionUtility.FK_REGION[1]
        );
           
            List<Doctor> doctors = new DoctorDao(connection).getAllDoctors();
        %>
        <div class="container-sm">
            <h1>Consulta Exame</h1>
            <p></p>
        
            <form action="mvc?logic=ExameQueryLogic" method="Post">
                <input type="month" class="form-control" name="month1" placeholder="Primeiro mês"><br/>
                <input type="month" class="form-control" name="month2" placeholder="Segundo mês"><br/>
                <input type="date" class="form-control" name="year"><br/>
                <div class="col mb-3">
                    <label for="doctor" class="form-label">Medico</label>
                    <select id="doctor" class="form-select" name="doctor">
                        <option selected>Select ...</option>
<%
                        for (Doctor doctor : doctors) {
%>
                            <option value="<%= doctor.getTaxIdentificationNumber() %>">
                                <%= doctor.getFirstName() +" "+ doctor.getLastName() %>
                            </option>
<%
                        }
%>                  
                    </select>

                </div>

                 <div class="col mb-3">
                        <label for="country" class="form-label">Provincia</label>
                        <select class="form-select" id="country" name="province">
                        <option selected>Select ...</option>
<%
                        for (Region province : provinces) {
%>
                            <option value="<%= province.getPkRegion() %>">
                                <%= province.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                <input class="btn btn-primary" type="submit" value="Consultar">
            </form>
        </div>
    </body>
</html>
