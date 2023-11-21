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
public class DAOProduto {
    String mensagem="";
    ConverteData objConverte = new ConverteData();
    DAOCategoria objDaoCategoria = new DAOCategoria();
    DAOMarca objDaoMarca = new DAOMarca();
    DAOFornecedor objDaoFornecedor = new DAOFornecedor();
    
    public String inserir(Produto objProduto){
        String sql = "insert into produto(codCategoria,codMarca,codFornecedor,nomeProduto,margemdeLucro,precoVenda,precoCusto,quantidadeEstoque) values(?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objProduto.getObjCategoria().getCodCategoria());
            pst.setInt(2, objProduto.getObjMarca().getCodMarca());
            pst.setInt(3, objProduto.getObjFornecedor().getCodFornecedor());
            pst.setString(4, objProduto.getNomeProduto());
            pst.setDouble(5, objProduto.getMargemdeLucro());
            pst.setDouble(6, objProduto.getPrecoVenda()); 
            pst.setDouble(7, objProduto.getPrecoCusto());
            pst.setDouble(8, objProduto.getQuantidadeEstoque());
            if(pst.executeUpdate()>0){
                mensagem = "Produto cadastrado com sucesso";
            }else{
                mensagem = "Produto não cadastrado";
            }
            pst.close(); 
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOProduto"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Produto> listarProduto(){
        String sql = "select * from produto";
        List<Produto> listaProduto = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Produto objProduto = new Produto();
                objProduto.setCodProduto(rs.getInt("codProduto"));
                objProduto.setObjCategoria(objDaoCategoria.localizar(rs.getInt("codCategoria")));
                objProduto.setObjMarca(objDaoMarca.localizar(rs.getInt("codMarca")));
                objProduto.setObjFornecedor(objDaoFornecedor.localizar(rs.getInt("codFornecedor")));
                objProduto.setNomeProduto(rs.getString("nomeProduto"));
                objProduto.setMargemdeLucro(rs.getDouble("margemdeLucro"));
                objProduto.setPrecoVenda(rs.getDouble("precoVenda"));
                objProduto.setPrecoCusto(rs.getDouble("precoCusto"));
                objProduto.setQuantidadeEstoque(rs.getDouble("quantidadeEstoque"));
                listaProduto.add(objProduto);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listar Produto do DAOProduto"+ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaProduto;
        
    }
    public String alterar(Produto objProduto){
        String sql = "update produto set codCategoria=?,codMarca=?,codFornecedor=?,nomeProduto=?,margemdeLucro=?,precoVenda=?,precoCusto=?,quantidadeEstoque=? where codProduto=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objProduto.getObjCategoria().getCodCategoria());
            pst.setInt(2, objProduto.getObjMarca().getCodMarca());
            pst.setInt(3, objProduto.getObjFornecedor().getCodFornecedor());
            pst.setString(4, objProduto.getNomeProduto());
            pst.setDouble(5, objProduto.getMargemdeLucro());
            pst.setDouble(6, objProduto.getPrecoVenda()); 
            pst.setDouble(7, objProduto.getPrecoCusto());
            pst.setDouble(8, objProduto.getQuantidadeEstoque());
            pst.setDouble(9, objProduto.getCodProduto());
            if(pst.executeUpdate()>0){
                mensagem = "Produto alterado com sucesso";
            }else{
                mensagem = "Produto não alterado";
            }
            pst.close(); 
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOProduto"+ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String excluir(Produto objProduto){
        String sql = "delete from produto where codProduto=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objProduto.getCodProduto());
            if(pst.executeUpdate()>0){
                mensagem = "Produto excluida com sucesso";
            }else{
                mensagem = "Produto não excluida";
            }
            pst.close(); 
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOProduto"+ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public Produto localizar(Integer id){
        String sql = "select * from produto where codProduto=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Produto objProduto = new Produto();
                objProduto.setCodProduto(rs.getInt("codProduto"));
                objProduto.setObjCategoria(objDaoCategoria.localizar(rs.getInt("codCategoria")));
                objProduto.setObjMarca(objDaoMarca.localizar(rs.getInt("codMarca")));
                objProduto.setObjFornecedor(objDaoFornecedor.localizar(rs.getInt("codFornecedor")));
                objProduto.setNomeProduto(rs.getString("nomeProduto"));
                objProduto.setQuantidadeEstoque(rs.getDouble("quantidadeEstoque"));
                objProduto.setPrecoCusto(rs.getDouble("precoCusto"));
                objProduto.setPrecoVenda(rs.getDouble("precoVenda"));
                System.out.println("localizar Dao produto");
                System.out.println("cod:"+rs.getInt("codProduto")+"nome:"+rs.getString("nomeProduto"));
                 return objProduto;
            }
            
        }catch(SQLException e){
            System.out.println("Erro de SQL 12 Localizar"+e.getMessage());
              }
        return null;
}   
}
