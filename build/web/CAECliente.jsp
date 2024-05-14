<%-- 
    Document   : CAECliente
    Created on : 21/03/2023, 15:36:52
    Author     : 13480309682
--%>
<%@page import="java.util.Date"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Cliente"%>
<%
String mensagem="";
String nome = request.getParameter("nome");
String cpf = request.getParameter("cpf");
String dataNascimento = request.getParameter("dataNascimento");
String email = request.getParameter("email");
String endereco = request.getParameter("endereco");
String telefone = request.getParameter("telefone");
String opcao = request.getParameter("opcao");
String codCliente = request.getParameter("codCliente");

Cliente objCliente = new Cliente();
ConverteData objConverte = new ConverteData();

objCliente.setNome(nome);
objCliente.setCpf(cpf);
objCliente.setDataNascimento(objConverte.converteCalendario(dataNascimento));
objCliente.setEmail(email);
objCliente.setEndereco(endereco);
objCliente.setTelefone(telefone);
objCliente.setCodCliente(Integer.parseInt(codCliente));

DAOCliente objDAOCliente = new DAOCliente();
if(opcao.equals("cadastrar")){
mensagem = objDAOCliente.inserir(objCliente);
}

if(opcao.equals("alterar")){
mensagem = objDAOCliente.alterar(objCliente);
}
if(opcao.equals("excluir")){
mensagem = objDAOCliente.excluir(objCliente);
}

 
response.sendRedirect("CadastroCliente.jsp?mensagem="+mensagem);    
%>

