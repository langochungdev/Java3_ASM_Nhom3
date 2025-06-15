package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Entity.Category;
import Utils.Jdbc;

public class CategoryDAO implements DAOchung<Category, String> {

    @Override
    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM CATEGORIES";
        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) {
                list.add(new Category(rs.getString("Id"), rs.getString("Name")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Category findById(String id) {
        String sql = "SELECT * FROM CATEGORIES WHERE Id = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id)) {
            if (rs.next()) {
                return new Category(rs.getString("Id"), rs.getString("Name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void create(Category category) {
        String sql = "INSERT INTO CATEGORIES (Id, Name) VALUES (?, ?)";
        Jdbc.execUpdate(sql, category.getId(), category.getName());
    }

    @Override
    public void update(Category category) {
        String sql = "UPDATE CATEGORIES SET Name = ? WHERE Id = ?";
        Jdbc.execUpdate(sql, category.getName(), category.getId());
    }

    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM CATEGORIES WHERE Id = ?";
        Jdbc.execUpdate(sql, id);
    }
}
