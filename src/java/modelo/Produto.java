/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author 12678776697
 */
public class Produto {
    private Integer codProduto;
    private String nomeProduto;
    private double quantidadeEstoque,precoCusto,precoVenda,margemdeLucro;
    private Categoria objCategoria = new Categoria();
    private Marca objMarca = new Marca();
    private Fornecedor objFornecedor = new Fornecedor();

    public double getMargemdeLucro() {
        return margemdeLucro;
    }

    public void setMargemdeLucro(double margemdeLucro) {
        this.margemdeLucro = margemdeLucro;
    }
    
    
    public Integer getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Integer codProduto) {
        this.codProduto = codProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nome) {
        this.nomeProduto = nome;
    }

    public double getQuantidadeEstoque() {
        return quantidadeEstoque;
    }

    public void setQuantidadeEstoque(double quantidadeEstoque) {
        this.quantidadeEstoque = quantidadeEstoque;
    }

    public double getPrecoCusto() {
        return precoCusto;
    }

    public void setPrecoCusto(double precoCusto) {
        this.precoCusto = precoCusto;
    }

    public double getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(double precoVenda) {
        this.precoVenda = precoVenda;
    }   

    public Categoria getObjCategoria() {
        return objCategoria;
    }

    public void setObjCategoria(Categoria objCategoria) {
        this.objCategoria = objCategoria;
    }

    public Marca getObjMarca() {
        return objMarca;
    }

    public void setObjMarca(Marca objMarca) {
        this.objMarca = objMarca;
    }

    public Fornecedor getObjFornecedor() {
        return objFornecedor;
    }

    public void setObjFornecedor(Fornecedor objFornecedor) {
        this.objFornecedor = objFornecedor;
    }
    
}
