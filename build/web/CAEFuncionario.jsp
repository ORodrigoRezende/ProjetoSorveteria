<%-- 
    Document   : CAEFuncionario
    Created on : 21/03/2023, 15:36:52
    Author     : 13480309682
--%>

<%@page import="modelo.ConverteData"%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario"%>
<%
String mensagem="";
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

Funcionario objFuncionario = new Funcionario();
ConverteData objConverte = new ConverteData();

objFuncionario.setNome(nome);
objFuncionario.setCargo(cargo);
objFuncionario.setEndereco(endereco);
objFuncionario.setCpf(cpf);
objFuncionario.setSalario(Double.parseDouble(salario));
objFuncionario.setNascimento(objConverte.converteCalendario(nascimento));
objFuncionario.setEmail(email);
objFuncionario.setUsuario(usuario);
objFuncionario.setSenha(senha);
objFuncionario.setClt(clt);
objFuncionario.setCodFuncionario(Integer.parseInt(codFuncionario));

DAOFuncionario objDAOFuncionario = new DAOFuncionario();
if(opcao.equals("cadastrar")){
mensagem = objDAOFuncionario.inserir(objFuncionario);
}

if(opcao.equals("alterar")){
mensagem = objDAOFuncionario.alterar(objFuncionario);
}
if(opcao.equals("excluir")){
mensagem = objDAOFuncionario.excluir(objFuncionario);
}

 
response.sendRedirect("CadastroFuncionario.jsp?mensagem="+mensagem);    
%>

