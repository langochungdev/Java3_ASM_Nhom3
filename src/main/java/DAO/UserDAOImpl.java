package DAO;

import java.sql.*;
import java.util.*;
import Entity.User;
import Utils.Jdbc;

public class UserDAOImpl {

    public User login(String id, String password) {
        String sql = "SELECT * FROM USERS WHERE Id = ? AND Password = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id, password)) {
            if (rs.next()) return mapUser(rs);
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public User findById(String id) {
        String sql = "SELECT * FROM USERS WHERE Id = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id)) {
            if (rs.next()) return mapUser(rs);
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM USERS";
        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) list.add(mapUser(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void insert(User user) {
        String sql = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Jdbc.execUpdate(sql, user.getId(), user.getPassword(), user.getFullname(), user.getBirthday(),
            user.isGender(), user.getMobile(), user.getEmail(), user.isRole());
    }

    public void update(User user) {
        String sql = "UPDATE USERS SET Password=?, Fullname=?, Birthday=?, Gender=?, Mobile=?, Email=?, Role=? WHERE Id=?";
        Jdbc.execUpdate(sql, user.getPassword(), user.getFullname(), user.getBirthday(), user.isGender(),
            user.getMobile(), user.getEmail(), user.isRole(), user.getId());
    }

    public void delete(String id) {
        String sql = "DELETE FROM USERS WHERE Id=?";
        Jdbc.execUpdate(sql, id);
    }

    private User mapUser(ResultSet rs) throws SQLException {
        return new User(
            rs.getString("Id"),
            rs.getString("Password"),
            rs.getString("Fullname"),
            rs.getDate("Birthday"),
            rs.getBoolean("Gender"),
            rs.getString("Mobile"),
            rs.getString("Email"),
            rs.getBoolean("Role")
        );
    }
}
