package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Telefone;
import model.Usuario;

public class UsuarioDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Usuario> lista = new ArrayList<Usuario>();

    public UsuarioDAO() {
        conn = new ConnectionFactory().getConexao();
    }


    public void inserirUsers(Usuario usuario) {
        String sql = "INSERT INTO users (name, email, password,) VALUES (?, ?, ?); ";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro InserirUserDAO 1: "+erro);
        }

        sql = "INSERT INTO phones (ddd, number, type, user_id) VALUES (?, ?, ?, ?)";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuario.getTelefone().getDdd());
            stmt.setString(2, usuario.getTelefone().getNumero());
            stmt.setString(3, usuario.getTelefone().getTipo());
            stmt.setInt(4, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro InserirFoneDAO 2: "+erro);
        }


    }

    public void alterarUsers(Usuario usuario) {
        String sql = "UPDATE users SET name = ?, email= ?,password = ? WHERE id = ?;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setInt(4, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro AlterarUserDAO 3: "+erro);
        }

        sql = "UPDATE phones SET ddd = ?, number= ?, type= ? WHERE user_id = ?;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuario.getTelefone().getDdd());
            stmt.setString(2, usuario.getTelefone().getNumero());
            stmt.setString(3, usuario.getTelefone().getTipo());
            stmt.setInt(4, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro AlterarFoneDAO 4: "+erro);
        }
    }

    public void excluirUsers(String valorEmail) {
        String sql = "DELETE FROM users WHERE email = ?";
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();	
        } catch (Exception erro) {
            throw new RuntimeException("Erro DeletarUserDAO 5: "+erro);
        }
    }

    public void excluirPhones(String valorNumero) {
        String sql = "DELETE FROM phones WHERE id = ?";
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();	
        } catch (Exception erro) {
            throw new RuntimeException("Erro DeletarFoneDAO 6: "+erro);
        }
    }



    public ArrayList<Usuario> listarTodosUsuarios() {
        String sql = "SELECT * FROM users u LEFT JOIN phones p ON u.id = p.user_id";
        try {
            st = conn.createStatement();
            rs= st.executeQuery(sql);
            while (rs.next()) {
                Telefone telefone = new Telefone();

                telefone.setId(rs.getInt("id"));
                telefone.setDdd(rs.getInt("ddd"));
                telefone.setNumero(rs.getString("number"));
                telefone.setTipo(rs.getString("type"));

                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("name"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("password"));
                usuario.setTelefone(telefone);									

                lista.add(usuario);
            }
            st.close();	
        } catch (Exception erro) {
            throw new RuntimeException("Erro PesquisarTodosUsuariosDAO 7: "+erro);
        }
        return lista;
    }

    public ArrayList<Usuario> listarTodosUsuariosEmail(String valorEmail) {
        String sql = "SELECT * FROM users u LEFT JOIN phones p ON u.id = p.user_id WHERE u.email LIKE '%"+valorEmail+"%'";
        try {
            st = conn.createStatement();
            rs= st.executeQuery(sql);
            while (rs.next()) {
                Telefone telefone = new Telefone();

                telefone.setId(rs.getInt("id"));
                telefone.setDdd(rs.getInt("ddd"));
                telefone.setNumero(rs.getString("number"));
                telefone.setTipo(rs.getString("type"));

                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("name"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("password"));
                usuario.setTelefone(telefone);									

                lista.add(usuario);			
            }
            st.close();	
        } catch (Exception erro) {
            throw new RuntimeException("Erro PesquisarTodosUsuariosDAO 8: "+erro);
        }
        return lista;
    }
}