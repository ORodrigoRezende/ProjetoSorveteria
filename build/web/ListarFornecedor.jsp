<%-- 
    Document   : ListarFornecedor
    Created on : 09/05/2023, 14:56:56
    Author     : 12678776697
--%>
<%@page import="modelo.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFornecedor"%>
<%
DAOFornecedor objDAOFornecedor = new DAOFornecedor();

List<Fornecedor> listaFornecedor = objDAOFornecedor.listarFornecedor();

%>

<head>
    
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/estiloTabela.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
    
</head>
<div class="container mx-auto d-flex">
<table class="table container-fluid text-center table-bordered table-sm px-3"  >
    <thead class="topoTabela">
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>TELEFONE</th>
            <th>EMAIL</th>
            <th>ENDERECO</th>
            <th>CNPJ</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Fornecedor fornecedor: listaFornecedor){ %>
        <tr>
            <td><%= fornecedor.getCodFornecedor() %></td>
            <td><%= fornecedor.getNome()%></td>
            <td><%= fornecedor.getTelefone()%></td>
            <td><%= fornecedor.getEmail()%></td>
            <td><%= fornecedor.getEndereco()%></td>
            <td><%= fornecedor.getCnpj()%></td>
            <td><a href="CadastroFornecedor.jsp?opcao=alterar&codFornecedor=<%= fornecedor.getCodFornecedor() %>&nome=<%= fornecedor.getNome()%>&telefone=<%= fornecedor.getTelefone()%>&email=<%= fornecedor.getEmail()%>&endereco=<%= fornecedor.getEndereco()%>&cnpj=<%= fornecedor.getCnpj()%>">Alterar</a></td>
            <td><a href="CadastroFornecedor.jsp?opcao=excluir&codFornecedor=<%= fornecedor.getCodFornecedor() %>&nome=<%= fornecedor.getNome()%>&telefone=<%= fornecedor.getEndereco()%>&email=<%= fornecedor.getEmail()%>&endereco=<%= fornecedor.getEndereco()%>&cnpj=<%= fornecedor.getCnpj()%>">Excluir</a></td>
        </tr>
        <% } %>
    </tbody>
    </div>
</table>