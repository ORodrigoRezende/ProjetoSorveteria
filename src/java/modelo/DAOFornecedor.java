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
 * @author 12678776697
 */
public class DAOFornecedor {
    String mensagem="";
    
    public String inserir(Fornecedor objFornecedor){
        String sql = "insert into fornecedor(nome,telefone,email,endereco,cnpj) values(?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFornecedor.getNome());
            pst.setString(2, objFornecedor.getTelefone());
            pst.setString(3, objFornecedor.getEmail());
            pst.setString(4, objFornecedor.getEndereco());
            pst.setString(5, objFornecedor.getCnpj());
           
            if(pst.executeUpdate()>0){
                mensagem = "Fornecedor cadastrado com sucesso";
            }else{
                mensagem = "Fornecedor não cadastrado";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOFornecedor"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Fornecedor objFornecedor){
        String sql = "update fornecedor set nome=?,telefone=?,email=?,endereco=?,cnpj=? where codFornecedor=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFornecedor.getNome());
            pst.setString(2, objFornecedor.getTelefone());
            pst.setString(3, objFornecedor.getEmail());
            pst.setString(4, objFornecedor.getEndereco());
            pst.setString(5, objFornecedor.getCnpj());
            pst.setInt(6, objFornecedor.getCodFornecedor());
            if(pst.executeUpdate()>0){
                mensagem = "Fornecedor alterado com sucesso";
            }else{
                mensagem = "Fornecedor não alterado";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOFornecedor"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Fornecedor objFornecedor){
        String sql ="delete from fornecedor where codFornecedor=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objFornecedor.getCodFornecedor());
            if(pst.executeUpdate()>0){
                mensagem = "Fornecedor excluído com sucesso";
            }else{
                mensagem = "Fornecedor não excluído";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOFornecedor"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Fornecedor> listarFornecedor(){
        String sql = "select * from fornecedor";
        List<Fornecedor> listaFornecedor = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Fornecedor objFornecedor = new Fornecedor();
                objFornecedor.setCodFornecedor(rs.getInt("codFornecedor"));
                objFornecedor.setNome(rs.getString("nome"));
                objFornecedor.setTelefone(rs.getString("telefone"));
                objFornecedor.setEmail("email");
                objFornecedor.setEndereco(rs.getString("endereco"));
                objFornecedor.setCnpj("cnpj");
                listaFornecedor.add(objFornecedor);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarFornecedor do DAOFornecedor"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaFornecedor;
        
    }
    public Fornecedor localizar(Integer id){
        String sql = "select * from fornecedor where codFornecedor=?";
        Fornecedor objFornecedor = new Fornecedor();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                
                objFornecedor.setCodFornecedor(rs.getInt("codFornecedor"));
                objFornecedor.setNome(rs.getString("nome"));
                objFornecedor.setTelefone(rs.getString("telefone"));
                objFornecedor.setEmail("email");
                objFornecedor.setEndereco(rs.getString("endereco"));
                objFornecedor.setCnpj("cnpj");
                
                return objFornecedor;
    }
  }catch(SQLException e){
            System.out.println("Erro de SQL Localizar daoFornecedor"+e.getMessage());
  };
return null;
}
}
