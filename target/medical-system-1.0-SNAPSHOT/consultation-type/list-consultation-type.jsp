<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.ConsultationTypeDao"%>
<%@page import="edu.ucan.medical.model.ConsultationType"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Tipos de Consultas</title>
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<ConsultationType> consultationTypes = new ConsultationTypeDao(connection).
            getAllConsultationTypes();

        if (consultationTypes != null) {
%>
        <div style="margin-top: 2em" class="container">
            <a style="margin-bottom: 1em" class="btn btn-primary" href="insert-consultation-type.jsp">Cadastrar Tipo Consulta</a>
            <h1>Lista de Tipo de Consultas</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                    </tr>
                </thead>
                <tbody>
                    
<%
                    for (ConsultationType consultationType : consultationTypes) {
%>
                        <tr>
                            <td><%= consultationType.getPkConsultationType() %></td>
                            <td><%= consultationType.getDescription() %></td>
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
