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

<jsp:useBean class="edu.ucan.medical.model.Region" id="province" scope="page" />

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inserir Provincia</title>   
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="*" name="province"></jsp:setProperty>
        
<%          
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<Region> countries = new RegionDao(connection).getAllRegions(
            RegionUtility.SELECT_REGION[0],
            RegionUtility.PK_REGION[0],
            RegionUtility.FK_REGION[0]
        );
        
        if (province.getName() == null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Cadastrar Provincia</h1>
            
            <form action="insert-province.jsp" method="Post">
                <div class="row">
                    <div class="mb-3">
                        <label for="country" class="form-label">País</label>
                        <select class="form-select" id="country" name="fkRegion">
                        <option selected>Select ...</option>
<%
                        for (Region country : countries) {
%>
                            <option value="<%= country.getPkRegion() %>">
                                <%= country.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Provincia</label>
                        <input type="text" id="province" name="name" class="form-control">
                    </div>
                </div>
                        
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
<%
        }
        else {
            new RegionDao(connection).save(province, RegionUtility.INSERT_REGION[1]);
%>
            <jsp:forward page="list-provinces.jsp" />
<%
        }
%>
    </body>
</html>
