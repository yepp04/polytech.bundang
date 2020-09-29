package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Student;
import domain.Vote;

public class VoteDao {
	public static final String VOTE_TABLE_NAME = "hubo_table";
	public static final String VOTE_COLUMN_NAME = "name";
	public static final String VOTE_COLUMN_ID = "id";

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

	// C
	public void create(Vote vote) throws SQLException {
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		// 데이터베이스 입력
		stmt.execute("INSERT INTO " + VOTE_TABLE_NAME + " VALUES (" + vote.getId() + ", '" + vote.getName() + "');");
		stmt.execute("CREATE TABLE vote" + vote.getId() + "_table(id int, age int);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (1, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (2, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (3, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (4, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (5, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (6, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (7, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (8, 0);");
		stmt.execute("INSERT INTO vote" + vote.getId() + "_table VALUES (9, 0);");
		// 새로운 후보 번호 및 이름 입력하고 그에 따른 연령별 투표 테이블을 생성한다
		stmt.close();
		con.close();
	}

	// R
	public int sumOne(int ageId) throws SQLException {
		// 어떤 후보의 총 투표 개수
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT SUM(age) FROM vote?_table");
		pstmt.setInt(1, ageId);
		ResultSet result = pstmt.executeQuery();
		int sum=0;
		while (result.next()) {
			sum = result.getInt(1);
		}
		result.close();
		pstmt.close();
		con.close();
		return sum;
	}
	
	public int sumAll() throws SQLException {
		// 모든 후보의 총 투표 개수
		int total = 0;
		for (Vote v : selectAll()) {
			total = total + sumOne(v.getId());
		}
		return total;
	}

	
	public int selectOne(int manId, int ageId) throws SQLException {
		// 특정 연령대 투표 개수
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM vote?_table WHERE id = ?");
		pstmt.setInt(1, manId);
		pstmt.setInt(2, ageId);
		ResultSet result = pstmt.executeQuery();
		int num = 0;
		while (result.next()) {
			num = result.getInt(2);
		}
		result.close();
		pstmt.close();
		con.close();
		return num;
	}
	
	public List<Vote> selectAll() throws SQLException {
		// 모든 후보 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + VOTE_TABLE_NAME);
		ResultSet result = pstmt.executeQuery();

		List<Vote> voteList = new ArrayList<>();
		while (result.next()) {
			int id = result.getInt(VOTE_COLUMN_ID);
			String name = result.getString(VOTE_COLUMN_NAME);

			Vote vote = new Vote(id, name);
			voteList.add(vote);
		}
		result.close();
		pstmt.close();
		con.close();
		return voteList;
	}

	// U
	public void update(int manId, int ageId) throws SQLException {
		// 투표하기
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		ResultSet rset = stmt.executeQuery("select * from vote" + manId + "_table where id = " + ageId + ";");
		int beforeCount = 0;
		int afterCount = 0;
		while (rset.next()) {
			beforeCount = rset.getInt(2);
			afterCount = beforeCount + 1;
		}
		stmt.execute("update vote" + manId + "_table set age =" + afterCount + " where id = " + ageId);
		rset.close();
		stmt.close();
		con.close();
	}

	// D
	public void delete(int id) throws SQLException {
		// 후보 삭제하기
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		// 데이터베이스 입력
		stmt.execute("DELETE FROM " + VOTE_TABLE_NAME + " WHERE " + VOTE_COLUMN_ID + " = " + id + ";");
		stmt.execute("DROP TABLE vote" + id + "_table;");
		stmt.close();
		con.close();
	}

}
