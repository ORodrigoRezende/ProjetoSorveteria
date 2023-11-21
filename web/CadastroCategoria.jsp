<%-- 
    Document   : CadastroCategoria
    Created on : 13/05/2023, 16:17:44
    Author     : orodr
--%>
<% if (session.getAttribute("nome") != null){%>

<%
 String mensagem = request.getParameter("mensagem");
 String nome = request.getParameter("nome");
 String descricao = request.getParameter("descricao");
 String opcao = request.getParameter("opcao");
 String codCategoria = request.getParameter("codCategoria");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codCategoria==null){
codCategoria = "0";
}
%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<%@include file="Menu.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        
        <style>
        input[type="submit"] {
            background-color: rgb(241, 178, 243);
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            text-transform: uppercase;
            border-radius: 10px;
        }
            .margem{
            margin-top: 3rem;
            margin-left: 3rem;
            padding-top: 3rem;
        }
        
        </style>
                
        <script>
    function validarSomenteLetras(input) {
        input.value = input.value.replace(/[^A-Za-z\s]+/g, '');

        if (input.value !== input.value.replace(/[^A-Za-z\s]+/g, '')) {
            alert("Digite apenas letras e espaços no campo.");
        }
    }
</script>
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
         
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Categoria</title>
        
    </head>
    <div class="fonte">
    <body>
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Categoria</h1>
        <form name="cadastro" method="get" action="CAECategoria.jsp">
<p><label>Nome:</label> <input type="text" name="nome" pattern="[A-Za-z\s]+" placeholder="Digite o nome da categoria" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (nome == null) ? "" : nome %>" size="50" required /></p>
<p><label>Descrição:</label> <input type="text" name="descricao" pattern="[A-Za-z\s]+" placeholder="Digite a descrição da categoria" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (descricao == null) ? "" : descricao %>" size="50" required /></p>
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
            <input type="hidden" name="codCategoria" value="<%=codCategoria%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        </section>
        <section class="m-5">
        <%@include file="ListarCategoria.jsp" %>
        </section>
        <footer style="background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
         </footer>
    </body>
    </div>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>