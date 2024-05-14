<%-- 
    Document   : CadastroCliente
    Created on : 21/03/2023, 15:37:28
    Author     : 13480309682
--%>
<% if (session.getAttribute("nome") != null){%>

<%
 String mensagem = request.getParameter("mensagem");
 String nome = request.getParameter("nome");
 String cpf = request.getParameter("cpf");
 String dataNascimento = request.getParameter("dataNascimento");
 String email = request.getParameter("email");
 String endereco = request.getParameter("endereco");
 String telefone = request.getParameter("telefone");
 String opcao = request.getParameter("opcao");
 String codCliente = request.getParameter("codCliente");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codCliente==null){
codCliente = "0";
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
     function formatarTelefone(telefone) {
      telefone = telefone.replace(/\D/g, '');
      if (telefone.length === 11) {
        telefone = telefone.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
      } else {
        telefone = telefone.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
      }
      document.getElementById('telefoneInput').value = telefone;
    }
     function formatarCPF(cpf) {
      cpf = cpf.replace(/\D/g, '');
      cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
      document.getElementById('cpfInput').value = cpf;
  }
</script>
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Cliente</title>
    </head>
    <div class="fonte">
    <body>
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Cliente</h1>
        <form name="cadastro" method="get" action="CAECliente.jsp">
            <p><label>Cliente:</label> <input type="text" name="nome" pattern="[A-Za-z\s]+" placeholder="Digite o nome do cliente" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (nome == null) ? "" : nome %>" size="30" required />  </p>
            <p><label>CPF:</label> <input type="text" name="cpf" id="cpfInput" oninput="formatarCPF(this.value)" maxlength="14" placeholder="Digite o cpf do cliente" value="<%=(cpf==null)?"":cpf%>" size="30" required />  </p>
            <p><label>Data de Nascimento:</label> <input type="date" name="dataNascimento" placeholder="Digite a sua data de nascimento" value="<%= (dataNascimento==null)?"":dataNascimento%>" size="30" required/>  </p>
            <p><label>Email:</label> <input type="email" name="email" placeholder="Digite o seu email" value="<%=(email==null)?"":email%>" size="30" required/>  </p>
            <p><label>Endereco:</label> <input type="text" name="endereco" placeholder="Digite o seu endereço" value="<%=(endereco==null)?"":endereco%>" size="30" required />  </p>
            <p><label>Telefone:</label> <input type="text" name="telefone" id="telefoneInput" oninput="formatarTelefone(this.value)" maxlength="15" placeholder="Digite o seu telefone" value="<%=(telefone==null)?"":telefone%>" size="30" required/>  </p>
           
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
            <input type="hidden" name="codCliente" value="<%=codCliente%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        </section>
        <section class="my-5">
        <%@include file="ListarCliente.jsp" %>
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