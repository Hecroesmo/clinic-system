<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.ucan.medical.dao.ConsultationDao"%>
<%@page import="edu.ucan.medical.model.Consultation"%>
<%@page import="edu.ucan.medical.dao.DrugDao"%>
<%@page import="edu.ucan.medical.model.Drug"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Farmacos</title>
    </head>
    <body>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        List<Consultation> consultations = new ConsultationDao(connection).getAllConsultations();
        
        if (consultations != null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Lista de Consultas</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Medico/a</th>
                        <th>Paciente</th>
                        <th>Tipo Consulta</th>
                        <th>Data</th>
                    </tr>
                </thead>
                <tbody>
<%
                for (Consultation consultation : consultations) {
%>
                    <tr>
                        <td><%= consultation.getPkConsultation() %></td>
                        <td><%= "Dr. " + consultation.getDoctor().getLastName() %></td>
                        <td><%= consultation.getPatient().getLastName() %></td>
                        <td><%= consultation.getConsultationType().getDescription() %></td>
                        <td><%= consultation.getDateAndTime() %></td>
                    </tr>
<%
                }
%>     
                </tbody>
            </table>
<%
        }
        else {
%>
            <p style="margin-top: 10em" class="text-center">Sem dados ...</p>
<%
        }
%>
        </div>
    </body>
</html>
