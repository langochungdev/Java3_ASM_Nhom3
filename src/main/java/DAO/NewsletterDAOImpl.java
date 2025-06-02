package DAO;

import Entity.Newsletter;
import Utils.Jdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsletterDAOImpl implements DAOchung<Newsletter, String> {

    @Override
    public List<Newsletter> findAll() {
        List<Newsletter> list = new ArrayList<>();
        String sql = "SELECT * FROM newsletters";

        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) {
                Newsletter newsletter = new Newsletter(
                    rs.getString("email"),
                    rs.getBoolean("enabled")
                );
                list.add(newsletter);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Newsletter findById(String email) {
        String sql = "SELECT * FROM newsletters WHERE email = ?";

        try (ResultSet rs = Jdbc.execQuery(sql, email)) {
            if (rs.next()) {
                return new Newsletter(
                    rs.getString("email"),
                    rs.getBoolean("enabled")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void create(Newsletter entity) {
        String sql = "INSERT INTO newsletters (email, enabled) VALUES (?, ?)";
        Jdbc.execUpdate(sql, entity.getEmail(), entity.isEnabled());
    }

    @Override
    public void update(Newsletter entity) {
        String sql = "UPDATE newsletters SET enabled = ? WHERE email = ?";
        Jdbc.execUpdate(sql, entity.isEnabled(), entity.getEmail());
    }

    @Override
    public void deleteById(String email) {
        String sql = "DELETE FROM newsletters WHERE email = ?";
        Jdbc.execUpdate(sql, email);
    }
}
