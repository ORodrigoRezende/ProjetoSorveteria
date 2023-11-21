<%-- 
    Document   : CadastroitemVenda
    Created on : 21/03/2023, 15:37:28
    Author     : 13480309682
--%>
<% if (session.getAttribute("nome") != null){%>

<%
 String mensagem = request.getParameter("mensagem");
 String codVenda = request.getParameter("codVenda");
 String codProduto = request.getParameter("codProduto");
 String quantVenda = request.getParameter("quantVenda");
 String valor = request.getParameter("valor");
 String opcao = request.getParameter("opcao");
 String codItemVenda = request.getParameter("codItemVenda");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codItemVenda==null){
codItemVenda = "0";
}
%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<%@include file="Menu.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de ItemVenda</title>
    </head>
    <body class="mt-5 pt-5">
        <h1>Cadastro de ItemVenda</h1>
        <form name="cadastro" method="get" action="CAEItemVenda.jsp">
            <p><label>CodVenda:</label> <input type="text" name="codVenda" value=" <%= (codVenda==null)?"":codVenda%>" size="30" />  </p>
            <p><label>CodProduto:</label> <input type="text" name="codProduto" value="<%=(codProduto==null)?"":codProduto %>" size="50" />  </p>
            <p><label>quantVenda:</label> <input type="text" name="quantVenda" value="<%=(quantVenda==null)?"":quantVenda %>" size="50" />  </p>
            <p><label>Valor:</label> <input type="text" name="valor" value="<%=(valor==null)?"":valor%>" size="50" />  </p>
            <% if(opcao.equals("cadastrar")){%>
            <input type="submit" value="cadastrar" name="cadastrar" />
            <%}%>
            <% if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="Alterar" />
            <%}%>
            <% if(opcao.equals("excluir")){%>
            <input type="submit" value="excluir" name="excluir" />
            <%}%>
           
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codItemVenda" value="<%=codItemVenda%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        
        <%@include file="ListarItemVenda.jsp" %>
        
        <footer style="background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
         </footer>
    </body>
    
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>