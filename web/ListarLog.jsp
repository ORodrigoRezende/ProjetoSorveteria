<%-- 
    Document   : ListarProduto
    Created on : 21/03/2023, 15:37:50
    Author     : 13480309682
--%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Log"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOLog"%>
<%
DAOLog objDAOLog = new DAOLog();

List<Log> listaLog = objDAOLog.listarLog();

ConverteData objConverte = new ConverteData();

%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>ACAO</th>
            <th>TABELA</th>
            <th>USUARIO</th>
            <th>DATAHORA</th>
            <th>OBSERVACOES</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Log log: listaLog){ %>
        <tr>
            <td><%= log.getCodLog() %></td>
            <td><%= log.getAcao()%></td>
            <td><%= log.getTabela()%></td>
            <td><%= log.getUsuario()%></td>
            <td><%= objConverte.converteTela(log.getDataHora())%></td>
            <td><%= log.getObservacoes()%></td>
           
            
            <td><a href="CadastroLog.jsp?opcao=alterar&codLog=<%= log.getCodLog() %>&acao=<%= log.getAcao()%>&tabela=<%= log.getTabela()%>&usuario=<%= log.getUsuario()%>&dataHora=<%= objConverte.converteTela(log.getDataHora())%>&observacoes=<%= log.getObservacoes()%>">Alterar</a></td>
            <td><a href="CadastroLog.jsp?opcao=excluir&codLog=<%= log.getCodLog() %>&acao=<%= log.getAcao()%>&tabela=<%= log.getTabela()%>&usuario=<%= log.getUsuario()%>&dataHora=<%= objConverte.converteTela(log.getDataHora())%>&observacoes=<%= log.getObservacoes()%>">Excluir</a></td>

        </tr>
        <% } %>
    </tbody>
</table>