package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Login;

public class LoginDao {

	public static final String LOGIN_TABLE_NAME = "adminfo";
	public static final String LOGIN_COLUMN_ID = "id";
	public static final String LOGIN_COLUMN_PASSWORD = "pass";
	
	
	public static Connection Connection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// 드라이버를 불러온다(초기화)
			conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
			// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비밀번호
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//C
	
	//R
	public List<Login> select() throws SQLException {
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + LOGIN_TABLE_NAME);
		ResultSet result = pstmt.executeQuery();

		List<Login> loginList = new ArrayList<>();
		while (result.next()) {
			String id = result.getString(LOGIN_COLUMN_ID);
			String pass = result.getString(LOGIN_COLUMN_PASSWORD);

			Login login = new Login(id, pass);
			loginList.add(login);
		}
		result.close();
		pstmt.close();
		con.close();
		return loginList;
	}
	
	
	//U
	
	//D

}

