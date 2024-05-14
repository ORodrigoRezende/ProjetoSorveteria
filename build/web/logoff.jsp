<%-- 
    Document   : logoff
    Created on : 01/09/2023, 17:09:36
    Author     : orodr
--%>

<HTML>
<HEAD>
</HEAD>
 <%
  session.invalidate();
  response.sendRedirect("index.jsp?mensagem=logoff efetuado com sucesso!");
%>
</HTML>
