/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Question;
import static util.ConectDB.conectar;

public class QuestionDAO {

    // Método para inserir uma nova questão no banco
    public boolean insQuest(Question p_quest) throws ClassNotFoundException {
        Connection conexao = null;
        PreparedStatement stmt = null;
        try {
            conexao = conectar();
            // Alterando a query para usar PreparedStatement e aceitar NULL no campo 'response'
            String sql = "INSERT INTO questions (nome, email, question, priority_box, total_price, dt_question, response) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conexao.prepareStatement(sql);

            stmt.setString(1, p_quest.getNome());
            stmt.setString(2, p_quest.getEmail());
            stmt.setString(3, p_quest.getQuestion());
            stmt.setInt(4, p_quest.getPriority_box());
            stmt.setDouble(5, p_quest.getTotal_price());
            stmt.setString(6, p_quest.getDt_question());

            if (p_quest.getResponse() == null) {
                stmt.setNull(7, Types.VARCHAR); // Permitir NULL caso response seja nulo
            } else {
                stmt.setString(7, p_quest.getResponse());
            }

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex);
            }
        }
    }


    // Método para deletar uma questão pelo ID
    public boolean delQuest(Question p_quest) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = conectar();
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM questions WHERE id = " + p_quest.getId();
            stmt.executeUpdate(sql);
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return false;
        }
    }

    // Método para consultar uma questão pelo ID
    public Question consQuestRegId(Question p_quest) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM questions WHERE id = " + p_quest.getId();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                p_quest.setId(rs.getInt("id"));
                p_quest.setNome(rs.getString("nome"));
                p_quest.setEmail(rs.getString("email"));
                p_quest.setQuestion(rs.getString("question"));
                p_quest.setPriority_box(rs.getInt("priority_box"));
                p_quest.setTotal_price(rs.getDouble("total_price"));
                p_quest.setDt_question(rs.getString("dt_question"));
                p_quest.setResponse(rs.getString("response"));
                return p_quest;
            } else {
                return null;
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return null;
        }
    }

    // Método para listar todas as questões
    public List<Question> consQuestLista() throws ClassNotFoundException {
        List<Question> lista = new ArrayList<>();
        Connection conexao = null;
        try {
            conexao = conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM questions";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Question quest = new Question();
                quest.setId(rs.getInt("id"));
                quest.setNome(rs.getString("nome"));
                quest.setEmail(rs.getString("email"));
                quest.setQuestion(rs.getString("question"));
                quest.setPriority_box(rs.getInt("priority_box"));
                quest.setTotal_price(rs.getDouble("total_price"));
                quest.setDt_question(rs.getString("dt_question"));
                quest.setResponse(rs.getString("response"));
                lista.add(quest);
            }
            return lista;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return null;
        }
    }

    // Método para atualizar uma questão
    public boolean altQuest(Question p_quest) throws ClassNotFoundException {
        Connection conexao = null;
        PreparedStatement stmt = null;
        try {
            conexao = conectar();
            String sql = "UPDATE questions SET nome=?, email=?, question=?, priority_box=?, total_price=?, dt_question=?, response=? WHERE id=?";
            stmt = conexao.prepareStatement(sql);

            stmt.setString(1, p_quest.getNome());
            stmt.setString(2, p_quest.getEmail());
            stmt.setString(3, p_quest.getQuestion());
            stmt.setInt(4, p_quest.getPriority_box());
            stmt.setDouble(5, p_quest.getTotal_price());
            stmt.setString(6, p_quest.getDt_question());

            // Atualizando o campo response (se "NULL", trata como valor SQL null)
            if ("NULL".equals(p_quest.getResponse())) {
                stmt.setNull(7, Types.VARCHAR);
            } else {
                stmt.setString(7, p_quest.getResponse());
            }

            stmt.setInt(8, p_quest.getId());
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar questão: " + ex);
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex);
            }
        }
    }

    
    // Método para alterar apenas o campo 'response' no banco de dados
    public boolean altResponse(int id, String response) throws ClassNotFoundException {
        Connection conexao = null;
        PreparedStatement stmt = null;
        try {
            conexao = conectar();

            // Comando SQL para atualizar o campo 'response' com base no 'id'
            String sql = "UPDATE questions SET response = ? WHERE id = ?";
            stmt = conexao.prepareStatement(sql);

            // Verifica se o valor de 'response' é null e faz a atualização
            if (response == null) {
                stmt.setNull(1, Types.VARCHAR);  // Para permitir NULL no banco de dados
            } else {
                stmt.setString(1, response);  // Se não for nulo, insere o valor de 'response'
            }
            stmt.setInt(2, id);  // Define o ID da questão a ser atualizada

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar a resposta: " + ex);
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex);
            }
        }
    }
    
    public boolean exists(Question question) throws ClassNotFoundException {
        // Código para verificar se o ID existe no banco de dados
        Connection conexao = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conexao = conectar();
            String sql = "SELECT COUNT(*) FROM questions WHERE id = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, question.getId());
            rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;  // Retorna true se o ID existir
            }
            return false;  // Retorna false se o ID não existir
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Fechar recursos (conn, stmt, rs)
        }
    }

    public boolean altResponse(Question quest) {
        // Código para verificar se o ID existe no banco de dados
        Connection conexao = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "UPDATE questions SET response = ? WHERE id = ?";

        try {
            // Obtém conexão com o banco de dados
            conexao = conectar();

            // Prepara a query de atualização
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, quest.getResponse()); // Define o novo valor de 'response'
            stmt.setInt(2, quest.getId());         // Filtra pelo ID da pergunta

            // Executa a atualização e verifica o número de linhas afetadas
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Retorna true se pelo menos uma linha foi alterada

        } catch (Exception e) {
            System.err.println("Erro ao atualizar a pergunta: " + e.getMessage());
            return false;

        } finally {
            // Libera os recursos
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (Exception e) {
                System.err.println("Erro ao fechar recursos: " + e.getMessage());
            }
        }
    }

}