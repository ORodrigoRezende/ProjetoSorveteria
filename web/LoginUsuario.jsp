<%@page import="modelo.Funcionario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DAOFuncionario"%>
<%@include file="Menu.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    DAOFuncionario login = new DAOFuncionario();
    Funcionario usuario = new Funcionario();
    System.out.println("email="+email+" senha="+senha);
    usuario.setEmail(email);
    usuario.setSenha(senha);
  
    ResultSet rs = login.getLogin(usuario);
    
     if (!(rs.next())) {
 
        response.sendRedirect("index.jsp?mensagem=Login inv�lido");
    } else {
        
         
                // String senhaBD = rs.getString("senha");
        String nomeBD = rs.getString("nome");
        String codigoIDUsuarioBD = rs.getString("codFuncionario");
       // if (!senha.equals(senhaBD)) {
        //    response.sendRedirect("index.jsp?mensagem=Senha inv�lida");
       // } else {
            session.setAttribute("email", email);
            session.setAttribute("nome", nomeBD);
            session.setAttribute("codigoUsuario", codigoIDUsuarioBD);
       // }
       
    }
   
%>

<html>
    <head>
        <title>P�gina Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        
    </head>
    <body >
       

        
        <br>
<br>
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="700" >
                
                        <tr >

                            <th align="LEFT" width="11%" bordercolor="#FFFFFF">


                                <div align="left"><font face="verdana" size="1"> </font></div>
                            </th>

                            <th align="LEFT" bordercolor="#FFFFFF" width="89%">
                                <p>&nbsp;</p>
                                <p><b><font color="#990000">* </font></b>Bem vindo,
                                    voc&ecirc; esta logado! </p>
                                <p><br>
                                    <font color="#990000"></font><font color="#990000"></font>* Para
                                    sua seguran&ccedil;a, efetue seu logof sempre que voc&ecirc; sair do nosso
                                    site, para isso clique no link localizado na barra logo acima</p>
                                <p>Em caso de d&uacute;vida, entre em contato pelo e-mail: tuliodias@yahoo.com.br<br>
                                    <br>
                                </p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p></th>
                        </tr>
                    </table>

    </body>
 
</html>


