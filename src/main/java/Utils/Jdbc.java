package Utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

public class Jdbc {
	public static final String HOSTNAME = "localhost";
	public static final String PORT = "1433";
	public static final String DBNAME = "j3asm";
	public static final String USERNAME = "sa";
	public static final String PASSWORD = "songlong";

	public static Connection getConnection() {
		String Url = "jdbc:sqlserver://" + HOSTNAME + ":" + PORT + ";databaseName=" + DBNAME
				+ ";encrypt=true;trustServerCertificate=true;";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			return DriverManager.getConnection(Url, USERNAME, PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return null;
	}

       public static PreparedStatement getPpsm(Connection conn, String sql, Object... args) throws SQLException {
               PreparedStatement ps;
               if (sql.trim().startsWith("{")) {
                       ps = conn.prepareCall(sql); // proc
               } else {
                       ps = conn.prepareStatement(sql);
               }
               for (int i = 0; i < args.length; i++) {
                       ps.setObject(i + 1, args[i]);
               }
               return ps;
       }

       public static int execUpdate(String sql, Object... args) {
               try (Connection conn = getConnection();
                    PreparedStatement ps = getPpsm(conn, sql, args)) {
                       return ps.executeUpdate();
               } catch (SQLException e) {
                       throw new RuntimeException(e);
               }
       }

       public static ResultSet execQuery(String sql, Object... args) {
               try (Connection conn = getConnection();
                    PreparedStatement ps = getPpsm(conn, sql, args);
                    ResultSet rs = ps.executeQuery()) {
                       CachedRowSet rowSet = RowSetProvider.newFactory().createCachedRowSet();
                       rowSet.populate(rs);
                       return rowSet;
               } catch (SQLException e) {
                       throw new RuntimeException(e);
               }
       }

       public static Object value(String sql, Object... args) {
               try (ResultSet rs = execQuery(sql, args)) {
                       if (rs.next()) {
                               return rs.getObject(0);
                       }
               } catch (Exception e) {
                       throw new RuntimeException(e);
               }
               return null;
       }
}
