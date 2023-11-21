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
public class DAOLog {
    String mensagem="";
        ConverteData objConverte = new ConverteData();
    public String inserir(Log objLog){
        String sql = "insert into log(Acao,tabela,usuario,dataHora,observacoes) values(?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objLog.getAcao());
            pst.setString(2, objLog.getTabela());
            pst.setString(3, objLog.getUsuario());
            pst.setDate(4,objConverte.converteBanco(objLog.getDataHora()));
            pst.setString(5, objLog.getObservacoes());
           
            if(pst.executeUpdate()>0){
                mensagem = "Log cadastrado com sucesso";
            }else{
                mensagem = "Log não cadastrado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOLog"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Log objLog){
        String sql = "update log set acao=?,tabela=?,usuario=?,dataHora=?,observacoes=? where codLog=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objLog.getAcao());
            pst.setString(2, objLog.getTabela());
            pst.setString(3, objLog.getUsuario());
            pst.setDate(4,objConverte.converteBanco(objLog.getDataHora()));
            pst.setString(5, objLog.getObservacoes());
            pst.setInt(6, objLog.getCodLog());
            if(pst.executeUpdate()>0){
                mensagem = "Log alterado com sucesso";
            }else{
                mensagem = "Log não alterado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOLog"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Log objLog){
        String sql ="delete from log where codLog=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objLog.getCodLog());
            if(pst.executeUpdate()>0){
                mensagem = "Log excluído com sucesso";
            }else{
                mensagem = "Log não excluído";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOLog"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Log> listarLog(){
        String sql = "select * from log";
        List<Log> listaLog = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Log objLog = new Log();
                objLog.setCodLog(rs.getInt("codLog"));
                objLog.setAcao(rs.getString("acao"));
                objLog.setTabela(rs.getString("tabela"));
                objLog.setUsuario(rs.getString("usuario"));
                objLog.setDataHora(objConverte.converteCalendario(rs.getDate("dataHora")));
                objLog.setObservacoes(rs.getString("observacoes"));
                listaLog.add(objLog);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarLog do DAOLog"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaLog;
        
    }
    
}

