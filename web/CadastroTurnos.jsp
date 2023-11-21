<%-- 
    Document   : CadastroTurnos
    Created on : 13/05/2023, 16:59:25
    Author     : orodr
--%>

<% if (session.getAttribute("nome") != null){%>

<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOFuncionario"%>
<%
 String mensagem = request.getParameter("mensagem");
 String codFuncionario = request.getParameter("codFuncionario");
 String horaInicio = request.getParameter("horaInicio");
 String horaFim = request.getParameter("horaFim");
 String opcao = request.getParameter("opcao");
 String codTurnos = request.getParameter("codTurnos");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codTurnos==null){
codTurnos = "0";
}
if(codFuncionario==null){
codFuncionario = "0";
}

    DAOFuncionario daoFuncionario = new DAOFuncionario();
    List<Funcionario> listaFuncionario = daoFuncionario.listarFuncionario();
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
            border-radius: 10px;}
            .margem{
            margin-top: 3rem;
            margin-left: 3rem;
            padding-top: 3rem;
        }
        
        </style>
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

        <!-- Javascript -->
        <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Turnos</title>
    </head>
    <div class="fonte">
    <body>
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Turnos</h1>
        <form name="cadastro" method="get" action="CAETurnos.jsp">
            
            <p>  <label>Funcionario: </label>
                <select name="codFuncionario">
                    <%for(Funcionario funcionario:listaFuncionario){ %>
                    <% if (codFuncionario.equals(String.valueOf(funcionario.getCodFuncionario()))) {%> 
                      <option selected value="<%= funcionario.getCodFuncionario()%>"><%= funcionario.getNome() %> </option>
                    <%} else {%>
                    <option value="<%= funcionario.getCodFuncionario()%>"><%= funcionario.getNome()%> </option>
                    <%}%>
                      <% }%>
                </select>
            </p>
            
            <p><label>Hora Início:</label> <input type="text" name="horaInicio" placeholder="Digite a hora de início do turno" value="<%= (horaInicio == null) ? "" : horaInicio %>" size="30" required /></p>
            <p><label>Hora Fim:</label> <input type="text" name="horaFim" placeholder="Digite a hora do fim do turno" value=" <%= (horaFim == null)? "" : horaFim %>" size="30" required />  </p>
            
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
            <input type="hidden" name="codTurnos" value="<%=codTurnos%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        </section>
        <section class="my-5">
        <%@include file="ListarTurnos.jsp" %>
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