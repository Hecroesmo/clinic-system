<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

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
        List<Drug> drugs = new DrugDao(connection).getAllDrugs();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
<%
        if (drugs != null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Lista de Fármacos</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <tbody>
                    
<%
                    for (Drug drug : drugs) {
%>
                        <tr>
                            <td><%= drug.getPkDrug() %></td>
                            <td><%= drug.getName() %></td>
                            <td><%= drug.getDescription() %></td>
                            <td><%= drug.getCategory().getName() %></td>
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
