<%-- 
    Document   : CAEFornecedor
    Created on : 09/05/2023, 14:56:21
    Author     : 12678776697
--%>

<%@page import="modelo.DAOFornecedor"%>
<%@page import="modelo.Fornecedor"%>
<%
String mensagem="";
String nome = request.getParameter("nome");
String telefone = request.getParameter("telefone");
String email = request.getParameter("email");
String endereco = request.getParameter("endereco");
String cnpj = request.getParameter("cnpj");
String opcao = request.getParameter("opcao");
String codFornecedor = request.getParameter("codFornecedor");

Fornecedor objFornecedor = new Fornecedor();
objFornecedor.setNome(nome);
objFornecedor.setTelefone(telefone);
objFornecedor.setEmail(email);
objFornecedor.setEndereco(endereco);
objFornecedor.setCnpj(cnpj);
objFornecedor.setCodFornecedor(Integer.parseInt(codFornecedor));

DAOFornecedor objDAOFornecedor = new DAOFornecedor();
if(opcao.equals("cadastrar")){
mensagem = objDAOFornecedor.inserir(objFornecedor);
}

if(opcao.equals("alterar")){
mensagem = objDAOFornecedor.alterar(objFornecedor);
}
if(opcao.equals("excluir")){
mensagem = objDAOFornecedor.excluir(objFornecedor);
}

 
response.sendRedirect("CadastroFornecedor.jsp?mensagem="+mensagem);    
%>
