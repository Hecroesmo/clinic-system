<%-- 
    Document   : insert
    Created on : Jan 9, 2022, 3:59:46 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.DrugDao"%>
<%@page import="edu.ucan.medical.model.Drug"%>
<%@page import="edu.ucan.medical.dao.ConsultationDao"%>
<%@page import="edu.ucan.medical.model.Person"%>
<%@page import="edu.ucan.medical.dao.PatientDao"%>
<%@page import="edu.ucan.medical.dao.DoctorDao"%>
<%@page import="edu.ucan.medical.model.Doctor"%>
<%@page import="edu.ucan.medical.dao.ConsultationTypeDao"%>
<%@page import="edu.ucan.medical.model.ConsultationType"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Consulta</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
    
        <div style="margin-top: 1em" class="container">
                <h1>Salvar Consulta</h1>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<ConsultationType> types = new ConsultationTypeDao(connection).
                getAllConsultationTypes();
        
        List<Doctor> doctors = new DoctorDao(connection).getAllDoctors();
        List<Person> patients = new PatientDao(connection).getAllPatients();
        List<Drug> drugs = new DrugDao(connection).getAllDrugs();
%>
            <form action="<c:url value="/mvc?logic=SaveConsultationLogic"/>"
                    method="Post">  
                
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
                    <label for="patient" class="form-label">Paciente</label>
                    <select id="patient" class="form-select" name="patient">
                    <option selected>Select ...</option>
<%
                    for (Person patient : patients) {
%>
                        <option value="<%= patient.getIdentifyCardNumber() %>">
                            <%= patient.getFirstName() +" "+ patient.getLastName() %>
                        </option>
<%
                    }
%>
                    </select>
                </div>
                <div class="col mb-3">
                    <label for="type" class="form-label">Tipo Consulta</label>
                    <select id="type" class="form-select" name="type">
                    <option selected>Select ...</option>
<%
                    for (ConsultationType type : types) {
%>
                        <option value="<%= type.getPkConsultationType() %>">
                            <%= type.getDescription() %>
                        </option>
<%
                    }
%>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="date" class="form-label">Data & Hora</label>
                    <input id="date" type="datetime-local" class="form-control"
                        name="date" >
                </div>
                    
                <div class="col mb-3">
                    <label for="drug" class="form-label">Fármacos</label>
                    <select id="drug" class="form-select" name="drugs" multiple="true">
<%
                    for (Drug drug : drugs) {
%>
                        <option value="<%= drug.getPkDrug() %>">
                            <%= drug.getName() +" - "+ drug.getCategory().getName() %>
                        </option>
<%
                    }
%>
                    </select>
                </div>
                                    
                    <button style="margin-bottom: 1em" type="submit"
                        class="btn btn-primary">Salvar</button>
            </form>
        </div>
    </body>
</html>
