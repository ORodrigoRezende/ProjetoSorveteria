<%-- 
    Document   : CadastroMarca
    Created on : 21/03/2023, 15:37:28
    Author     : 13480309682
--%>
<% if (session.getAttribute("nome") != null){%>

<%
 String mensagem = request.getParameter("mensagem");
 String nome = request.getParameter("nome");
 String opcao = request.getParameter("opcao");
 String codMarca = request.getParameter("codMarca");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codMarca==null){
codMarca = "0";
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
        <title class="text-center">Cadastro de Marca</title>
    </head>
    <div class="fonte">
    <body>
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Marca</h1>
        <form name="cadastro" method="get" action="CAEMarca.jsp">
            <p><label>Marca:</label> <input type="text" name="nome" pattern="[A-Za-z\s]+" placeholder="Digite o nome do marca" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (nome == null) ? "" : nome %>" size="30" required />  </p>
           
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
            <input type="hidden" name="codMarca" value="<%=codMarca%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        </section>
        <section class="my-5">
        <%@include file="ListarMarca.jsp" %>
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