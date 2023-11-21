<%-- 
    Document   : ListarProduto
    Created on : 21/03/2023, 15:37:50
    Author     : 13480309682
--%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCliente"%>
<%
DAOCliente objDAOCliente = new DAOCliente();

List<Cliente> listaCliente = objDAOCliente.listarCliente();

ConverteData objConverte = new ConverteData();

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
            <th>CPF</th>
            <th>DATANASCIMENTO</th>
            <th>EMAIL</th>
            <th>ENDERECO</th>
            <th>TELEFONE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Cliente cliente: listaCliente){ %>
        <tr>
            <td><%= cliente.getCodCliente() %></td>
            <td><%= cliente.getNome()%></td>
            <td><%= cliente.getCpf()%></td>
            <td><%= objConverte.converteTela(cliente.getDataNascimento())%></td>
            <td><%= cliente.getEmail()%></td>
            <td><%= cliente.getEndereco()%></td>
            <td><%= cliente.getTelefone()%></td>
           
            
            <td><a href="CadastroCliente.jsp?opcao=alterar&codCliente=<%= cliente.getCodCliente() %>&nome=<%= cliente.getNome()%>&cpf=<%= cliente.getCpf()%>&dataNascimento=<%= objConverte.converteTela(cliente.getDataNascimento())%>&email=<%= cliente.getEmail()%>&endereco=<%= cliente.getEndereco()%>&telefone=<%= cliente.getTelefone()%>">Alterar</a></td>
            <td><a href="CadastroCliente.jsp?opcao=excluir&codCliente=<%= cliente.getCodCliente() %>&nome=<%= cliente.getNome()%>&cpf=<%= cliente.getCpf()%>&dataNascimento=<%= objConverte.converteTela(cliente.getDataNascimento())%>&email=<%= cliente.getEmail()%>&endereco=<%= cliente.getEndereco()%>&telefone=<%= cliente.getTelefone()%>">Excluir</a></td>

        </tr>
        <% } %>
    </tbody>
    </div>
</table>