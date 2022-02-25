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

<jsp:useBean class="edu.ucan.medical.model.Region" id="commune" scope="page" />

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inserir Comuna</title>   
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="*" name="commune"></jsp:setProperty>
        
<%          
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<Region> municipalities = new RegionDao(connection).getAllRegions(
            RegionUtility.SELECT_REGION[2],
            RegionUtility.PK_REGION[2],
            RegionUtility.FK_REGION[2]
        );
        
        if (commune.getName() == null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Cadastrar Comuna</h1>
            
            <form action="insert-commune.jsp" method="Post">
                <div class="row">
                    <div class="mb-3">
                        <label for="municipality" class="form-label">Municipios</label>
                        <select class="form-select" id="municipality" name="fkRegion">
                        <option selected>Select ...</option>
<%
                        for (Region municipality : municipalities) {
%>
                            <option value="<%= municipality.getPkRegion() %>">
                                <%= municipality.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="commune" class="form-label">Comuna</label>
                        <input type="text" id="commune" name="name" class="form-control">
                    </div>
                </div>
                        
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
<%
        }
        else {
            new RegionDao(connection).save(commune, RegionUtility.INSERT_REGION[3]);
%>
            <jsp:forward page="list-communes.jsp" />
<%
        }
%>
    </body>
</html>
