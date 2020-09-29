package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import domain.Resv;

public class ResvDao {
	public static final String RESV_TABLE_NAME = "realresv";
	public static final String RESV_COLUMN_NAME = "name";
	public static final String RESV_COLUMN_RESV_DATE = "resv_date"; // primary
	public static final String RESV_COLUMN_ROOM = "room"; // primary, 1=vip, 2=normal, 3=good
	public static final String RESV_COLUMN_ADDR = "addr";
	public static final String RESV_COLUMN_TELNUM = "telnum";
	public static final String RESV_COLUMN_IN_NAME = "in_name";
	public static final String RESV_COLUMN_COMMENT = "comment";
	public static final String RESV_COLUMN_WRITE_DATE = "write_date";
	public static final String RESV_COLUMN_PROCESSING = "processing";

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

	public int create(Resv resv) throws SQLException {
		// 게시판 제목 및 내용 수정
		Connection con = Connection();

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		PreparedStatement pstmt = con.prepareStatement("UPDATE " + RESV_TABLE_NAME + " SET " + RESV_COLUMN_NAME
				+ " = ?, " + RESV_COLUMN_ADDR + " = ?, " + RESV_COLUMN_TELNUM + " = ?, " + RESV_COLUMN_IN_NAME
				+ " = ?, " + RESV_COLUMN_COMMENT + " = ?, " + RESV_COLUMN_WRITE_DATE + " = ? WHERE "
				+ RESV_COLUMN_RESV_DATE + " = ? AND " + RESV_COLUMN_ROOM + " = ?");
		pstmt.setString(1, resv.getName());
		pstmt.setString(2, resv.getAddr());
		pstmt.setString(3, resv.getTelnum());
		pstmt.setString(4, resv.getIn_name());
		pstmt.setString(5, resv.getComment());
		pstmt.setString(6, sdf.format(cal.getTime()));
		pstmt.setString(7, resv.getResv_date());
		pstmt.setInt(8, resv.getRoom());

		int result = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return result;
	}

	// R
	public List<Resv> selectAll() throws SQLException {
		// 글 전체 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + RESV_TABLE_NAME);
		ResultSet result = pstmt.executeQuery();

		List<Resv> resvList = new ArrayList<>();
		while (result.next()) {
			String name = result.getString(RESV_COLUMN_NAME);
			String resv_date = result.getString(RESV_COLUMN_RESV_DATE);
			int room = result.getInt(RESV_COLUMN_ROOM);
			String addr = result.getString(RESV_COLUMN_ADDR);
			String telnum = result.getString(RESV_COLUMN_TELNUM);
			String in_name = result.getString(RESV_COLUMN_IN_NAME);
			String comment = result.getString(RESV_COLUMN_COMMENT);
			String write_date = result.getString(RESV_COLUMN_WRITE_DATE);
			int processing = result.getInt(RESV_COLUMN_PROCESSING);

			Resv resv = new Resv(name, resv_date, room, addr, telnum, in_name, comment, write_date, processing);
			resvList.add(resv);
		}
		result.close();
		pstmt.close();
		con.close();
		return resvList;
	}

	public List<Resv> selectOne(String resv_date, int room) throws SQLException {
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + RESV_TABLE_NAME + " WHERE "
				+ RESV_COLUMN_RESV_DATE + " = '" + resv_date + "' AND " + RESV_COLUMN_ROOM + " = " + room);
		ResultSet result = pstmt.executeQuery();

		List<Resv> resvList = new ArrayList<>();
		while (result.next()) {
			String name = result.getString(RESV_COLUMN_NAME);
			resv_date = result.getString(RESV_COLUMN_RESV_DATE);
			room = result.getInt(RESV_COLUMN_ROOM);
			String addr = result.getString(RESV_COLUMN_ADDR);
			String telnum = result.getString(RESV_COLUMN_TELNUM);
			String in_name = result.getString(RESV_COLUMN_IN_NAME);
			String comment = result.getString(RESV_COLUMN_COMMENT);
			String write_date = result.getString(RESV_COLUMN_WRITE_DATE);
			int processing = result.getInt(RESV_COLUMN_PROCESSING);

			Resv resv = new Resv(name, resv_date, room, addr, telnum, in_name, comment, write_date, processing);
			resvList.add(resv);
		}

		result.close();
		pstmt.close();
		con.close();
		return resvList;
	}

	// U
	public void update(Resv resv) throws SQLException {
		// 게시판 제목 및 내용 수정
		// 글 입력
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
			stmt.execute("INSERT INTO " + RESV_TABLE_NAME + "(" + RESV_COLUMN_NAME + "," + RESV_COLUMN_RESV_DATE + ","
					+ RESV_COLUMN_ROOM + "," + RESV_COLUMN_ADDR + "," + RESV_COLUMN_TELNUM + ","
					+ RESV_COLUMN_IN_NAME + "," + RESV_COLUMN_COMMENT + "," + RESV_COLUMN_WRITE_DATE + "," + RESV_COLUMN_PROCESSING + ") " + "VALUES('"
					+ resv.getName() + "','" + resv.getResv_date() + "'," + resv.getRoom() + ",'" + resv.getAddr()
					+ "','" + resv.getTelnum() + "','" + resv.getIn_name() + "','" + resv.getComment() + "','"
					+ resv.getWrite_date() + "'," + resv.getProcessing() + ");");
			stmt.close();
			con.close();
	}
	
	public void update(String date, int room) throws SQLException {
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
			stmt.execute("INSERT INTO " + RESV_TABLE_NAME + "(" + RESV_COLUMN_RESV_DATE + ","
					+ RESV_COLUMN_ROOM + ") " + "VALUES('" + date + "'," + room + ");");
			stmt.close();
			con.close();
	}
	
	
	// D
	public int delete(String resv_date, int room) throws SQLException {
		Connection con = Connection();
		PreparedStatement pstmt = con
				.prepareStatement("DELETE FROM " + RESV_TABLE_NAME + " WHERE " + RESV_COLUMN_RESV_DATE + " = ? AND " + RESV_COLUMN_ROOM + " = ?");
		pstmt.setString(1, resv_date);
		pstmt.setInt(2, room);
		int result = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return result;
	}
}
