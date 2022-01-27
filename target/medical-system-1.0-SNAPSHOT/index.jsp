<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Painel de controle</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/css/dashboard.css" />" rel="stylesheet">
        <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    </head>
    <body>
        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
          <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Medical System</a>
          <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
          <div class="navbar-nav">
            <div class="nav-item text-nowrap">
              <a class="nav-link px-3" href="mvc?logic=LogoutLogic">Sair</a>
            </div>
          </div>
        </header>

        <div class="container-fluid">
          <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
              <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Especialidades
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="specialty/insert-specialty.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="specialty/list-specialties.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Medicos
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="doctor/insert-doctor.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="doctor/list-doctor.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Tipo Farmaco
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="category/insert-category.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="category/list-categories.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Fármacos
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="drug/insert-drug.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="drug/list-drugs.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Paciente
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="patient/insert-patient.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="patient/list-patients.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Tipo Consulta
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="consultation-type/insert-consultation-type.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="consultation-type/list-consultation-type.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Consultas
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="consultation/insert-consultation.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="consultation/list-consultations.jsp">Listar</a></li>
                      </ul>
                  </li>
                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                  <span>Regiões</span>
                  <a class="link-secondary" href="#" aria-label="Add a new report">
                    <span data-feather="plus-circle"></span>
                  </a>
                </h6>
                <ul class="nav flex-column mb-2">
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        País
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="region/insert.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="region/list.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Provincia
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="region/insert.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="region/list.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Municipio
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="region/insert.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="region/list.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Comuna
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="region/insert.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="region/list.jsp">Listar</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Bairro
                      </span>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
                          <li><a class="dropdown-item" href="region/insert.jsp">Cadastrar</a></li>
                          <li><a class="dropdown-item" href="region/list.jsp">Listar</a></li>
                      </ul>
                  </li>
                </ul>
              </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
              <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Painel de Controle</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                  <div class="btn-group me-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Partilhar</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">Exportar</button>
                  </div>
                </div>
              </div>
              <jsp:include page="components/list-consultations_.jsp"></jsp:include>
              </div>
            </main>
          </div>
        </div>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
         integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
         crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
         integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
         crossorigin="anonymous"></script>
        <script src="/js/dashboard.js"></script>
    </body>
</html>