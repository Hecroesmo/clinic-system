<%-- 
    Document   : header
    Created on : Dec 27, 2021, 1:24:57 PM
    Author     : tio-hecro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Header</title>      
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/headers.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    </head>
    <body>
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/"
               class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
              <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
              <span class="fs-4">One-Health</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
                
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle"
                       data-bs-toggle="dropdown"
                       aria-expanded="false" id="region">Região</a>
                       
                    <ul class="dropdown-menu" aria-labelledby="region">
                        <li><a class="dropdown-item"
                            href="<c:url value="/region/insert.jsp"/>">Cadastrar</a></li>
                            
                        <li><a class="dropdown-item" href="#">Listar</a></li>
                    </ul>
                </li>
              <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
              <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
              <li class="nav-item"><a href="#" class="nav-link">About</a></li>
            </ul>
        </header>
    </body>
</html>
