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
public class DAOVenda {
    String mensagem="";
    ConverteData objConverte = new ConverteData();
    
    DAOFuncionario objDAOFuncionario = new DAOFuncionario();
    DAOCliente objDAOCliente = new DAOCliente();
    Venda objVenda = new Venda();
    
     private int lastCodVenda;

    public int getlastCodVenda() {
        return lastCodVenda;
    }

    
    public String incluir(Venda objVenda){
        String mensagem;
        String sql = "insert into venda(codFuncionario,codCliente,dataVenda) values(?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objVenda.getCodFuncionario().getCodFuncionario());
            pst.setInt(2, objVenda.getCodCliente().getCodCliente());
            pst.setDate(3,objConverte.converteBanco(objVenda.getDataVenda()));
            if (pst.executeUpdate() > 0) {
                 ResultSet rs = pst.getGeneratedKeys();
                if (rs.next()) {
                    lastCodVenda = rs.getInt(1);
                }
                mensagem = "Venda cadastrada com sucesso";
            } else {
                mensagem = "Venda não cadastrado!";
            }
            pst.close(); 
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOVenda"+ex.getMessage();
        }
        return mensagem;
    }
    
    
    public String remove(Venda objVenda){
        String sql = "delete from venda where codVenda=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objVenda.getCodVenda());
            if(pst.executeUpdate()>0){
                mensagem = "Venda excluida com sucesso";
            }else{
                mensagem = "Venda não excluida";
            }
            pst.close(); 
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOVenda"+ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
     public Venda localizar(Integer id){
        String sql = "select * from venda where codVenda=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){                
                objVenda.setCodVenda(rs.getInt("codVenda"));
                objVenda.setCodFuncionario(objDAOFuncionario.localizar(rs.getInt("codFuncionario")));
                objVenda.setCodCliente(objDAOCliente.localizar(rs.getInt("codCliente")));
                objVenda.setDataVenda(objConverte.converteCalendario(rs.getDate("dataVenda"))); 
                 }
            
        }catch(SQLException e){
            System.out.println("Erro de SQL Localizar daovenda "+e.getMessage());
              };
        return null;
    }   
}

 
