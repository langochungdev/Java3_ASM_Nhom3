package DAO;
import Entity.News;
import Utils.Jdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    // Các phương thức mở rộng

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
        News news = new News();
        news.setId(rs.getString("Id"));
        news.setTitle(rs.getString("Title"));
        news.setContent(rs.getString("Content"));
        news.setImage(rs.getString("Image"));
        news.setPostedDate(rs.getDate("PostedDate"));
        news.setAuthor(rs.getString("Author"));
        news.setViewCount(rs.getInt("ViewCount"));
        news.setCategoryId(rs.getString("CategoryId"));
        news.setHome(rs.getBoolean("Home"));
        return news;
    }
}
