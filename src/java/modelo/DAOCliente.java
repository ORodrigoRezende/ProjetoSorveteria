/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 13480309682
 */
public class DAOCliente {
    String mensagem="";
    
     
    ConverteData objConverte = new ConverteData();
    public String inserir(Cliente objCliente){
        String sql = "insert into clientes(nome,cpf,dataNascimento,email,endereco,telefone) values(?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCliente.getNome());
            pst.setString(2, objCliente.getCpf());
            pst.setDate(3,objConverte.converteBanco(objCliente.getDataNascimento()));
            pst.setString(4, objCliente.getEmail());
            pst.setString(5, objCliente.getEndereco());
            pst.setString(6, objCliente.getTelefone());
           
            if(pst.executeUpdate()>0){
                mensagem = "Cliente cadastrado com sucesso";
            }else{
                mensagem = "Cliente não cadastrado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOCliente"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Cliente objCliente){
        String sql = "update clientes set nome=?,cpf=?,dataNascimento=?,email=?,endereco=?,telefone=? where codCliente=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCliente.getNome());
            pst.setString(2, objCliente.getCpf());
            pst.setDate(3,objConverte.converteBanco(objCliente.getDataNascimento()));
            pst.setString(4, objCliente.getEmail());
            pst.setString(5, objCliente.getEndereco());
            pst.setString(6, objCliente.getTelefone());
            pst.setInt(7, objCliente.getCodCliente());
            if(pst.executeUpdate()>0){
                mensagem = "Cliente alterado com sucesso";
            }else{
                mensagem = "Cliente não alterado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOCliente"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Cliente objCliente){
        String sql ="delete from clientes where codCliente=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objCliente.getCodCliente());
            if(pst.executeUpdate()>0){
                mensagem = "Cliente excluído com sucesso";
            }else{
                mensagem = "Cliente não excluído";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOCliente"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Cliente> listarCliente(){
        String sql = "select * from clientes";
        List<Cliente> listaCliente = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Cliente objCliente = new Cliente();
                objCliente.setCodCliente(rs.getInt("codCliente"));
                objCliente.setNome(rs.getString("nome"));
                objCliente.setCpf(rs.getString("cpf"));
                objCliente.setDataNascimento(objConverte.converteCalendario(rs.getDate("dataNascimento")));
                objCliente.setEmail(rs.getString("email"));
                objCliente.setEndereco(rs.getString("endereco"));
                objCliente.setTelefone(rs.getString("telefone"));
                
                listaCliente.add(objCliente);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarCliente do DAOCliente"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaCliente;
        
    }
    public Cliente localizar(Integer id){
        String sql = "select * from clientes where codCliente=?";
        Cliente objCliente = new Cliente();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
               objCliente.setCodCliente(rs.getInt("codCliente"));
                objCliente.setNome(rs.getString("nome"));
                objCliente.setCpf(rs.getString("cpf"));
                objCliente.setDataNascimento(objConverte.converteCalendario(rs.getDate("dataNascimento")));
                objCliente.setEmail(rs.getString("email"));
                objCliente.setEndereco(rs.getString("endereco"));
                objCliente.setTelefone(rs.getString("telefone"));
                return objCliente;
    }
  }catch(SQLException e){
            System.out.println("Erro de SQL Localizar DAOcliente"+e.getMessage());
  };
return null;
}   

}

