
<%@include file="Menu.jsp"%>
<script>
            function enviar(par){
                if (par == 'login'){
                    if (document.cadastro.email.value == ''){
                      alert("Preencha o campo email");
                    }else if (document.cadastro.senha.value == ''){
                        alert("Preencha o campo senha");
                    }else {
                        document.cadastro.action='LoginUsuario.jsp';
                        document.cadastro.submit();
                    }
                } 
            }
        </script>
        <% String mensagem = request.getParameter("mensagem"); %>
        
        

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Latin1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Login</title>
	
        <style>
            
            .form-control{
    border-color: black;
            }
            .btn{
    background-color: rgb(241, 178, 243);          
            }
   
        </style>
        
	
</head>
<body>
	<h1 class= "display-5 text-center text-uppercase fw-bold mt-1 pt-3">Login</h1>
    <!-- Start Interface--><br>
	<div id="interface" class="container-fluid">

		<!-- Start nav-->
                <nav class="row"> 
                   
                    <div style="width: 100%;"> 
                        <ul class="text-center position-relative">
                        
                        </ul>
                    </div>
                </nav>
	

         <article class="row pt-3 formLogin">
             
            

                <form  class="col-md-4 " name="cadastro" method="POST">

                    
                   <p class="paragrafo pt-4" style="font-size: 2rem;">Login: <input required class="form-control" name="email" maxlength="50" placeholder="digite seu login"></p>  
                   <p class="paragrafo" style="font-size: 2rem;">Senha:<input required  class="form-control" type="password" name="senha" maxlength="50" placeholder="digite sua senha"></p>

                   <div class="text-center mt-4">
                   <input class="btn  btn-outline-light" type="reset" value="Limpar" style="font-size: 1.22rem;">
                   <input class="btn  btn-outline-light" type="submit" name="image" style="font-size: 1.22rem;" onClick="enviar('login')" value="Entrar">
                   

                   </div>
                   
                   <% if(mensagem != null){%>
                  
                      <p> <%= mensagem %></p>
                 
                   
                   
                   <%}%>
         
 </form>
             
             
                
                 
                 <div  >
                     <p class=" border border-dark py-3 px-3 mt-3"  color: #ddd">*Se voc� j� possui um cadastro, ent�o se identifique
                   usando seu login e senha! <br> *Se 
                   voc� j� estava utilizando o software, sua sess�o pode ter 
                   expirado portanto apenas fa�a o login novamente <br> *Se 
                   voc� ainda n�o possui um login e senha, dirija-se ao seu gerente</p>
                     <p class="border border-dark py-3 px-3"  color: #ddd">Em caso de d�vida entre em contato pelo e-mail:  SorveteriaC&R@gmail.com</p>
                </div>
 
         </artilce>     
               
 </div>
      <footer style="margin-top:98px ; background-color: rgb(241, 178, 243); height: 5.5rem;">
            <img height="75" src="img/Logo.png " class="float-start">

         <p class="float-end" style="color: white">&copy; 2023 - Projeto Sorveteria</p>
� �      </footer>





    </div>              
</body>
</html>




