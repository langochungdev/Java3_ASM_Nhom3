package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Entity.News;
import Utils.Jdbc;

public class NewsDAOImpl implements DAOchung<News, String> {
    @Override
    public List<News> findAll() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT * FROM NEWS";
        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public News findById(String id) {
        if (id == null) return null;
        String sql = "SELECT * FROM NEWS WHERE Id = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, id)) {
            if (rs.next()) return map(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void create(News news) {
        if (news == null) return;
        String sql = "INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Jdbc.execUpdate(sql,
                news.getId(),
                news.getTitle(),
                news.getContent(),
                news.getImage(),
                news.getPostedDate(),
                news.getAuthor(),
                news.getViewCount(),
                news.getCategoryId(),
                news.isHome()
        );
    }

    @Override
    public void update(News news) {
        if (news == null) return;
        String sql = "UPDATE NEWS SET Title = ?, Content = ?, Image = ?, PostedDate = ?, Author = ?, ViewCount = ?, CategoryId = ?, Home = ? WHERE Id = ?";
        Jdbc.execUpdate(sql,
                news.getTitle(),
                news.getContent(),
                news.getImage(),
                news.getPostedDate(),
                news.getAuthor(),
                news.getViewCount(),
                news.getCategoryId(),
                news.isHome(),
                news.getId()
        );
    }

    @Override
    public void deleteById(String id) {
        if (id == null) return;
        String sql = "DELETE FROM NEWS WHERE Id = ?";
        Jdbc.execUpdate(sql, id);
    }

    public List<News> findByCategory(String categoryId) {
        List<News> list = new ArrayList<>();
        if (categoryId == null) return list;
        String sql = "SELECT * FROM NEWS WHERE CategoryId = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, categoryId)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<News> findByAuthor(String authorId) {
        List<News> list = new ArrayList<>();
        if (authorId == null) return list;
        String sql = "SELECT * FROM NEWS WHERE Author = ?";
        try (ResultSet rs = Jdbc.execQuery(sql, authorId)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<News> findHomeNews() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT * FROM NEWS WHERE Home = 1";
        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private News map(ResultSet rs) throws SQLException {
        return new News(
                rs.getString("Id"),
                rs.getString("Title"),
                rs.getString("Content"),
                rs.getString("Image"),
                rs.getDate("PostedDate"),
                rs.getString("Author"),
                rs.getInt("ViewCount"),
                rs.getString("CategoryId"),
                rs.getBoolean("Home")
        );
    }
  //hai    
 // 5 bản tin được xem nhiều nhất
    public List<News> findTopViewed(int limit) {
        List<News> list = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM NEWS ORDER BY ViewCount DESC";

        try (ResultSet rs = Jdbc.execQuery(sql, limit)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // 5 bản tin mới nhất
    public List<News> findLatest(int limit) {
        List<News> list = new ArrayList<>();
        String sql = "SELECT TOP " + limit + " * FROM NEWS ORDER BY PostedDate DESC";
        try (ResultSet rs = Jdbc.execQuery(sql)) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    
}
