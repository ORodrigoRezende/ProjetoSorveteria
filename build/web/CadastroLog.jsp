<%-- 
    Document   : CadastroLog
    Created on : 21/03/2023, 15:37:28
    Author     : 13480309682
--%>
<%
 String mensagem = request.getParameter("mensagem");
 String acao = request.getParameter("acao");
 String tabela = request.getParameter("tabela");
  String usuario = request.getParameter("usuario");
 String dataHora = request.getParameter("dataHora");
 String observacoes = request.getParameter("observacoes");
 String telefone = request.getParameter("telefone");
 String opcao = request.getParameter("opcao");
 String codLog = request.getParameter("codLog");
 if(opcao==null){
 opcao = "cadastrar";
 }
if(codLog==null){
codLog = "0";
}
%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Log</title>
    </head>
    <body>
        <h1>Cadastro de Log</h1>
        <form name="cadastro" method="get" action="CAELog.jsp">
            <p><label>Acao:</label> <input type="text" name="acao" value=" <%=(acao==null)?"":acao%>" size="30" />  </p>
            <p><label>Tabela:</label> <input type="text" name="tabela" value="<%=(tabela==null)?"":tabela%>" size="50" />  </p>
            <p><label>Usuario:</label> <input type="text" name="usuario" value="<%=(usuario==null)?"":usuario%>" size="50" />  </p>
            <p><label>DataHora:</label> <input type="text" name="dataHora" value="<%= (dataHora==null)?"":dataHora%>" size="50" />  </p>
            <p><label>Observacoes:</label> <input type="text" name="observacoes" value="<%=(observacoes==null)?"":observacoes%>" size="50" />  </p>           
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
            <input type="hidden" name="codLog" value="<%=codLog%>"/>
            
        </form>
        <%= (mensagem==null)?"":mensagem %> 
        <br>
        
        <%@include file="ListarLog.jsp" %>
        
        <footer style="background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
         </footer>
    </body>
    
</html>
<%  }else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>