<%-- 
    Document   : insert
    Created on : Jan 9, 2022, 3:59:46 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.DrugDao"%>
<%@page import="edu.ucan.medical.dao.CategoryDao"%>
<%@page import="edu.ucan.medical.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean class="edu.ucan.medical.model.Drug" id="drug" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Farmacos</title>
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:setProperty property="name" name="drug"/>
        <jsp:setProperty property="description" name="drug"/>
    
        <div style="margin-top: 1em" class="container">
            <h1>Salvar Fármaco</h1>
            
<%
        Connection connection = (Connection) request.getAttribute("connection");
        DrugDao drugDao = new DrugDao(connection);
        List<Category> categories = new CategoryDao(connection).getAllCategories();
    
        if (drug.getName() == null) {
%>
            <form action="insert-drug.jsp" method="Post">
                <div class="mb-3">
                    <label for="name" class="form-label">Nome</label>
                    <input id="name" type="text" class="form-control" name="name">
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descrição</label>
                    <input id="description" type="text" class="form-control" name="description">
                </div>
                <div class="col mb-3">
                        <label for="category" class="form-label">Categoria</label>
                        <select id="category" class="form-select" id="specialty" name="category">
                        <option selected>Select ...</option>
<%
                        for (Category category : categories) {
%>
                            <option value="<%= category.getPkCategory() %>">
                                <%= category.getName() %>
                            </option>
<%
                        }
%>
                        </select>
                    </div>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
<%
        }
        else 
        {   
            int pkCategory = Integer.parseInt(request.getParameter("category"));
            Category category = new Category();
            category.setPkCategory(pkCategory);
            drug.setCategory(category);
            drugDao.save(drug);
%>
            <jsp:forward page="list-drugs.jsp" />
<%
        }
%>
        </div>
    </body>
</html>
