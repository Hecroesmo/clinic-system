<%-- 
    Document   : insert-doctor
    Created on : Jan 9, 2022, 6:45:24 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.PatientDao"%>
<%@page import="edu.ucan.medical.dao.PersonDao"%>
<%@page import="edu.ucan.medical.model.Person"%>
<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="java.util.List"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.Person" id="patient" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Paciente</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:setProperty property="identifyCardNumber" name="patient"/>
        <jsp:setProperty property="phoneNumber" name="patient"/>
        <jsp:setProperty property="firstName" name="patient"/>
        <jsp:setProperty property="lastName" name="patient"/>
<%  
        Connection connection = (Connection) request.getAttribute("connection");
        List<Region> countries = new RegionDao(connection).getCountries();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <div style="margin-top: 2em" class="container">
            <h1>Inserir Paciente</h1>
            
<%
        if (patient.getIdentifyCardNumber() == null) {
%>

            <form action="insert-patient.jsp" method="Post">
                <div class="row">
                    <div class="col mb-3">
                        <label for="idCardNum" class="form-label">Número B.I</label>
                        <input type="text" id="idCardNum" class="form-control" name="identifyCardNumber">
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
            int pkCountry = Integer.parseInt(request.getParameter("country"));
            int pkProvince = Integer.parseInt(request.getParameter("province"));
            int pkMunicipality = Integer.parseInt(request.getParameter("municipality"));
            int pkCommune = Integer.parseInt(request.getParameter("commune"));
            int pkNeighborhood = Integer.parseInt(request.getParameter("neighborhood"));
           
            patient.setCountry(new Region(pkCountry));
            patient.setProvince(new Region(pkProvince));
            patient.setMunicipality(new Region(pkMunicipality));
            patient.setCommune(new Region(pkCommune));
            patient.setNeighborhood(new Region(pkNeighborhood));
            
            new PersonDao(connection).save(patient);
            new PatientDao(connection).save(patient);
%>
            <jsp:forward page="list-patients.jsp" />
<%
        }
%>
        </div>
        <script src="<c:url value="/js/fetch-contry.js"/>"></script>
    </body>
</html>
