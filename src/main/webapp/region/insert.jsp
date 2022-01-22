<%-- 
    Document   : insert
    Created on : Dec 28, 2021, 11:01:18 AM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.RegionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.ucan.medical.model.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inserir Região</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        
    <%  
        Connection connection = (Connection) request.getAttribute("connection");
        List<Region> countries = new RegionDao(connection).getCountries();
    %>
    
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
            
        <div style="margin-top: 1em" class="container">
            <h1>Salvar Regiões</h1>
            
            <form action="mvc?logic=SaveRegionLogic" method="Post">
                <div class="row">
                    <div class=" col mb-3">
                        <label for="country" class="form-label">País</label>
                        <select class="form-select" id="country" name="country">
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
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="provincy" class="form-label">Provincia</label>
                        <select class="form-select" id="province" name="province">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col mb-3">
                        <label for="municipality" class="form-label">Municipio</label>
                        <select class="form-select" id="municipality" name="municipality">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="commune" class="form-label">Comuna</label>
                        <select class="form-select" id="commune" name="commune">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                    <div class="col mb-3">
                        <label for="neighborhood" class="form-label">Bairro</label>
                        <select class="form-select" id="neighborhood" name="neighborhood">
                            <option selected>Select ...</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                  <label for="region" class="form-label">Nome</label>
                  <input type="text" class="form-control" id="region" name="region">
                </div>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
    </body>
</html>
