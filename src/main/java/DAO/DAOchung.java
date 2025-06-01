package DAO;
import java.util.List;

public interface DAOchung<T, K> {
    List<T> findAll();
    T findById(K id);
    void create(T entity);
    void update(T entity);
    void deleteById(K id);
}

