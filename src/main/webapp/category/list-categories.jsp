<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.CategoryDao"%>
<%@page import="edu.ucan.medical.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Categorias</title>
    </head>
    <body>
<%
        Connection connection = (Connection) request.getAttribute("connection");
        List<Category> categories = new CategoryDao(connection).getAllCategories();
%>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        
<%
        if (categories != null) {
%>
        <div style="margin-top: 1em" class="container">
            <h1>Lista de Categorias</h1>
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                    </tr>
                </thead>
                <tbody> 
<%
                for (Category category : categories) {
%>
                    <tr>
                        <td><%= category.getPkCategory() %></td>
                        <td><%= category.getName() %></td>
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
            <p style="margin-top: 10em" class="text-center">Sem dados ...</p>
<%
        }
%>
        </div>
    </body>
</html>
