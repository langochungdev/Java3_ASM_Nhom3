package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import Entity.User;
import Utils.Jdbc;

public class UserDAOImpl {

    // Hàm kiểm tra đăng nhập
    public User login(String id, String password) {
        String sql = "SELECT * FROM USERS WHERE Id = ? AND Password = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id, password)) {
            if (rs.next()) {
                return mapUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; 
    }

    // Hàm lấy user theo ID
    public User findById(String id) {
        String sql = "SELECT * FROM USERS WHERE Id = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id)) {
            if (rs.next()) {
                return mapUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Mapping ResultSet sang đối tượng User
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
