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
     
     public ResultSet relatorioFuncionario() {
        String sql = "SELECT codFuncionario,nome,salario FROM funcionario ;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
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
     public ResultSet relatorioProduto() {
        String sql = "SELECT \n" +
"    p.codProduto, \n" +
"    p.nomeProduto, \n" +
"    p.precoCusto, \n" +
"    p.precoVenda, \n" +
"    p.quantidadeEstoque, \n" +
"    f.nome AS nomeFornecedor, \n" +
"    m.nome AS nomeMarca \n" +
"FROM \n" +
"    produto AS p\n" +
"INNER JOIN \n" +
"    fornecedor AS f ON p.codFornecedor = f.codFornecedor\n" +
"INNER JOIN \n" +
"    marca AS m ON p.codMarca = m.codMarca;";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
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


