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
public class DAOItemVenda {
    String mensagem;
    
    DAOVenda objDAOVenda = new DAOVenda();
    DAOProduto objDAOProduto = new DAOProduto();
    ItemVenda objItemVenda = new ItemVenda();
    
    public String incluir(ItemVenda objItemVenda){
        String sql = "insert into itemvenda(codVenda,codProduto,quantVenda,valor) values(?,?,?,?)";
        try{
            System.out.println("teste incluir dao item");
            System.out.println("cod venda: "+objItemVenda.getCodVenda().getCodVenda());
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objItemVenda.getCodVenda().getCodVenda());
            pst.setInt(2, objItemVenda.getCodProduto().getCodProduto());
            pst.setDouble(3, objItemVenda.getQuantVenda());
            pst.setDouble(4, objItemVenda.getValor());
           
            if(pst.executeUpdate()>0){
                mensagem = "ItemVenda cadastrado com sucesso";
            }else{
                mensagem = "ItemVenda não cadastrado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOItemVenda"+ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String remover(ItemVenda objItemVenda){
        String sql ="delete from itemvenda where codItemVenda=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objItemVenda.getCodItemVenda());
            if(pst.executeUpdate()>0){
                mensagem = "ItemVenda removido com sucesso";
            }else{
                mensagem = "ItemVenda não removido";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no remover do DAOItemVenda"+ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    
    public List<ItemVenda> getLista(Integer id){
        String sql = "select * from itemvenda where codVenda=?";
        List<ItemVenda> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                ItemVenda objItemVenda = new ItemVenda();
                objItemVenda.setCodItemVenda(rs.getInt("codItemVenda"));
                objItemVenda.setCodVenda(objDAOVenda.localizar(rs.getInt("codVenda")));
                objItemVenda.setCodProduto(objDAOProduto.localizar(rs.getInt("codProduto")));
                objItemVenda.setQuantVenda(rs.getDouble("quantVenda"));
                objItemVenda.setValor(rs.getDouble("valor"));
                lista.add(objItemVenda);
            }
            rs.close();
            pst.close();
        }catch(SQLException e){
            System.out.println("Erro de SQL DAO ItemVenda getLista(): "+e.getMessage());
        }
        return lista;
    }
}

