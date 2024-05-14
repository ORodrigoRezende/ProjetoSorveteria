 <%@page import="modelo.DAOCategoria"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.DAOMarca"%>
<%@page import="modelo.Marca"%>
<%@page import="modelo.DAOFornecedor"%>
<%@page import="modelo.Fornecedor"%>
<% if (session.getAttribute("nome") != null){%>

<%
 String mensagem = request.getParameter("mensagem");
 String codCategoria = request.getParameter("codCategoria");
 String codMarca = request.getParameter("codMarca");
 String codFornecedor = request.getParameter("codFornecedor");
 String nomeProduto = request.getParameter("nomeProduto");
 String margemdeLucro = request.getParameter("margemdeLucro");
 String precoVenda = request.getParameter("precoVenda");
 String precoCusto = request.getParameter("precoCusto");
 String quantidadeEstoque = request.getParameter("quantidadeEstoque");
 String opcao = request.getParameter("opcao");
 String codProduto = request.getParameter("codProduto");
 if(opcao==null){
     opcao="cadastrar";    
 }
 if(codProduto==null){
     codProduto = "0";    
 }
 if(codMarca==null){
     codMarca = "0";    
 }
 if(codFornecedor==null){
     codFornecedor = "0";    
 }
 if(codCategoria==null){
     codCategoria = "0";    
 }
 
    DAOCategoria daoCategoria = new DAOCategoria();
    List<Categoria> listaCategoria = daoCategoria.listarCategoria();
    
    DAOMarca daoMarca = new DAOMarca();
    List<Marca> listaMarca = daoMarca.listarMarca();
    
    DAOFornecedor daoFornecedor = new DAOFornecedor();
    List<Fornecedor> listaFornecedor = daoFornecedor.listarFornecedor();
%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<%@include file="Menu.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        input[type="submit"] {
            background-color: rgb(241, 178, 243);
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            text-transform: uppercase;
            border-radius: 10px;
        }
        .margem{
            margin-left: 3rem;

        }
        </style>
        
               <script>
    function validarSomenteLetras(input) {
        input.value = input.value.replace(/[^A-Za-z\s]+/g, '');

        if (input.value !== input.value.replace(/[^A-Za-z\s]+/g, '')) {
            alert("Digite apenas letras e espaços no campo.");
        }
    }
</script>

        
        <!--<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estiloCadastro.css">

    <!-- Javascript 
    <script src="js/bootstrap.bundle.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Produto</title>-->
    <meta charset="utf-8">
    <title>Camilly e Rodrigo - sorveteria </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    </head >
    
    <div class="fonte">
    
    <body> 
        <section class="margem">
        <h1 class= "display-5 text-center text-uppercase fw-bold mt-1 py-5">Cadastro de Produto</h1>
        <form name="cadastro" method="get" action="CAEProduto.jsp">
            <p >  <label>Categoria: </label>
                <select name="codCategoria">
                    <%for(Categoria categoria:listaCategoria){ %>
                    <% if (codCategoria.equals(String.valueOf(categoria.getCodCategoria()))) {%> 
                      <option selected value="<%= categoria.getCodCategoria()%>"><%= categoria.getNome()%> </option>
                    <%} else {%>
                    <option value="<%= categoria.getCodCategoria()%>"><%= categoria.getNome()%> </option>
                    <%}%>
                      <% }%>
                </select>
            </p>
            <p>  <label>Marca: </label>
                <select name="codMarca">
                    <%for(Marca marca:listaMarca){ %>
                    <% if (codMarca.equals(String.valueOf(marca.getCodMarca()))) {%> 
                      <option selected value="<%= marca.getCodMarca()%>"><%= marca.getNome()%> </option>
                    <%} else {%>
                    <option value="<%= marca.getCodMarca()%>"><%= marca.getNome()%> </option>
                    <%}%>
                      <% }%>
                </select>
            </p>
            <p>  <label>Fornecedor: </label>
                <select name="codFornecedor">
                    <%for(Fornecedor fornecedor:listaFornecedor){ %>
                    <% if (codFornecedor.equals(String.valueOf(fornecedor.getCodFornecedor()))) {%> 
                      <option selected value="<%= fornecedor.getCodFornecedor()%>"><%= fornecedor.getNome()%> </option>
                    <%} else {%>
                    <option value="<%= fornecedor.getCodFornecedor()%>"><%= fornecedor.getNome()%> </option>
                    <%}%>
                      <% }%>
                </select>
            </p>
            <p><label>Nome do Produto:</label> <input type="text" name="nomeProduto" pattern="[A-Za-z\s]+" placeholder="Digite o nome do produto" title="Digite apenas letras e espaços" oninput="validarSomenteLetras(this)" value="<%= (nomeProduto == null) ? "" : nomeProduto %>" size="20" required/>  </p>
            <p><label>Margem de Lucro:</label> <input type="text" name="margemdeLucro" placeholder="Digite a margem de lucro" value="<%=(margemdeLucro==null)?"":margemdeLucro%>" size="20" required />  </p>   
            <p><label>Preço de Venda:</label> <input type="text" name="precoVenda" placeholder="Digite o preço de venda" value="<%=(precoVenda==null)?"":precoVenda%>" size="20" required />  </p>
            <p><label>Preço de Custo:</label> <input type="text" name="precoCusto" placeholder="Digite o preço de custo" value="<%=(precoCusto==null)?"":precoCusto%>" size="20" required />  </p>
            <p><label>Quantidade em Estoque:</label> <input type="text" name="quantidadeEstoque" placeholder="Digite a quantidade em estoque" value="<%=(quantidadeEstoque==null)?"":quantidadeEstoque%>" size="20" required />  </p>
          
            
            <%if(opcao.equals("cadastrar")){%>
            <input type="submit" value="cadastrar" name="cadastrar" />
            <%}%>
            <%if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="Alterar" />
            <%}%>
            <%if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="Excluir" />
            <%}%>
                
            
            
            <input type="hidden" name="opcao" value="<%=opcao%>" />
            <input type="hidden" name="codProduto" value="<%=codProduto%>"/>
            
        </form>
                <%=(mensagem==null)?"":mensagem%> 
        </section>
        <section class="my-5">
        <%@include file="ListarProduto.jsp"%>
        </section>
        <footer style="background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
         </footer>
        </div>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>