<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="edu.ucan.medical.model.Drug"%>
<%@page import="edu.ucan.medical.dao.DrugsConsultationDao"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receita</title>
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
        <div style="margin-top: 2em" class="container">

        <a style="margin-bottom: 1em" class="btn btn-primary"
           href="<c:url value="consultation/list-consultations.jsp" />">Listar Consultas</a>

        <h1>Receita</h1>
                
<%
            List<Drug> drugs = (List<Drug>) request.getAttribute("drugs");
            
            if (drugs != null) {
%>
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nome</th>
                            <th>Descrição</th>
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
                <p class="text-center">Sem dados ...</p>
<%
            }
%>  
        </div>
    </body>
</html>
