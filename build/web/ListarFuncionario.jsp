<%-- 
    Document   : ListarProduto
    Created on : 21/03/2023, 15:37:50
    Author     : 13480309682
--%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFuncionario"%>
<%
DAOFuncionario objDAOFuncionario = new DAOFuncionario();

List<Funcionario> listaFuncionario = objDAOFuncionario.listarFuncionario();
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
            <th>CARGO</th>
            <th>ENDERECO</th>
            <th>CPF</th>
            <th>SALARIO</th>
            <th>NASCIMENTO</th>
            <th>EMAIL</th>
            <th>USUARIO</th>
            <th>SENHA</th>
            <th>CLT</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Funcionario funcionario: listaFuncionario){ %>
        <tr>
            <td><%= funcionario.getCodFuncionario() %></td>
            <td><%= funcionario.getNome()%></td>
            <td><%= funcionario.getCargo()%></td>
            <td><%= funcionario.getEndereco()%></td>
            <td><%= funcionario.getCpf()%></td>
            <td><%= funcionario.getSalario()%></td>
            <td><%= objConverte.converteTela(funcionario.getNascimento()) %></td>
            <td><%= funcionario.getEmail() %></td>
            <td><%= funcionario.getUsuario() %></td>
            <td><%= funcionario.getSenha() %></td>
            <td><%= funcionario.getClt() %></td> 
            <td><a href="CadastroFuncionario.jsp?opcao=alterar&codFuncionario=<%= funcionario.getCodFuncionario() %>&nome=<%= funcionario.getNome()%>&cargo=<%= funcionario.getCargo()%>&endereco=<%= funcionario.getEndereco()%>&cpf=<%= funcionario.getCpf()%>&salario=<%= funcionario.getSalario()%>&nascimento=<%= objConverte.converteTela(funcionario.getNascimento())%>&email=<%= funcionario.getEmail() %>&usuario=<%= funcionario.getUsuario() %>&senha=<%= funcionario.getSenha()%>&clt=<%= funcionario.getClt() %>">Alterar</a></td>
            <td><a href="CadastroFuncionario.jsp?opcao=excluir&codFuncionario=<%= funcionario.getCodFuncionario() %>&nome=<%= funcionario.getNome()%>&cargo=<%= funcionario.getCargo()%>&endereco=<%= funcionario.getEndereco()%>&cpf=<%= funcionario.getCpf()%>&salario=<%= funcionario.getSalario()%>&nascimento=<%= objConverte.converteTela(funcionario.getNascimento())%>&email=<%= funcionario.getEmail() %>&usuario=<%= funcionario.getUsuario() %>&senha=<%= funcionario.getSenha()%>&clt=<%= funcionario.getClt() %>">Excluir</a></td>
        </tr>
        <% } %>
    </tbody>
    </div>
</table>