<%-- 
    Document   : CAEItemVenda
    Created on : 21/03/2023, 15:36:52
    Author     : 13480309682
--%>

<%@page import="modelo.DAOItemVenda"%>
<%@page import="modelo.ItemVenda"%>
<%
String mensagem="";
String codVenda = request.getParameter("codVenda");
String codProduto = request.getParameter("codProduto");
String quantVenda = request.getParameter("quantVenda");
String valor = request.getParameter("valor");
String opcao = request.getParameter("opcao");
String codItemVenda = request.getParameter("codItemVenda");

ItemVenda objItemVenda = new ItemVenda();
objItemVenda.setCodVenda(Integer.parseInt(codVenda));
objItemVenda.setCodProduto(Integer.parseInt(codProduto));
objItemVenda.setQuantVenda(Double.parseDouble(quantVenda));
objItemVenda.setValor(Double.parseDouble(valor));
objItemVenda.setCodItemVenda(Integer.parseInt(codItemVenda));

DAOItemVenda objDAOItemVenda = new DAOItemVenda();
if(opcao.equals("cadastrar")){
mensagem = objDAOItemVenda.inserir(objItemVenda);
}

if(opcao.equals("alterar")){
mensagem = objDAOItemVenda.alterar(objItemVenda);
}
if(opcao.equals("excluir")){
mensagem = objDAOItemVenda.excluir(objItemVenda);
}

 
response.sendRedirect("CadastroItemVenda.jsp?mensagem="+mensagem);    
%>

