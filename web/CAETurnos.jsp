<%-- 
    Document   : CAETurnos
    Created on : 13/05/2023, 16:58:57
    Author     : orodr
--%>

<%@page import="modelo.DAOTurnos"%>
<%@page import="modelo.Turnos"%>
<%
String mensagem="";
String codFuncionario = request.getParameter("codFuncionario");
String horaInicio = request.getParameter("horaInicio");
String horaFim = request.getParameter("horaFim");
String opcao = request.getParameter("opcao");
String codTurnos = request.getParameter("codTurnos");

Turnos objTurnos = new Turnos();

objTurnos.getObjFuncionario().setCodFuncionario(Integer.parseInt(request.getParameter("codFuncionario")));
objTurnos.setHoraInicio(horaInicio);
objTurnos.setHoraFim(horaFim);
objTurnos.setCodTurnos(Integer.parseInt(codTurnos));

DAOTurnos objDAOTurnos = new DAOTurnos();
if(opcao.equals("cadastrar")){
mensagem = objDAOTurnos.inserir(objTurnos);
}

if(opcao.equals("alterar")){
mensagem = objDAOTurnos.alterar(objTurnos);
}
if(opcao.equals("excluir")){
mensagem = objDAOTurnos.excluir(objTurnos);
}

 
response.sendRedirect("CadastroTurnos.jsp?mensagem="+mensagem);    
%>