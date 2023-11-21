<%-- 
    Document   : CAELog
    Created on : 21/03/2023, 15:36:52
    Author     : 13480309682
--%>
<%@page import="java.util.Date"%>
<%@page import="modelo.DAOLog"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Log"%>
<%
String mensagem="";
String acao = request.getParameter("acao");
String tabela = request.getParameter("tabela");
String usuario = request.getParameter("usuario");
String dataHora = request.getParameter("dataHora");
String observacoes = request.getParameter("observacoes");
String opcao = request.getParameter("opcao");
String codLog = request.getParameter("codLog");

Log objLog = new Log();
ConverteData objConverte = new ConverteData();

objLog.setAcao(acao);
objLog.setTabela(tabela);
objLog.setUsuario(usuario);
objLog.setDataHora(objConverte.converteCalendario(dataHora));
objLog.setObservacoes(observacoes);
objLog.setCodLog(Integer.parseInt(codLog));

DAOLog objDAOLog = new DAOLog();
if(opcao.equals("cadastrar")){
mensagem = objDAOLog.inserir(objLog);
}

if(opcao.equals("alterar")){
mensagem = objDAOLog.alterar(objLog);
}
if(opcao.equals("excluir")){
mensagem = objDAOLog.excluir(objLog);
}

 
response.sendRedirect("CadastroLog.jsp?mensagem="+mensagem);    
%>

