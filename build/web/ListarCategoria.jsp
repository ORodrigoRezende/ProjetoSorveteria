<%-- 
    Document   : ListarCategoria
    Created on : 13/05/2023, 16:17:24
    Author     : orodr
--%>

<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCategoria"%>
<%
DAOCategoria objDAOCategoria = new DAOCategoria();

List<Categoria> listaCategoria = objDAOCategoria.listarCategoria();

%>

<head>
    
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/estiloTabela.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
    
</head>

<div class="container mx-auto d-flex">
<table class="table container-fluid text-center table-bordered table-sm px-3">
    <thead class="topoTabela">
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>DESCRIÇÃO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Categoria categoria: listaCategoria){ %>
        <tr>
            <td><%= categoria.getCodCategoria() %></td>
            <td><%= categoria.getNome() %> </td>
            <td><%= categoria.getDescricao()%> </td>
            <td><a href="CadastroCategoria.jsp?opcao=alterar&codCategoria=<%= categoria.getCodCategoria() %>&nome=<%= categoria.getNome()%>&descricao=<%= categoria.getDescricao()%>">Alterar</a></td>
            <td><a href="CadastroCategoria.jsp?opcao=excluir&codCategoria=<%= categoria.getCodCategoria() %>&nome=<%= categoria.getNome()%>&descricao=<%= categoria.getDescricao()%>">Excluir</a></td>
        </tr>
        <% } %>
    </tbody>
</table>
</div>
