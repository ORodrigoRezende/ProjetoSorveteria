<%-- 
    Document   : RelatorioProduto
    Created on : 24/10/2023, 15:59:48
    Author     : 12678776697
--%>

<%@page import="java.net.URL"%>
<%@page import="modelo.Relatorio"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.o
   
   <%@page import="java.sql.*,java.util.HashMap,java.util.Map,net.sf.jasperreports.engine.*, net.sf.jasperreports.engine.util.*,net.sf.jasperreports.view.JasperViewer" %>




<%
    String PrecoMinimo = request.getParameter("PrecoMinimo");
    String PrecoMaximo = request.getParameter("PrecoMaximo");    


    double PrecoMinimo1 = Double.parseDouble(PrecoMinimo);
    double PrecoMaximo2 = Double.parseDouble(PrecoMaximo);
    
    
    
    Relatorio rel = new Relatorio();
    ResultSet rs = rel.relatorioProduto(PrecoMinimo1, PrecoMaximo2);

                if (rs.next()) {
                    rs.beforeFirst();


String caminho = "C:/Users/orodr/OneDrive/Área de Trabalho/IF/Projeto Sorveteria/Projeto Sorveteria/web/Relatorio/RelatorioProduto.jasper";



		//URL arquivo = getClass().getResource("/relatorio/relatorioFuncionario.jasper");  
//String caminho2 = arquivo.toString();		
		//JasperReport jr;
		//jr = (JasperReport) JRLoader.loadObject( arquivo );		
		//System.out.println("Caminho: "+jr);		

Map parameters = new HashMap();
//parameters.put( "teste", "Texto enviado 4" );
JRResultSetDataSource jrRS = new JRResultSetDataSource(rs);

JasperPrint impressao = JasperFillManager.fillReport(caminho, parameters,jrRS);

//gravar relatorio com problema não atualiza
//JasperExportManager.exportReportToPdfFile(impressao,caminho + "RelTeste.pdf");
//response.sendRedirect("relatorios/RelTeste.pdf"); //mostra o resultado na tela

//sem gravar o relatório
byte[] bytes = JasperExportManager.exportReportToPdf(impressao);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream = response.getOutputStream();
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush();
ouputStream.close();

}
  else{
    %>

<jsp:forward page="Mensagem.jsp">
    <jsp:param name="mensagem" value="Não há produto cadastrado, para cadastrar um produto clique no menu CADASTRO > Produto." />
</jsp:forward>


<%
    }
  
%>
