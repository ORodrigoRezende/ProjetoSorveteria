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
public class DAOFuncionario {
    String mensagem="";
    ConverteData objConverte = new ConverteData();
    
    public String inserir(Funcionario objFuncionario){
        String sql = "insert into funcionario(nome,cargo,endereco,cpf,salario,nascimento,email,usuario,senha,clt) values(?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNome());
            pst.setString(2, objFuncionario.getCargo());
            pst.setString(3, objFuncionario.getEndereco());
            pst.setString(4, objFuncionario.getCpf());
            pst.setDouble(5, objFuncionario.getSalario());
            pst.setDate(6,objConverte.converteBanco(objFuncionario.getNascimento()));
            pst.setString(7, objFuncionario.getEmail());
            pst.setString(8, objFuncionario.getUsuario());
            pst.setString(9, objFuncionario.getSenha());
            pst.setString(10, objFuncionario.getClt());
            
            if(pst.executeUpdate()>0){
                mensagem = "Funcionario cadastrado com sucesso";
            }else{
                mensagem = "Funcionario não cadastrado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no incluir do DAOFuncionario"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    public String alterar(Funcionario objFuncionario){
        String sql = "update funcionario set nome=?,cargo=?,endereco=?,cpf=?,salario=?,nascimento=?,email=?,usuario=? ,senha=?,clt=? where codFuncionario=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNome());
            pst.setString(2, objFuncionario.getCargo());
            pst.setString(3, objFuncionario.getEndereco());
            pst.setString(4, objFuncionario.getCpf());
            pst.setDouble(5, objFuncionario.getSalario());
            pst.setDate(6,objConverte.converteBanco(objFuncionario.getNascimento()));
            pst.setString(7, objFuncionario.getEmail());
            pst.setString(8, objFuncionario.getUsuario());
            pst.setString(9, objFuncionario.getSenha());
            pst.setString(10, objFuncionario.getClt());
            pst.setInt(11, objFuncionario.getCodFuncionario());
            if(pst.executeUpdate()>0){
                mensagem = "Funcionario alterado com sucesso";
            }else{
                mensagem = "Funcionario não alterado";
            }
            pst.close(); // fecha a conexão
        }catch(SQLException ex){
            mensagem = "Erro de SQL no alterar do DAOFuncionario"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public String excluir(Funcionario objFuncionario){
        String sql ="delete from funcionario where codFuncionario=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,objFuncionario.getCodFuncionario());
            if(pst.executeUpdate()>0){
                mensagem = "Funcionario excluído com sucesso";
            }else{
                mensagem = "Funcionario não excluído";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL no excluir do DAOFuncionario"
                    +ex.getMessage()+"\nComando SQL="+sql;
        }
        return mensagem;
    }
    
    public List<Funcionario> listarFuncionario(){
        String sql = "select * from funcionario";
        List<Funcionario> listaFuncionario = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Funcionario objFuncionario = new Funcionario();
                objFuncionario.setCodFuncionario(rs.getInt("codFuncionario"));
                objFuncionario.setNome(rs.getString("nome"));
                objFuncionario.setCargo(rs.getString("cargo"));
                objFuncionario.setEndereco(rs.getString("endereco"));
                objFuncionario.setCpf(rs.getString("cpf"));
                objFuncionario.setSalario(rs.getDouble("salario"));
                objFuncionario.setNascimento(objConverte.converteCalendario(rs.getDate("nascimento")));
                objFuncionario.setEmail(rs.getString("email"));
                objFuncionario.setUsuario(rs.getString("usuario"));
                objFuncionario.setSenha(rs.getString("senha"));
                objFuncionario.setClt(rs.getString("clt"));
                listaFuncionario.add(objFuncionario);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarFuncionario do DAOFuncionario"+
                    ex.getMessage()+"\nComando SQL: "+sql);
        }
        return listaFuncionario;
        
    }
    public Funcionario localizar(Integer id){
        String sql = "select * from funcionario where codFuncionario=?";
        Funcionario objFuncionario = new Funcionario();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objFuncionario.setCodFuncionario(rs.getInt("codFuncionario"));
                objFuncionario.setNome(rs.getString("nome"));
                objFuncionario.setCargo(rs.getString("cargo"));
                objFuncionario.setEndereco(rs.getString("endereco"));
                objFuncionario.setCpf(rs.getString("cpf"));
                objFuncionario.setSalario(rs.getDouble("salario"));
                objFuncionario.setNascimento(objConverte.converteCalendario(rs.getDate("nascimento")));
                objFuncionario.setEmail(rs.getString("email"));
                objFuncionario.setUsuario(rs.getString("usuario"));
                objFuncionario.setSenha(rs.getString("senha"));
                objFuncionario.setClt(rs.getString("clt"));
                return objFuncionario;
    }
  }catch(SQLException e){
            System.out.println("Erro de SQL Localizar DAOFuncionario"+e.getMessage());
  };
return null;
}

    public ResultSet getLogin(Funcionario obj) {
        String sql = "select * from funcionario where email = ? AND senha = ?";
       ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, obj.getEmail());
            pst.setString(2, obj.getSenha());
            System.out.println("SQL: "+sql);
            rs = pst.executeQuery();
         
        } catch (SQLException e) {
            System.out.println("Erro de SQL no login: " + e.getMessage());
        }
        return rs;
              }
}

