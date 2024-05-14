<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.DAOItemVenda"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.DAOVenda"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ConverteData"%>

<%
    
    String codVenda = request.getParameter("codVenda");
    String idprodAdquirido = request.getParameter("idProdAdquirido");
    String dataVenda = request.getParameter("dataVenda");
    String opcao = request.getParameter("opcao");
    
    ConverteData converte = new ConverteData();
    Venda venda = new Venda();
    venda.setCodVenda(Integer.parseInt(codVenda));
    venda.getCodCliente().setCodCliente(Integer.parseInt(request.getParameter("codCliente")));
    venda.getCodFuncionario().setCodFuncionario(Integer.parseInt(request.getParameter("codFuncionario")));
    venda.setDataVenda(converte.converteCalendario(request.getParameter("dataVenda")));
    
    DAOVenda daoVenda = new DAOVenda();
    ItemVenda itemVenda = new ItemVenda();
    DAOItemVenda daoItens = new DAOItemVenda();

    if (opcao.equals("cadastrar") && codVenda.equals("0")) {
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoVenda.incluir(venda)+"&codVenda="+daoVenda.getlastCodVenda()+"&codCliente="+venda.getCodCliente().getCodCliente()+"&dataVenda="+dataVenda);
    }
    if (opcao.equals("vender")){
      
        Produto produto = new Produto();
        DAOProduto daoProduto = new DAOProduto();
         
        produto = daoProduto.localizar(Integer.parseInt(request.getParameter("codProduto")));
        double valor = produto.getPrecoVenda();
        
        
        itemVenda.getCodVenda().setCodVenda(Integer.parseInt(request.getParameter("codVenda")));  
        itemVenda.getCodProduto().setCodProduto(Integer.parseInt(request.getParameter("codProduto")));
        itemVenda.setQuantVenda(Double.parseDouble(request.getParameter("quantVenda")));
        itemVenda.setValor(valor);

 
       response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoItens.incluir(itemVenda)+"&codVenda="+codVenda+"&codFuncionario="+venda.getCodFuncionario().getCodFuncionario()+"&codCliente="+venda.getCodCliente().getCodCliente()+"&dataVenda="+dataVenda);
    }
      if (opcao.equals("remover")){
        itemVenda.setCodItemVenda(Integer.parseInt(idprodAdquirido));
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoItens.remover(itemVenda)+"&codVenda="+codVenda+"&codFuncionario="+venda.getCodFuncionario().getCodFuncionario()+"&codCliente="+venda.getCodCliente().getCodCliente()+"&dataVenda="+dataVenda);
    }
    if (opcao.equals("finalizar")){
        response.sendRedirect("CadastroVenda.jsp?mensagem=Venda Finalizada&codVenda=0");
    }
     if (opcao.equals("cancelar")){
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoVenda.remove(venda)+"&codVenda=0");
    }


%>