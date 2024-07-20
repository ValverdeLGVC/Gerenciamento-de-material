/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.DTO;

import java.util.Date;

/**
 *
 * @author Lenovo
 */
public class silosDTO {
    private int ID, id_cracha, id_login, id_ferramentas, id, qtd;

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }
    private Date data_cautela, data_devolucao;

    public Date getData_cautela() {
        return data_cautela;
    }

    public void setData_cautela(Date data_cautela) {
        this.data_cautela = data_cautela;
    }

    public Date getData_devolucao() {
        return data_devolucao;
    }

    public void setData_devolucao(Date data_devolucao) {
        this.data_devolucao = data_devolucao;
    }
    

    public int getId_login() {
        return id_login;
    }

    public void setId_login(int id_login) {
        this.id_login = id_login;
    }

    public int getId_ferramentas() {
        return id_ferramentas;
    }

    public void setId_ferramentas(int id_ferramentas) {
        this.id_ferramentas = id_ferramentas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    private String Nomenclatura, PN, SN, Localizacao, Calibravel, cracha, senha, nome;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the Nomenclatura
     */
    public String getNomenclatura() {
        return Nomenclatura;
    }

    /**
     * @param Nomenclatura the Nomenclatura to set
     */
    public void setNomenclatura(String Nomenclatura) {
        this.Nomenclatura = Nomenclatura;
    }

    /**
     * @return the PN
     */
    public String getPN() {
        return PN;
    }

    /**
     * @param PN the PN to set
     */
    public void setPN(String PN) {
        this.PN = PN;
    }

    /**
     * @return the SN
     */
    public String getSN() {
        return SN;
    }

    /**
     * @param SN the SN to set
     */
    public void setSN(String SN) {
        this.SN = SN;
    }

    /**
     * @return the Localizacao
     */
    public String getLocalizacao() {
        return Localizacao;
    }

    /**
     * @param Localizacao the Localizacao to set
     */
    public void setLocalizacao(String Localizacao) {
        this.Localizacao = Localizacao;
    }

    /**
     * @return the Calibravel
     */
    public String getCalibravel() {
        return Calibravel;
    }

    /**
     * @param Calibravel the Calibravel to set
     */
    public void setCalibravel(String Calibravel) {
        this.Calibravel = Calibravel;
    }

    /**
     * @return the id_cracha
     */
    public int getId_cracha() {
        return id_cracha;
    }

    /**
     * @param id_cracha the id_cracha to set
     */
    public void setId_cracha(int id_cracha) {
        this.id_cracha = id_cracha;
    }

    /**
     * @return the cracha
     */
    public String getCracha() {
        return cracha;
    }

    /**
     * @param cracha the cracha to set
     */
    public void setCracha(String cracha) {
        this.cracha = cracha;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setDataCautela(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setDataDevolucao(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



    
}
