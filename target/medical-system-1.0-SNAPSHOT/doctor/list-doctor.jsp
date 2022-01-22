<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.DoctorDao"%>
<%@page import="edu.ucan.medical.model.Doctor"%>
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
<%
        Connection connection = (Connection) request.getAttribute("connection");
        List<Doctor> doctors = new DoctorDao(connection).getAllDoctors();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
<%
        if (doctors != null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Lista de Medicos</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>N.I.F</th>
                        <th>Numero B.I</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Tel</th>
                        <th>Especialidade</th>
                        <th>País</th>
                        <th>Provincia</th>
                        <th>Municipio</th>
                        <th>Comuna</th>
                        <th>Bairro</th>
                    </tr>
                </thead>
                <tbody>
                    
<%
                for (Doctor doctor : doctors) {
%>
                    <tr>
                        <td><%= doctor.getTaxIdentificationNumber() %></td>
                        <td><%= doctor.getIdentifyCardNumber() %></td>
                        <td><%= doctor.getFirstName() %></td>
                        <td><%= doctor.getLastName() %></td>
                        <td><%= doctor.getPhoneNumber() %></td>
                        <td><%= doctor.getSpecialty().getName() %></td>
                        <td><%= doctor.getCountry().getName() %></td>
                        <td><%= doctor.getProvince().getName() %></td>
                        <td><%= doctor.getMunicipality().getName() %></td>
                        <td><%= doctor.getCommune().getName() %></td>
                        <td><%= doctor.getNeighborhood().getName() %></td>
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
