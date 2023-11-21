<%-- 
    Document   : ListarTurnos
    Created on : 13/05/2023, 16:59:11
    Author     : orodr
--%>

<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Turnos"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOTurnos"%>
<%
DAOTurnos objDAOTurnos = new DAOTurnos();

List<Turnos> listaTurnos = objDAOTurnos.listarTurnos();
%>

<head>
    
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloTabela.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
    
</head>
<div class="container mx-auto d-flex">
<table class="table container-fluid text-center table-bordered table-sm px-3" >
    <thead class="topoTabela">
        <tr>
            <th>CÓDIGO</th>
            <th>FUNCIONARIO</th>
            <th>HORA INICIO</th>
            <th>HORA FIM</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Turnos turnos: listaTurnos){ %>
        <tr>
            <td><%= turnos.getCodTurnos() %></td>
            <td><%= turnos.getObjFuncionario().getNome() %></td>
            <td><%= turnos.getHoraInicio()%></td>
            <td><%= turnos.getHoraFim()%></td>
            
            <td><a href="CadastroTurnos.jsp?opcao=alterar&codTurnos=<%= turnos.getCodTurnos() %>&codFuncionario=<%= turnos.getObjFuncionario().getCodFuncionario() %>&horaInicio=<%= turnos.getHoraInicio()%>&horaFim=<%= turnos.getHoraFim() %>">Alterar</a></td>
            <td><a href="CadastroTurnos.jsp?opcao=excluir&codTurnos=<%= turnos.getCodTurnos() %>&codFuncionario=<%= turnos.getObjFuncionario().getCodFuncionario() %>&horaInicio=<%= turnos.getHoraInicio()%>&horaFim=<%= turnos.getHoraFim() %>">Excluir</a></td>
            
        </tr>
        <% } %>
    </tbody>
    </div>
</table>
