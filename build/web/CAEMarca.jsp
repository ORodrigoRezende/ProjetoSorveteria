<%-- 
    Document   : CAEMarca
    Created on : 21/03/2023, 15:36:52
    Author     : 13480309682
--%>
<%@page import="java.util.Date"%>
<%@page import="modelo.DAOMarca"%>
<%@page import="modelo.Marca"%>
<%
String mensagem="";
String nome = request.getParameter("nome");
String opcao = request.getParameter("opcao");
String codMarca = request.getParameter("codMarca");

Marca objMarca = new Marca();

objMarca.setNome(nome);
objMarca.setCodMarca(Integer.parseInt(codMarca));

DAOMarca objDAOMarca = new DAOMarca();
if(opcao.equals("cadastrar")){
mensagem = objDAOMarca.inserir(objMarca);
}

if(opcao.equals("alterar")){
mensagem = objDAOMarca.alterar(objMarca);
}
if(opcao.equals("excluir")){
mensagem = objDAOMarca.excluir(objMarca);
}

 
response.sendRedirect("CadastroMarca.jsp?mensagem="+mensagem);    
%>

