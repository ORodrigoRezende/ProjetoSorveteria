<%-- 
    Document   : Cadastrofuncionario
    Created on : 21/03/2023, 15:37:28
    Author     : 13480309682
--%>
<% if (session.getAttribute("nome") != null){%>

<%
    String mensagem = request.getParameter("mensagem");
    String nome = request.getParameter("nome");
    String cargo = request.getParameter("cargo");
    String endereco = request.getParameter("endereco");
    String cpf = request.getParameter("cpf");
    String salario = request.getParameter("salario");
    String nascimento = request.getParameter("nascimento");
    String email = request.getParameter("email");
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");
    String clt = request.getParameter("clt");
    String opcao = request.getParameter("opcao");
    String codFuncionario = request.getParameter("codFuncionario");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codFuncionario==null){
codFuncionario = "0";
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
     function validarSomenteNumeros(input) {
      input.value = input.value.replace(/\D/g, '');
    }
     function formatarCPF(cpf) {
      cpf = cpf.replace(/\D/g, '');
      cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
      document.getElementById('cpfInput').value = cpf;
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
</script>

<script src="js/scripts.js"></script>

        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/estiloTabela.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Funcionario</title>
    </head>
    <div class="fonte">
    <body>
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Funcionario</h1>
        <form name="cadastro" method="get" action="CAEFuncionario.jsp">
            <p><label>Funcionário:</label> <input type="text" name="nome" pattern="[A-Za-z\s]+" placeholder="Digite o nome do funcionário" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (nome == null) ? "" : nome %>" size="30" required/></p>
            <p><label>Cargo:</label> <input type="text" placeholder="Digite o Cargo" name="cargo" value="<%= (cargo == null) ? "" : cargo %>" size="30" required/> </p>
            <p><label>Endereço:</label> <input type="text" name="endereco" pattern="[A-Za-z\s]+" placeholder="Digite o endereço" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%=(endereco==null)?"":endereco %>" size="30" required/>  </p>
            <p><label>CPF:</label> <input type="text" name="cpf" id="cpfInput" oninput="formatarCPF(this.value)" maxlength="14" placeholder="Digite o CPF" title="Digite apenas numeros , . ou -" value="<%=(cpf==null)?"":cpf%>" size="30" required/>  </p>
            <p><label>Salario:</label> <input type="text" name="salario" placeholder="Digite o Salario" title="Digite apenas numeros,ponto e virgula" value="<%=(salario==null)?"":salario %>" size="30" required/>  </p>
            <p><label>Data de Nascimento:</label> <input type="date" name="nascimento" placeholder="Digite a sua data de nascimento" value="<%= (nascimento==null)?"":nascimento%>" size="30" required/>  </p>
            <p><label>Email:</label> <input type="email" name="email" placeholder="Digite o Email" value="<%= (email==null)?"":email%>" size="30" required/>  </p>
            <p><label>Usuário:</label> <input type="text" name="usuario" placeholder="Digite o Usuario" value="<%= (usuario==null)?"":usuario%>" size="30" required/>  </p>
            <p><label>Senha:</label> <input type="password" name="senha" placeholder="Digite a senha" value="<%= (senha==null)?"":senha%>" size="30" required/>  </p>
            <p><label>CLT:</label> <input type="text" name="clt" placeholder="Digite a CLT" value="<%= (clt==null)?"":clt%>" size="30" required/>  </p>
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
            <input type="hidden" name="codFuncionario" value="<%=codFuncionario%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        </section>
        <section class="my-5">
        <%@include file="ListarFuncionario.jsp" %>
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