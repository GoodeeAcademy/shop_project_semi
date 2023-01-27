package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getConnection() throws Exception {
		//Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://43.201.140.134:3306/shop","root","java1234");
		conn.setAutoCommit(false);
		
		return conn;
	}
}
