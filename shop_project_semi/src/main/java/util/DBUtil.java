package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getConnection() throws Exception {
		//Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://3.39.47.155:3306/shop","root","java1234");
		//Connection conn = DriverManager.getConnection("jdbc:mariadb://13.124.174.73:3306/shop","root","java1234");
		conn.setAutoCommit(false);
		
		return conn;
	}
}
