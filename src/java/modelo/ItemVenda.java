/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author camil
 */
public class ItemVenda {
    private Integer codItemVenda;
    private Double quantVenda, valor;
    
    private Venda codVenda = new Venda();
    private Produto codProduto = new Produto();
   
    public Integer getCodItemVenda() {
        return codItemVenda;
    }

    public void setCodItemVenda(Integer codItemVenda) {
        this.codItemVenda = codItemVenda;
    }

    public Double getQuantVenda() {
        return quantVenda;
    }

    public void setQuantVenda(Double quantVenda) {
        this.quantVenda = quantVenda;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Venda getCodVenda() {
    return codVenda;
    }
    public void setCodVenda(Venda codVenda) {
    this.codVenda = codVenda;
    }
     

    public Produto getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Produto codProduto) {
        this.codProduto = codProduto;
    }

   
}
