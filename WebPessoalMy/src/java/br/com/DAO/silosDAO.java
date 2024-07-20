package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import br.com.DTO.silosDTO;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class silosDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<silosDTO> lista = new ArrayList<>();

    public void CadastrarFerramentas(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "insert into ferramentas (Nomenclatura, PN, SN, Localizacao, Calibravel) values (?,?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objSilosDTO.getNomenclatura());
            pstm.setString(2, objSilosDTO.getPN());
            pstm.setString(3, objSilosDTO.getSN());
            pstm.setString(4, objSilosDTO.getLocalizacao());
            pstm.setString(5, objSilosDTO.getCalibravel());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [CadastrarFerramentas] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }

    public ArrayList<silosDTO> PesquisarFerramentas() throws ClassNotFoundException {
        String sql = "select * from ferramentas";
        con = new ConexaoDAO().conexaoBD();
        lista.clear(); // Clear the list before adding new results

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                silosDTO objSilosDTO = new silosDTO();
                objSilosDTO.setID(rs.getInt("ID"));
                objSilosDTO.setNomenclatura(rs.getString("Nomenclatura"));
                objSilosDTO.setPN(rs.getString("PN"));
                objSilosDTO.setSN(rs.getString("SN"));
                objSilosDTO.setLocalizacao(rs.getString("Localizacao"));
                objSilosDTO.setCalibravel(rs.getString("Calibravel"));

                lista.add(objSilosDTO);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO[PesquisarFerramentas] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return lista;
    }

    public ArrayList<silosDTO> PesquisarCadastrados() throws ClassNotFoundException {
        String sql = "select * from login";
        con = new ConexaoDAO().conexaoBD();
        lista.clear(); // Clear the list before adding new results

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                silosDTO objSilosDTO = new silosDTO();
                objSilosDTO.setId_cracha(rs.getInt("id_cracha"));
                objSilosDTO.setCracha(rs.getString("cracha"));
                objSilosDTO.setSenha(rs.getString("senha"));
                objSilosDTO.setNome(rs.getString("nome"));

                lista.add(objSilosDTO);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO[PesquisarCadastrados] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return lista;
    }

    public ArrayList<silosDTO> pesquisarItensEmprestados() throws ClassNotFoundException {
    String sql = "SELECT a.id AS id, g.Nomenclatura, c.cracha, c.nome AS nome_pessoa, a.qtd, a.data_cautela, a.data_devolucao FROM ferramentas g JOIN cautelas a ON g.ID = a.id_ferramentas JOIN login c ON c.id_cracha = a.id_login;";
    con = new ConexaoDAO().conexaoBD();
    lista.clear(); // Clear the list before adding new results

    try {
        pstm = con.prepareStatement(sql);
        rs = pstm.executeQuery();

        while (rs.next()) {
            silosDTO objSilosDTO = new silosDTO();
            objSilosDTO.setId(rs.getInt("id"));
            objSilosDTO.setNomenclatura(rs.getString("Nomenclatura"));
            objSilosDTO.setCracha(rs.getString("cracha"));
            objSilosDTO.setNome(rs.getString("nome_pessoa"));
            objSilosDTO.setQtd(rs.getInt("qtd"));

            // Convert java.sql.Date to java.util.Date if needed
           

            lista.add(objSilosDTO);
        }
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "[Erro]: silosDAO[pesquisarItensEmprestados] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
    } 
    return lista;
}


    public void ExcluirFerramentas(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "delete from ferramentas where ID = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, objSilosDTO.getID());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [ExcluirFerramentas] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }
    public void ExcluirCadastrado(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "delete from login where id_cracha = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, objSilosDTO.getId_cracha());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [ExcluirCadastrados] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }

    public void ExcluirCautela(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "delete from cautelas where id = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, objSilosDTO.getId());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [ExcluirCautela] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }

    public void EditarFerramentas(silosDTO objSilosDTO) throws SQLException, ClassNotFoundException {
        String sql = "update ferramentas set Nomenclatura = ?, PN = ?, SN = ?, Localizacao = ?, Calibravel = ? where ID = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);

            pstm.setString(1, objSilosDTO.getNomenclatura());
            pstm.setString(2, objSilosDTO.getPN());
            pstm.setString(3, objSilosDTO.getSN());
            pstm.setString(4, objSilosDTO.getLocalizacao());
            pstm.setString(5, objSilosDTO.getCalibravel());
            pstm.setInt(6, objSilosDTO.getID());

            pstm.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public boolean verificarLoginExistente(int idLogin) throws ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM login WHERE id_cracha = ?";
        con = new ConexaoDAO().conexaoBD();
        boolean exists = false;

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, idLogin);
            rs = pstm.executeQuery();
            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [verificarLoginExistente] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return exists;
    }

    public boolean verificarFerramentaExistente(int idFerramentas) throws ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM ferramentas WHERE ID = ?";
        con = new ConexaoDAO().conexaoBD();
        boolean exists = false;

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, idFerramentas);
            rs = pstm.executeQuery();
            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [verificarFerramentaExistente] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return exists;
    }

    public boolean verificarLogin(String cracha, String senha) throws ClassNotFoundException {
        String sql = "SELECT * FROM login WHERE cracha = ? AND senha = ?";
        con = new ConexaoDAO().conexaoBD();
        boolean isValid = false;

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cracha);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();

            isValid = rs.next();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [verificarLogin] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return isValid;
    }
    public boolean verificarSenha( String senha) throws ClassNotFoundException {
        String sql = "SELECT * FROM login WHERE  senha = ?";
        con = new ConexaoDAO().conexaoBD();
        boolean isValid = false;

        try {
            pstm = con.prepareStatement(sql);
            
            pstm.setString(1, senha);
            rs = pstm.executeQuery();

            isValid = rs.next();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [verificarLogin] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
        return isValid;
    }

    public void cadastrarLogin(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "insert into login (cracha,senha,nome) values (?,?,?)";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objSilosDTO.getCracha());
            pstm.setString(2, objSilosDTO.getSenha());
            pstm.setString(3, objSilosDTO.getNome());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [cadastrarLogin] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }

    public void efetuarCautela(silosDTO objSilosDTO) throws ClassNotFoundException {
        String sql = "insert into cautelas (data_cautela,data_devolucao,id_ferramentas,id_login,qtd) values (?,?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);

            // Convertendo java.util.Date em java.sql.Date
            Date dataCautela = new Date(objSilosDTO.getData_cautela().getTime());
            Date dataDevolucao = new Date(objSilosDTO.getData_devolucao().getTime());

            pstm.setDate(1, dataCautela);
            pstm.setDate(2, dataDevolucao);
            pstm.setInt(3, objSilosDTO.getId_ferramentas());
            pstm.setInt(4, objSilosDTO.getId_login());
            pstm.setInt(5, objSilosDTO.getQtd());

            pstm.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [efetuarCautela] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao fechar recursos JDBC: " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
        }
    }
    public int authenticate(String cracha, String senha) {
        String sql = "SELECT id FROM users WHERE cracha = ? AND senha = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, cracha);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1; // Retorna -1 se o login falhar
    }
   public boolean verificarSenhaCorreta(int idLogin, String senha) throws ClassNotFoundException, SQLException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean senhaCorreta = false;

    try {
        con = new ConexaoDAO().conexaoBD(); // Inicialize a conexão
        String sql = "SELECT senha FROM login WHERE id_cracha = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, idLogin);

        rs = ps.executeQuery();

        if (rs.next()) {
            String senhaArmazenada = rs.getString("senha");
            if (senha.equals(senhaArmazenada)) {
                senhaCorreta = true;
            }
        }
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [verificarSenhaCorreta] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    return senhaCorreta;
}

}
