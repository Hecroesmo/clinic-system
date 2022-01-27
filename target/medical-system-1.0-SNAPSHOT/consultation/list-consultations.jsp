<%-- 
    Document   : list-specialties
    Created on : Jan 9, 2022, 4:59:13 PM
    Author     : tio-hecro
--%>

<%@page import="edu.ucan.medical.dao.ConsultationDao"%>
<%@page import="edu.ucan.medical.model.Consultation"%>
<%@page import="edu.ucan.medical.dao.DrugDao"%>
<%@page import="edu.ucan.medical.model.Drug"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Farmacos</title>
    </head>
    <body>
        <jsp:include page="../components/admin-header.jsp"></jsp:include>
        <jsp:include page="../components/list-consultations_.jsp"></jsp:include>
    </body>
</html>
