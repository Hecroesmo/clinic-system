<%-- 
    Document   : insert-doctor
    Created on : Jan 9, 2022, 6:45:24 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.utility.RegionUtility"%>
<%@page import="edu.ucan.medical.dao.PersonDao"%>
<%@page import="edu.ucan.medical.model.Person"%>
<%@page import="edu.ucan.medical.dao.SpecialtyDao"%>
<%@page import="edu.ucan.medical.model.Specialty"%>
<%@page import="edu.ucan.medical.dao.DoctorDao"%>
<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="java.util.List"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.Doctor" id="doctor" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Doctor</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
        <jsp:setProperty property="identifyCardNumber" name="doctor"/>
        <jsp:setProperty property="taxIdentificationNumber" name="doctor"/>
        <jsp:setProperty property="phoneNumber" name="doctor"/>
        <jsp:setProperty property="firstName" name="doctor"/>
        <jsp:setProperty property="lastName" name="doctor"/>
<%  
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<Region> countries = new RegionDao(connection).getAllRegions(
            RegionUtility.SELECT_REGION[0],
            RegionUtility.PK_REGION[0],
            RegionUtility.FK_REGION[0]
        );
        
        List<Specialty> specialties = new SpecialtyDao(connection).getAllSpecialty();

        if (doctor.getIdentifyCardNumber() == null || 
                doctor.getTaxIdentificationNumber() == null) {
%>
         <div style="margin-top: 2em" class="container">
            <h1>Inserir Medico</h1>
            <form action="insert-doctor.jsp" method="Post">
                <div class="row">
                    <div class="col mb-3">
                        <label for="idCardNum" class="form-label">Número B.I</label>
                        <input type="text" id="idCardNum" class="form-control" name="identifyCardNumber">
                    </div>
                    <div class="col mb-3">
                        <label for="nif" class="form-label">Número Id. Fiscal</label>
                        <input type="text" id="nif" class="form-control" name="taxIdentificationNumber">
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        <label for="fname" class="form-label">Nome</label>
                        <input type="text" id="fname" class="form-control" name="firstName">
                    </div>
                    <div class="col mb-3">
                        <label for="lname" class="form-label">Sobrenome</label>
                        <input type="text" id="lname" class="form-control" name="lastName">
                    </div>
                </div>

                <div class="row">
                    <div class="col mb-3">
                        <label for="phoneNumber" class="form-label">Tel</label>
                        <input type="phoneNumber" id="fname" class="form-control" name="phoneNumber">
                    </div>
                    <div class="col mb-3">
                        <label for="specialty" class="form-label">Especialidade</label>
                        <select class="form-select" id="specialty" name="specialty">
                        <option selected>Select ...</option>
<%
                        for (Specialty specialty : specialties) {
%>
                            <option value="<%= specialty.getPkSpecialty() %>">
                                <%= specialty.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col mb-3">
                        <label for="country" class="form-label">País</label>
                        <select class="form-select" id="country" name="country">
                        <option selected>Select ...</option>
<%
                        for (Region country : countries) {
%>
                            <option value="<%= country.getPkRegion() %>">
                                <%= country.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="provincy" class="form-label">Provincia</label>
                        <select class="form-select" id="province" name="province">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        <label for="municipality" class="form-label">Municipio</label>
                        <select class="form-select" id="municipality" name="municipality">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="commune" class="form-label">Comuna</label>
                        <select class="form-select" id="commune" name="commune">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="neighborhood" class="form-label">Bairro</label>
                        <select class="form-select" id="neighborhood" name="neighborhood">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
<%
        }
        else 
        {
            int pkSpecialty = Integer.parseInt(request.getParameter("specialty"));
            int pkCountry = Integer.parseInt(request.getParameter("country"));
            int pkProvince = Integer.parseInt(request.getParameter("province"));
            int pkMunicipality = Integer.parseInt(request.getParameter("municipality"));
            int pkCommune = Integer.parseInt(request.getParameter("commune"));
            int pkNeighborhood = Integer.parseInt(request.getParameter("neighborhood"));
           
            doctor.setSpecialty(new Specialty(pkSpecialty));
            doctor.setCountry(new Region(pkCountry));
            doctor.setProvince(new Region(pkProvince));
            doctor.setMunicipality(new Region(pkMunicipality));
            doctor.setCommune(new Region(pkCommune));
            doctor.setNeighborhood(new Region(pkNeighborhood));
            
            new PersonDao(connection).save(doctor);
            new DoctorDao(connection).save(doctor);
%>
            <jsp:forward page="list-doctors.jsp" />
<%
        }
%>
        </div>
        <script src="<c:url value="/js/fetch-contry.js"/>"></script>
    </body>
</html>
