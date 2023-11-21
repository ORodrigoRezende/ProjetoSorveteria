/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Calendar;

/**
 *
 * @author orodr
 */
public class Turnos {
    private Integer codTurnos;
    private String horaInicio,horaFim;
    private Funcionario objFuncionario = new Funcionario();

    public Integer getCodTurnos() {
        return codTurnos;
    }

    public void setCodTurnos(Integer codTurnos) {
        this.codTurnos = codTurnos;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFim() {
        return horaFim;
    }

    public void setHoraFim(String horaFim) {
        this.horaFim = horaFim;
    }

    public Funcionario getObjFuncionario() {
        return objFuncionario;
    }

    public void setObjFuncionario(Funcionario objFuncionario) {
        this.objFuncionario = objFuncionario;
    }
    
    
}
