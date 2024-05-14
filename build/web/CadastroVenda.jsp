<%-- 
    Document   : CadastroVenda
    Created on : 14/06/2023, 19:08:32
    Author     : 12678776697
--%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.DAOItemVenda"%>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.dataVenda.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Data da Venda';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CRUDVenda.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'vender') {
            if (document.cadastro.codProduto.value == '') {
                document.cadastro.mensagem.value = 'Selecione um produto para venda';
            } else {
            document.cadastro.opcao.value = 'vender';
            document.cadastro.action = 'CRUDVenda.jsp';
            document.cadastro.submit();
        }
    }else if (par == 'remover') {
            if (document.cadastro.idProdAdquirido.value == '') {
                document.cadastro.mensagem.value = 'Selecione um produto para remover';
            } else {
            document.cadastro.opcao.value = 'remover';
            document.cadastro.action = 'CRUDVenda.jsp';
            document.cadastro.submit();
        }
    }
            /// }
         else if (par == 'finalizar') {
            document.cadastro.opcao.value = 'finalizar';
            document.cadastro.action = 'CRUDVenda.jsp';
            document.cadastro.submit();
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cancelar';
            document.cadastro.action = 'CRUDVenda.jsp';
            document.cadastro.submit();
        }
    }
</script>
<%
   ConverteData data = new ConverteData();
   String dataAtual = data.dataAtual();
    
    DAOCliente daoCliente = new DAOCliente();
    List<Cliente> listaCliente = daoCliente.listarCliente() ;
    
    DAOFuncionario daoFuncionario = new DAOFuncionario();
    List<Funcionario> listaFuncionario = daoFuncionario.listarFuncionario();

    DAOProduto daoProduto = new DAOProduto();
    List<Produto> listaProduto = daoProduto.listarProduto();

    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    String codVenda = request.getParameter("codVenda");
    String codFuncionario = request.getParameter("codFuncionario");
    String codCliente = request.getParameter("codCliente");
    String dataVenda = request.getParameter("dataVenda");

    if (dataVenda == null) {
       dataVenda = dataAtual;
    }
    if (codVenda == null) {
        codVenda = "0";
    }
    if (codFuncionario == null) {
        codFuncionario = "0";
    }
    if (codCliente == null) {
        codCliente = "0";
    }
    if (opcao == null) {
        opcao = "nulo";
    }

    DAOItemVenda daoItem = new DAOItemVenda();
    List<ItemVenda> listaItem = daoItem.getLista(Integer.parseInt(codVenda)) ;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        
        <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f0f0;
            margin-right: 100px;
            margin-left: 100px;
        }
        input[type="button"] {
            background-color: rgb(241, 178, 243);
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            text-transform: uppercase;
            border-radius: 10px;
        }
    </style>
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAIXA</title>
    </head>
    <div class="fonte ">
        <body>
        <div class="center-container bg-light">
        <section class="justify-content-center">
            <h1>CAIXA Nº VENDA: <%= codVenda%> - <%= codCliente%></h1>
            <div class="mt-5"></div>
        <form name="cadastro">

            <p>  <label> Cliente:</label> 
                <select name="codCliente">
                    <% for (Cliente lista : listaCliente) { %>
                    <% if (codCliente.equals(String.valueOf(lista.getCodCliente()))) {%>
                    <option selected value="<%= lista.getCodCliente()%>"><%= lista.getNome()%></option>
                    <%} else {%>
                    <option  value="<%= lista.getCodCliente()%>"><%= lista.getNome()%></option>
                    <% }%>
                    <% }%>
                </select></p>
            <p>  <label> Funcionario:</label> 
                <select name="codFuncionario">
                    <% for (Funcionario lista : listaFuncionario) { %>
                    <% if (codCliente.equals(String.valueOf(lista.getCodFuncionario()))) {%>
                    <option selected value="<%= lista.getCodFuncionario()%>"><%= lista.getNome()%></option>
                    <%} else {%>
                    <option  value="<%= lista.getCodFuncionario()%>"><%= lista.getNome()%></option>
                    <% }%>
                    <% }%>
                </select></p>

            <p>  <label> Data:</label>   <input type="text" name="dataVenda" value="<%= (dataVenda == null) ? "" : dataVenda%>" size="10" /></p>
            
                <% if (!codVenda.equals("0")) { %>
            <table border="0" cellspacing="3" cellpadding="3">
                <tr>
                    <td>
                        <p>  <label> Lista de Produtos:</label> <br>
                            <select name="codProduto" size="10">
                                <% for (Produto lista : listaProduto) {%>
                                <option  value="<%= lista.getCodProduto()%>"><%= lista.getNomeProduto()%> R$: <%= lista.getPrecoVenda()%></option>
                                <% } %>
                            </select></p>
                    </td>
                    <td>
                        Quant.<br>
                        <input type="text" name="quantVenda" value="1"  size="2" /><br><br>
                        
                        <input type="button" value="Vender" name="vender" onclick="enviar('vender')" />
                    </td>
                    <td>
                        <p>  <label> Produtos Vendidos:</label> <br>
                            <select name="idProdAdquirido" size="10">
                                <% for (ItemVenda lista : listaItem) {%>
                                <option  value="<%= lista.getCodItemVenda() %>"><%= lista.getCodProduto().getNomeProduto() %> Qde: <%= lista.getQuantVenda()%> R$: <%= lista.getValor() %></option>
                                <% } %>
                            </select>
                        <input type="button" value="Remover" name="remover" onclick="enviar('remover')" />
                        </p>
                    </td>
                </tr>

            </table>





            <% } %>
            <% if (codVenda.equals("0")) { %>
            <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <% } %>

            <% if (!codVenda.equals("0")) { %>
            <input type="button" value="Finalizar" name="finalizar" onclick="enviar('finalizar')"/>
            <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')"/>
            <% }%>

        </p>
        <p><textarea name="mensagem" rows="2" cols="60">
                <%= (mensagem == null) ? "" : mensagem%></textarea></p>

        <input type="hidden" name="opcao" />
        <input type="hidden" name="codVenda" value="<%= codVenda%>"/>
      </form> 
      </section>
      </div>
      <footer style="background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
         </footer>
</div>
 
</body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>