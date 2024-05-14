package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 12678776697
 */

public class Relatorio {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    ConverteData objConverte01 = new ConverteData();    
    ConverteData objConverte02 = new ConverteData();

    
    //mÃ©todo para o relatÃ³rio de cidade
     public ResultSet relatorioCategoria() {
        String sql = "SELECT codCategoria, nome,descricao FROM categoria;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
    /*
     public ResultSet relatorioCliente() {
        String sql = "SELECT codCliente, nome, endereco, telefone FROM clientes;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    } */
     public ResultSet relatorioCliente(int idadeMinima, int idadeMaxima) {
        String sql = "SELECT codCliente, nome, dataNascimento,endereco,telefone, TIMESTAMPDIFF(year,dataNascimento,NOW()) AS idade FROM clientes AS c WHERE TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) BETWEEN ? AND ?;";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, idadeMinima); // Defina o valor do primeiro parâmetro
            pst.setInt(2, idadeMaxima); // Defina o valor do segundo parâmetro
            ResultSet rs = pst.executeQuery();
            System.out.println("idade minima: " + idadeMinima);
            System.out.println("idade maxima: " + idadeMaxima);
            return rs;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return null;
        }        
        
    }
     
     public ResultSet relatorioFornecedor() {
        String sql = "SELECT codFornecedor, nome,telefone,email FROM fornecedor;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
      public ResultSet relatorioFuncionario(int idadeMinima, int idadeMaxima) {
        String sql = "SELECT codFuncionario,nome,nascimento,salario, TIMESTAMPDIFF(year,nascimento,NOW()) AS idade FROM funcionario WHERE TIMESTAMPDIFF(YEAR, funcionario.nascimento, CURDATE()) BETWEEN ? AND ?;";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, idadeMinima); // Defina o valor do primeiro parâmetro
            pst.setInt(2, idadeMaxima); // Defina o valor do segundo parâmetro
            ResultSet rs = pst.executeQuery();
            System.out.println("idade minima: " + idadeMinima);
            System.out.println("idade maxima: " + idadeMaxima);
            return rs;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return null;
        }        
        
    }
     
    /* public ResultSet relatorioFuncionario() {
        String sql = "SELECT codFuncionario,nome,salario FROM funcionario ;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    } */
     
     public ResultSet relatorioMarca() {
        String sql = "SELECT codMarca, nome FROM marca;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioProduto(double PrecoMinimo,double PrecoMaximo) {
        String sql = "SELECT p.codProduto,  p.nomeProduto,p.precoCusto, p.precoVenda, p.quantidadeEstoque, f.nome AS nomeFornecedor, m.nome AS nomeMarca FROM  produto AS p\n" +
                     "INNER JOIN  fornecedor AS f ON p.codFornecedor = f.codFornecedor INNER JOIN  marca AS m ON p.codMarca = m.codMarca WHERE  p.precoVenda BETWEEN ? AND ?;";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setDouble(1, PrecoMinimo); // Defina o valor do primeiro parâmetro
            pst.setDouble(2, PrecoMaximo); // Defina o valor do segundo parâmetro
            ResultSet rs = pst.executeQuery();
            System.out.println("idade minima: " + PrecoMinimo);
            System.out.println("idade maxima: " + PrecoMaximo);
            return rs;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return null;
        }     
    }
     
     public ResultSet relatorioTurno() {
        String sql = "SELECT codTurnos ,f.nome, horaInicio, horaFim FROM turnos AS t INNER JOIN funcionario AS f ON t.codFuncionario = f.codFuncionario;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
    public ResultSet relatorioVenda() {
        String sql = "Select v.dataVenda, \n" +
"	v.codVenda,\n" +
"    i.valor, \n" +
"    c.nome AS nomeCliente,\n" +
"    f.nome AS nomeFuncionario,\n" +
"    p.nomeProduto\n" +
"FROM \n" +
"    venda AS v\n" +
"INNER JOIN \n" +
"    itemvenda AS i ON v.codVenda = i.codVenda\n" +
"INNER JOIN \n" +
"    funcionario AS f ON v.codFuncionario = f.codFuncionario\n" +
"INNER JOIN \n" +
"	clientes AS c ON v.codCliente = c.codCliente\n" +
"	INNER JOIN \n" +
"	produto AS p ON p.codProduto = i.codProduto;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
}


