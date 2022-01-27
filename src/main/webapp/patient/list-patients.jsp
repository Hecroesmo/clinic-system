<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.PatientDao"%>
<%@page import="edu.ucan.medical.dao.PersonDao"%>
<%@page import="edu.ucan.medical.model.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listas de Medicos</title>
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        List<Person> patients = new PatientDao(connection).getAllPatients();

        if (patients != null) {
%>
        <div style="margin-top: 2em" class="container">
            <a style="margin-bottom: 1em" class="btn btn-primary" href="insert-patient.jsp">Cadastrar Paciente</a>
            <h1>Lista de Pacientes</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Numero B.I</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Tel</th>
                        <th>País</th>
                        <th>Provincia</th>
                        <th>Municipio</th>
                        <th>Comuna</th>
                        <th>Bairro</th>
                    </tr>
                </thead>
                <tbody>
                    
<%
                for (Person patient : patients) {
%>
                    <tr>
                        <td><%= patient.getIdentifyCardNumber() %></td>
                        <td><%= patient.getFirstName() %></td>
                        <td><%= patient.getLastName() %></td>
                        <td><%= patient.getPhoneNumber() %></td>
                        <td><%= patient.getCountry().getName() %></td>
                        <td><%= patient.getProvince().getName() %></td>
                        <td><%= patient.getMunicipality().getName() %></td>
                        <td><%= patient.getCommune().getName() %></td>
                        <td><%= patient.getNeighborhood().getName() %></td>
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
