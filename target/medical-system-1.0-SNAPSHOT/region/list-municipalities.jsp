<%-- 
    Document   : list
    Created on : Jan 9, 2022, 2:18:03 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.utility.RegionUtility"%>
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
        <title>Listar Municipios</title>
        <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        
        List<Region> municipalities = new RegionDao(connection).getAllRegions(
            RegionUtility.SELECT_REGION[2], 
            RegionUtility.PK_REGION[2],
            RegionUtility.FK_REGION[2]
        );
        
        if (municipalities != null) {
%>
        <div style="margin-top: 2em;" class="container">
            
            <a style="margin-bottom: 1em" href="insert-municipality.jsp"
                class="btn btn-primary">Cadastrar Municipio</a>
                
            <h1>Listas de Municipios</h1>
            <div class="container">
                <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                </tr>
                </thead>
                <tbody>
<%
                for (Region municipality : municipalities) {             
%>
                    <tr>
                        <td><%= municipality.getPkRegion() %></td>
                        <td><%= municipality.getName() %></td>
                    </tr>
<%
                }
%>
                </tbody>
              </table>
            </div>
<%
        }
%>    
            </div>
        </div>
    </body>
</html>
