<%-- 
    Document   : ListarProduto
    Created on : 21/03/2023, 15:37:50
    Author     : 13480309682
--%>
<%@page import="modelo.ItemVenda"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOItemVenda"%>
<%
DAOItemVenda objDAOItemVenda = new DAOItemVenda();

List<ItemVenda> listaItemVenda = objDAOItemVenda.listarItemVenda();

%>

<head>
    
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
    
</head>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>CODVENDA</th>
            <th>CODPRODUTO</th>
            <th>QUANTVENDA</th>
            <th>VALOR</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(ItemVenda itemVenda: listaItemVenda){ %>
        <tr>
            <td><%= itemVenda.getCodItemVenda() %></td>
            <td><%= itemVenda.getCodVenda()%></td>
            <td><%= itemVenda.getCodProduto()%></td>
            <td><%= itemVenda.getQuantVenda()%></td>
            <td><%= itemVenda.getValor()%></td>
            <td><a href="CadastroItemVenda.jsp?opcao=alterar&codItemVenda=<%= itemVenda.getCodItemVenda() %>&codVenda=<%= itemVenda.getCodVenda()%>&codProduto=<%= itemVenda.getCodProduto()%>&quantVenda=<%= itemVenda.getQuantVenda()%>&valor=<%= itemVenda.getValor()%>">Alterar</a></td>
            <td><a href="CadastroItemVenda.jsp?opcao=excluir&codItemVenda=<%= itemVenda.getCodItemVenda() %>&codVenda=<%= itemVenda.getCodVenda()%>&codProduto=<%= itemVenda.getCodProduto()%>&quantVenda=<%= itemVenda.getQuantVenda()%>&valor=<%= itemVenda.getValor()%>">Excluir</a></td>
        </tr>
        <% } %>
    </tbody>
</table>