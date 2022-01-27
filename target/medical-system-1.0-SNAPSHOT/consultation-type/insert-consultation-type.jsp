<%-- 
    Document   : insert
    Created on : Jan 9, 2022, 3:59:46 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.ConsultationTypeDao"%>
<%@page import="edu.ucan.medical.dao.SpecialtyDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.ConsultationType"
    id="consultationType" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Tipo de Consulta</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="*" name="consultationType"/>
    
        <div style="margin-top: 1em" class="container">
            <h1>Salvar Tipo de Consulta</h1>
            
<%
        if (consultationType.getDescription() == null) {
%>
            <form action="insert-consultation-type.jsp" method="Post">
                <div class="mb-3">
                    <label for="description" class="form-label">Nome</label>
                    <input id="description" type="text" class="form-control" name="description">
                </div>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
<%
        }
        else 
        {
            Connection connection = (Connection) request.getAttribute("connection");
            new ConsultationTypeDao(connection).save(consultationType);
%>
            <jsp:forward page="list-consultation-type.jsp" />
<%
        }
%>
        </div>
    </body>
</html>
