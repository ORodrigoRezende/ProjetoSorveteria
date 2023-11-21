<%-- 
    Document   : ListarProduto
    Created on : 21/03/2023, 15:37:50
    Author     : 13480309682
--%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOMarca"%>
<%
DAOMarca objDAOMarca = new DAOMarca();

List<Marca> listaMarca = objDAOMarca.listarMarca();

%>

<head>
    
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/estiloTabela.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
    
</head>
<div class="container mx-auto d-flex"></div>
<table class="table container-fluid text-center table-bordered table-sm px-3">
    <thead class="topoTabela">
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Marca marca: listaMarca){ %>
        <tr>
            <td><%= marca.getCodMarca() %></td>
            <td><%= marca.getNome()%></td>
           
            
            <td><a href="CadastroMarca.jsp?opcao=alterar&codMarca=<%= marca.getCodMarca() %>&nome=<%= marca.getNome()%>">Alterar</a></td>
            <td><a href="CadastroMarca.jsp?opcao=excluir&codMarca=<%= marca.getCodMarca() %>&nome=<%= marca.getNome()%>">Excluir</a></td>

        </tr>
        <% } %>
    </tbody>
</table>