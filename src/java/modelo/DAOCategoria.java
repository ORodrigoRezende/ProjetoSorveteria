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
 * @author orodr
 */

public class DAOCategoria {
    String mensagem="";
    
    public String inserir(Categoria objCategoria){
        String sql = "insert into categoria (nome,descricao) values(?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCategoria.getNome());
            pst.setString(2, objCategoria.getDescricao());
            if(pst.executeUpdate()>0){
                mensagem = "Categoria cadastrada com sucesso";
            }else{
                mensagem = "Categoria não cadastrado";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOCategoria"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Categoria objCategoria){
        String sql = "update categoria set nome=? , descricao=? where codCategoria=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCategoria.getNome());
            pst.setString(2, objCategoria.getDescricao());
            pst.setInt(3, objCategoria.getCodCategoria());
            if(pst.executeUpdate()>0){
                mensagem = "Categoria alterada com sucesso";
            }else{
                mensagem = "Categoria não alterada";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOCategoria"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Categoria objCategoria){
        String sql ="delete from categoria where codCategoria=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objCategoria.getCodCategoria());
            if(pst.executeUpdate()>0){
                mensagem = "Categoria excluída com sucesso";
            }else{
                mensagem = "Categoria não excluída";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOCategoria"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Categoria> listarCategoria(){
        String sql = "select * from categoria";
        List<Categoria> listaCategoria = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Categoria objCategoria = new Categoria();
                objCategoria.setCodCategoria(rs.getInt("codCategoria"));
                objCategoria.setNome(rs.getString("nome"));
                objCategoria.setDescricao(rs.getString("descricao"));
                
                listaCategoria.add(objCategoria);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarCategoria do DAOCategoria"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaCategoria;
        
    }
    public Categoria localizar(Integer id){
        String sql = "select * from categoria where codCategoria=?";
        Categoria objCategoria = new Categoria();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCategoria.setCodCategoria(rs.getInt("codCategoria"));
                objCategoria.setNome(rs.getString("nome"));
                objCategoria.setDescricao(rs.getString("descricao"));
                return objCategoria;
    }
  }catch(SQLException e){
            System.out.println("Erro de SQL Localizar daocategoria"+e.getMessage());
  };
return null;
}
}

