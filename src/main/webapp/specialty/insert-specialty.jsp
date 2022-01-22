<%-- 
    Document   : insert
    Created on : Jan 9, 2022, 3:59:46 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.SpecialtyDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.Specialty" id="specialty" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir especialidade</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="*" name="specialty"/>
    
        <div style="margin-top: 1em" class="container">
            <h1>Salvar Especialidade</h1>
            
<%
        if (specialty.getName() == null) {
%>
            <form action="insert-specialty.jsp" method="Post">
                <div class="mb-3">
                    <label for="region" class="form-label">Nome</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
<%
        }
        else 
        {
            Connection connection = (Connection) request.getAttribute("connection");
            new SpecialtyDao(connection).save(specialty);
%>
            <jsp:forward page="list-specialties.jsp" />
<%
        }
%>
        </div>
    </body>
</html>
