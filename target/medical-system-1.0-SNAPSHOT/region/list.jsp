<%-- 
    Document   : list
    Created on : Jan 9, 2022, 2:18:03 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Regiões</title>
        <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    </head>
    <body>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        RegionDao dao = new RegionDao(connection);
        List<Region> countries = dao.getCountries();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <div style="margin-top: 1em;" class="container">
            <h1>Listas de Regiões</h1>
            <div class="container">
                <table class="table table-striped table-sm">
                <legend>Países</legend>
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                </tr>
                </thead>
                <tbody>
<%
                for (Region country : countries) {             
%>
                    <tr>
                        <td><%= country.getPkRegion() %></td>
                        <td><%= country.getName() %></td>
                    </tr>
<%
                }
%>
                </tbody>
              </table>
            </div>
                
            <div class="container">
                <table class="table table-striped table-sm">
                <legend>Provincias</legend>
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                </tr>
                </thead>
                <tbody>
<%
                for (Region country : countries) {             
%>
                    <tr>
                        <td><%= country.getPkRegion() %></td>
                        <td><%= country.getName() %></td>
                    </tr>
<%
                }
%>
                </tbody>
              </table>
            </div>
        </div>
    </body>
</html>
