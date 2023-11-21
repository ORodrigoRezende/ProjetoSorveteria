<%-- 
    Document   : CAEProduto
    Created on : 21/03/2023, 15:36:45
    Author     : 12678776697
--%>
<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.Produto"%>
<%
String mensagem="";
String codCategoria = request.getParameter("codCategoria");
String codMarca = request.getParameter("codMarca");
String codFornecedor = request.getParameter("codFornecedor");
String nomeProduto = request.getParameter("nomeProduto");
String margemdeLucro = request.getParameter("margemdeLucro");
String precoVenda = request.getParameter("precoVenda");
String precoCusto = request.getParameter("precoCusto");
String quantidadeEstoque = request.getParameter("quantidadeEstoque");
String opcao = request.getParameter("opcao");
String codProduto = request.getParameter("codProduto");

Produto objProduto = new Produto();

objProduto.getObjCategoria().setCodCategoria(Integer.parseInt(request.getParameter("codCategoria")));
objProduto.getObjMarca().setCodMarca(Integer.parseInt(request.getParameter("codMarca")));
objProduto.getObjFornecedor().setCodFornecedor(Integer.parseInt(request.getParameter("codFornecedor")));
objProduto.setNomeProduto(nomeProduto);
objProduto.setQuantidadeEstoque(Double.parseDouble(quantidadeEstoque));
objProduto.setMargemdeLucro(Double.parseDouble(margemdeLucro));
objProduto.setPrecoVenda(Double.parseDouble(precoVenda));
objProduto.setPrecoCusto(Double.parseDouble(precoCusto));
objProduto.setCodProduto(Integer.parseInt(codProduto));

DAOProduto objDAOProduto = new DAOProduto();
if(opcao.equals("cadastrar")){
  mensagem = objDAOProduto.inserir(objProduto);  
}
if(opcao.equals("alterar")){
  mensagem = objDAOProduto.alterar(objProduto);  
}
if(opcao.equals("excluir")){
  mensagem = objDAOProduto.excluir(objProduto);  
}
response.sendRedirect("CadastroProduto.jsp?mensagem="+mensagem);    
%>
