<%-- 
    Document   : Menu
    Created on : 07/08/2023, 18:58:18
    Author     : 12678776697
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .navbar{background-color: rgb(241, 178, 243);}

        .navbar-toggler{
            background-color: rgb(241, 178, 243);
           color: #fff;
            border: 0;
            font-size: 1.5rem;
        }

        .navbar-toggler:focus{
            box-shadow:none;
        }

        .dropdown-menu{
            background-color: rgb(221,134,54);
            border-radius: 0;
        }

        .dropdown-menu[data-bs-popper]{
            top: 3.55rem;
        }

        .dropdown-item:hover, .dropdown-item:focus{
            background-color: rgb(221,134,54);
        }

        .dropdown-item{
            border-color: rgb(221,134,54);
        }
        .texto{
            background-color: rgb(241, 178, 243);
        }
        
        .bg-primari{
            background-color: #F195B2;
        }
        .text-primary
    </style>
<head>
	<meta charset="utf-8">
    <title>Camilly e Rodrigo - sorveteria </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <script src="jsH/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="cssH/bootstrap.css">
</head>
<body>
        <div class="container-fluid bg-primari py-3 d-none d-md-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-white pr-3" href="">FAQs</a>
                        <span class="text-white">|</span>
                        <a class="text-white px-3" href="">Ajuda</a>
                        <span class="text-white">|</span>
                        <a class="text-white pl-3" href="">Suporte</a>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-white px-3" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-white px-3" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-white px-3" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-white px-3" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-white pl-3" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-white navbar-light shadow p-lg-0">
                <a href="Home.jsp" class="navbar-brand d-block d-lg-none">
                    <h1 class="m-0 display-4 text-primary"><span class="text-secondary">i</span>CREAM</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <li class="nav-item">  <a href="Home.jsp" class="nav-item nav-link active">Home</a></li>
                        <li class="nav-item"> <a href="Sobre.jsp" class="nav-item nav-link">Sobre</a></li>
                        <li class="nav-item"> <a href="CadastroVenda.jsp" class="nav-item nav-link">Venda</a></li>
                    </div>
                    
                    <a href="Home.jsp" class="navbar-brand mx-5 d-none d-lg-block"><img height="80" src="img/Logo.png" alt="">
                       <!-- <h1 class="m-0 display-4 text-primary"><span class="text-secondary">i</span>CREAM</h1> -->
                    </a>
                    <div class="navbar-nav mr-auto py-0">
                        <ul class="navbar-nav"> 
                            <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Cadastro</a>
                                <ul class="dropdown-menu"> 
                                    <li><a href="CadastroCategoria.jsp" class="dropdown-item text-dark">Categoria</a></li> 
                                    <li><a href="CadastroCliente.jsp" class="dropdown-item text-dark">Cliente</a></li> 
                                    <li><a href="CadastroFornecedor.jsp" class="dropdown-item text-dark">Fornecedor</a></li> 
                                    <li><a href="CadastroFuncionario.jsp" class="dropdown-item text-dark">Funcionario</a></li> 
                                    <li><a href="CadastroMarca.jsp" class="dropdown-item text-dark">Marca</a></li> 
                                    <li><a href="CadastroProduto.jsp" class="dropdown-item text-dark">Produto</a></li> 
                                    <li><a href="CadastroTurnos.jsp" class="dropdown-item text-dark">Turnos</a></li> </ul> 
                            </li>
                        </ul>
 
                        <ul class="navbar-nav"> 
                            <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Relatorios</a>
                                <ul class="dropdown-menu"> 
                                    <li><a  target="blank"href="RelatorioCategoria.jsp" class="dropdown-item text-dark">Relatorio Categoria</a></li> 
                                    <li><a target="blank"href="RelatorioCliente.jsp" class="dropdown-item text-dark">Relatorio Cliente</a></li> 
                                    <li><a target="blank"href="RelatorioFornecedor.jsp" class="dropdown-item text-dark " >Relatorio Fornecedor</a></li> 
                                    <li><a target="blank"href="RelatorioFuncionario.jsp" class="dropdown-item text-dark" data-bs-toggle="modal" data-bs-target="#relatorioFuncionario">Relatorio Funcionario</a></li> 
                                    <li><a target="blank"href="RelatorioMarca.jsp" class="dropdown-item text-dark"> Relatorio Marca</a></li> 
                                    <li><a target="blank"href="RelatorioProduto.jsp" class="dropdown-item text-dark">Relatorio Produto</a></li> 
                                    <li><a target="blank"href="RelatorioTurno.jsp" class="dropdown-item text-dark">Relatorio Turnos</a></li> </ul> 
                            </li>
                        </ul>
                        <li class="nav-item"> <a href="Contato.jsp" class="nav-item nav-link">Contato</a></li> 
                        <li class="nav-item dropdown"> <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Login</a>
                            <ul class="dropdown-menu"> 
                                    <li><a href="logoff.jsp" class="dropdown-item text-dark">Sair</a></li> 
                        </li>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    <div class="modal fade" id="relatorioFuncionario" tabindex="-1" aria-labelledby="relatorioFuncionarioLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h5 class="modal-title fw-bold text-white" id="relatorioFuncionarioLabel">Relatório Personalizado (Funcionário)</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="RelatorioFuncionario.jsp" method="post">
                                    <div class="mb-3">
                                        <label for="idadeMinima" class="form-label">Idade Mínima:</label>
                                        <input type="text" class="form-control" id="idadeMinima" name="idadeMinima">
                                    </div>
                                    <div class="mb-3">
                                        <label for="idadeMaxima" class="form-label">Idade Máxima:</label>
                                        <input type="text" class="form-control" id="idadeMaxima" name="idadeMaxima">
                                    </div>                    
                                    <button type="submit" class="btn btn-primary mt-3 px-4 fw-bold">Gerar Relatório</button>                   

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </body>
</html>
                             