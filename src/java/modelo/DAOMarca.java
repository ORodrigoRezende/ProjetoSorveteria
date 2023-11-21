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
public class DAOMarca {
    String mensagem="";
    
    public String inserir(Marca objMarca){
        String sql = "insert into marca(nome) values(?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMarca.getNome());
           
            if(pst.executeUpdate()>0){
                mensagem = "Marca cadastrada com sucesso";
            }else{
                mensagem = "Marca não cadastrada";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOMarca"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Marca objMarca){
        String sql = "update marca set nome=? where codMarca=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMarca.getNome());
            pst.setInt(2, objMarca.getCodMarca());
            if(pst.executeUpdate()>0){
                mensagem = "Marca alterada com sucesso";
            }else{
                mensagem = "Marca não alterada";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOMarca"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Marca objMarca){
        String sql ="delete from marca where codMarca=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objMarca.getCodMarca());
            if(pst.executeUpdate()>0){
                mensagem = "Marca excluída com sucesso";
            }else{
                mensagem = "Marca não excluída";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOMarca"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Marca> listarMarca(){
        String sql = "select * from marca";
        List<Marca> listaMarca = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Marca objMarca = new Marca();
                objMarca.setCodMarca(rs.getInt("codMarca"));
                objMarca.setNome(rs.getString("nome"));
                
                listaMarca.add(objMarca);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarMarca do DAOMarca"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaMarca;
        
    }
    public Marca localizar(Integer id){
        String sql = "select * from marca where codMarca=?";
        Marca objMarca = new Marca();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                
                objMarca.setCodMarca(rs.getInt("codMarca"));
                objMarca.setNome(rs.getString("nome"));
                return objMarca;
    }
  }catch(SQLException e){
            System.out.println("Erro de SQL Localizar daMarca"+e.getMessage());
  };
return null;
}
}

