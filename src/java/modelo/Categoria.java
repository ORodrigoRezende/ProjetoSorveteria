/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author orodr
 */
public class Categoria {
    private Integer CodCategoria;
    private String descricao,nome;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public Integer getCodCategoria() {
        return CodCategoria;
    }

    public void setCodCategoria(Integer CodCategoria) {
        this.CodCategoria = CodCategoria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
}
