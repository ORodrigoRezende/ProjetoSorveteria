<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOProduto"%>
<%
DAOProduto objDAOProduto = new DAOProduto();

List<Produto> listaProduto = objDAOProduto.listarProduto();

%>

<head>
    
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloTabela.css">

    <!-- Javascript -->
    <script src="js/bootstrap.bundle.js"></script>
    
</head>
<div class="container mx-auto d-flex">
<table class="table container-fluid text-center table-bordered table-sm px-3" >
    <thead class="topoTabela">
        <tr>
            <th>CATEGORIA</th>
            <th>PRODUTO</th> 
            <th>MARCA</th>
            <th>FORNECEDOR</th>
            <th>NOME</th>
            <th>MARGEM DE LUCRO</th>
            <th>PREÇO VENDA</th>
            <th>PREÇO CUSTO</th>
            <th>QUANTIDADE ESTOQUE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
            
        </tr>
    </thead>
    
    <tbody>
        <% for(Produto produto: listaProduto){ %>
        <tr>
            <td><%= produto.getCodProduto() %></td>
            <td><%= produto.getObjCategoria().getNome() %></td>
            <td><%= produto.getObjMarca().getNome()%></td>
            <td><%= produto.getObjFornecedor().getNome()%></td>
            <td><%= produto.getNomeProduto()%></td>
            <td><%= produto.getMargemdeLucro() %></td>
            <td><%= produto.getPrecoVenda()%></td>        
            <td><%= produto.getPrecoCusto()%></td>
            <td><%= produto.getQuantidadeEstoque()%></td>
            <td><a href="CadastroProduto.jsp?opcao=alterar&codProduto=<%=produto.getCodProduto()%>&codCategoria=<%=produto.getObjCategoria().getCodCategoria() %>&codMarca=<%=produto.getObjMarca().getCodMarca()%>&codFornecedor=<%=produto.getObjFornecedor().getCodFornecedor() %>&nome=<%=produto.getNomeProduto()%>&margemdeLucro=<%= produto.getMargemdeLucro() %>&precoVenda=<%=produto.getPrecoVenda()%>&precoCusto=<%=produto.getPrecoCusto()%>&quantidadeEstoque=<%=produto.getQuantidadeEstoque()%>">Alterar</a></td>
            <td><a href="CadastroProduto.jsp?opcao=excluir&codProduto=<%=produto.getCodProduto()%>&codCategoria=<%=produto.getObjCategoria().getCodCategoria() %>&codMarca=<%=produto.getObjMarca().getCodMarca()%>&codFornecedor=<%=produto.getObjFornecedor().getCodFornecedor() %>&nome=<%=produto.getNomeProduto()%>&margemdeLucro=<%= produto.getMargemdeLucro() %>&precoVenda=<%=produto.getPrecoVenda()%>&precoCusto=<%=produto.getPrecoCusto()%>&quantidadeEstoque=<%=produto.getQuantidadeEstoque()%>">Excluir</a></td>
        </tr>
        <% } %>
    </tbody>
    </div>
</table>
