<%-- 
    Document   : insert
    Created on : Dec 28, 2021, 11:01:18 AM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.utility.RegionUtility"%>
<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.Region" id="country" scope="page" />

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inserir País</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="*" name="country"></jsp:setProperty>
<%          
        if (country.getName() == null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Cadastrar País</h1>
            
            <form action="insert-country.jsp" method="Post">
                <div class="row">
                    <div class="col mb-3">
                        <label for="name" class="form-label">País</label>
                        <input type="text" name="name" class="form-control">
                    </div>
                </div>
                        
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
<%
        }
        else {
            Connection connection = (Connection) request.getAttribute("connection");
            new RegionDao(connection).save(country, RegionUtility.INSERT_REGION[0]);
%>
            <jsp:forward page="list-countries.jsp" />
<%
        }
%>
    </body>
</html>
