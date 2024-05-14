<%-- 
    Document   : CAECategoria
    Created on : 13/05/2023, 16:17:05
    Author     : orodr
--%>

<%@page import="modelo.DAOCategoria"%>
<%@page import="modelo.Categoria"%>
<%
String mensagem="";
String nome = request.getParameter("nome");
String descricao = request.getParameter("descricao");
String opcao = request.getParameter("opcao");
String codCategoria = request.getParameter("codCategoria");

Categoria objCategoria = new Categoria();
objCategoria.setNome(nome);
objCategoria.setDescricao(descricao);
objCategoria.setCodCategoria(Integer.parseInt(codCategoria));

DAOCategoria objDAOCategoria = new DAOCategoria();
if(opcao.equals("cadastrar")){
mensagem = objDAOCategoria.inserir(objCategoria);
}

if(opcao.equals("alterar")){
mensagem = objDAOCategoria.alterar(objCategoria);
}
if(opcao.equals("excluir")){
mensagem = objDAOCategoria.excluir(objCategoria);
}

 
response.sendRedirect("CadastroCategoria.jsp?mensagem="+mensagem);    
%>
