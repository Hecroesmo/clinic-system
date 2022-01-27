<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.SpecialtyDao"%>
<%@page import="edu.ucan.medical.model.Specialty"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        List<Specialty> specialties = new SpecialtyDao(connection).getAllSpecialty();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
<%
        if (specialties != null) {
%>
        <div style="margin-top: 2em" class="container">
            <a style="margin-bottom: 1em" class="btn btn-primary" href="insert-specialty.jsp">Cadastrar Especialidade</a>
            <h1>Lista de Especialidades</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                    </tr>
                </thead>
                <tbody>
                    
<%
                    for (Specialty specialty : specialties) {
%>
                        <tr>
                            <td><%= specialty.getPkSpecialty() %></td>
                            <td><%= specialty.getName() %></td>
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
