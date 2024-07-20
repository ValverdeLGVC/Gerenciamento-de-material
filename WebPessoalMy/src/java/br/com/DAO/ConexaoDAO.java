/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
//para fazer um CRUD temos que fazer a conexão DAO, ela é feita dessa seguinte forma:

public class ConexaoDAO {

    //Faça uma coneção com o banco de dados usando o seguinte código abaixo;
    //É necessario importar o java.sql.Connection como foi feito acima;
    public Connection conexaoBD() throws ClassNotFoundException {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Declare uma String [VARIAVEL] para escrever o endereço do banco de dados com a senho do banco  de dados, usuário, base de dados, etc...
            //é necessário importar um driver de conexão que eu tenho na minha nuvem;
            String url = "jdbc:mysql://localhost:3306/silos?user=root&password=";
            //Driver/local-do-banco/Nome-da-base-de-dados/informações-do-phpmyadmin;
            //Este código abaixo pega as informações do caminho do banco de dados e o acessa;               
            con = DriverManager.getConnection(url);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: ConexaoDAO", "Erro", JOptionPane.ERROR_MESSAGE);
        }
        return con;
    }
}
