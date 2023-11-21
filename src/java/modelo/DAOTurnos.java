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
public class DAOTurnos {
    String mensagem="";
    
    ConverteData objConverte = new ConverteData();
    DAOFuncionario objDAOFuncionario = new DAOFuncionario();
    
    public String inserir(Turnos objTurnos){
        String sql = "insert into turnos(codFuncionario,horaInicio,horaFim) values(?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objTurnos.getObjFuncionario().getCodFuncionario());
            pst.setString(2, objTurnos.getHoraInicio());
            pst.setString(3, objTurnos.getHoraFim());
            
           
            if(pst.executeUpdate()>0){
                mensagem = "Turnos cadastrado com sucesso";
            }else{
                mensagem = "Turnos não cadastrado";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOTurnos"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Turnos objTurnos){
        String sql = "update turnos set codFuncionario=?, horainicio=?, horafim=? where codTurnos=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objTurnos.getObjFuncionario().getCodFuncionario());
            pst.setString(2, objTurnos.getHoraInicio());
            pst.setString(3, objTurnos.getHoraFim());
            
            pst.setInt(4, objTurnos.getCodTurnos());
            if(pst.executeUpdate()>0){
                mensagem = "Turnos alterados com sucesso";
            }else{
                mensagem = "Turnos não alterados";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOTurnos"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Turnos objTurnos){
        String sql ="delete from turnos where codTurnos=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objTurnos.getCodTurnos());
            if(pst.executeUpdate()>0){
                mensagem = "Turnos excluído com sucesso";
            }else{
                mensagem = "Turnos não excluído";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOTurnos"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Turnos> listarTurnos(){
        String sql = "select * from turnos";
        List<Turnos> listaTurnos = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Turnos objTurnos = new Turnos();
                objTurnos.setCodTurnos(rs.getInt("codTurnos"));
                objTurnos.setObjFuncionario(objDAOFuncionario.localizar(rs.getInt("codFuncionario")));
                objTurnos.setHoraInicio(rs.getString("horaInicio"));
                objTurnos.setHoraFim(rs.getString("horaFim"));
                
                listaTurnos.add(objTurnos);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarTurnos do DAOTurnos"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaTurnos;
        
    }
}
