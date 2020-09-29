package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Notice;
import domain.Student;

public class NoticeDao {
	public static final String NOTICE_TABLE_NAME = "gongji2";
	public static final String NOTICE_COLUMN_ID = "id";
	public static final String NOTICE_COLUMN_TITLE = "title";
	public static final String NOTICE_COLUMN_DATE = "date";
	public static final String NOTICE_COLUMN_CONTENT = "content";

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
	public int create(Notice notice) throws SQLException {
		// 글 입력
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO " + NOTICE_TABLE_NAME + "(" + NOTICE_COLUMN_TITLE
				+ "," + NOTICE_COLUMN_DATE + "," + NOTICE_COLUMN_CONTENT + ") " + " VALUES (?, ?, ?)");
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getDate());
		pstmt.setString(3, notice.getContent());
		int result = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return result;
	}

	// R
	public List<Notice> selectAll() throws SQLException {
		// 글 전체 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT " + NOTICE_COLUMN_ID + "," + NOTICE_COLUMN_TITLE + ","
				+ NOTICE_COLUMN_DATE + " FROM " + NOTICE_TABLE_NAME + " ORDER BY " + NOTICE_COLUMN_ID + " DESC");
		ResultSet result = pstmt.executeQuery();

		List<Notice> noticeList = new ArrayList<>();
		while (result.next()) {
			int id = result.getInt(NOTICE_COLUMN_ID);
			String title = result.getString(NOTICE_COLUMN_TITLE);
			String date = result.getString(NOTICE_COLUMN_DATE);

			Notice notice = new Notice(id, title, date);
			noticeList.add(notice);
		}
		result.close();
		pstmt.close();
		con.close();
		return noticeList;
	}
	
	public List<Notice> selectOne(int id) throws SQLException {
		// 글 하나 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_ID + "= ?");
		pstmt.setInt(1, id);
		ResultSet result = pstmt.executeQuery();
		List<Notice> noticeList = new ArrayList<>();
		while (result.next()) {
			id = result.getInt(NOTICE_COLUMN_ID);
			String title = result.getString(NOTICE_COLUMN_TITLE);
			String date = result.getString(NOTICE_COLUMN_DATE);
			String content = result.getString(NOTICE_COLUMN_CONTENT);
			
			Notice notice = new Notice(id, title, date, content);
			noticeList.add(notice);
		}
		result.close();
		pstmt.close();
		con.close();
		return noticeList;
	}
	
	// U
	
	public int update(Notice notice) throws SQLException {
		// 게시판 제목 및 내용 수정
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_TITLE + " = ?, " 
		+ NOTICE_COLUMN_CONTENT + " = ? WHERE " + NOTICE_COLUMN_ID + " = ?");
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setInt(3, notice.getId());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}
	
	
	// D
	
	public int delete(int id) throws SQLException {
		// 학생 기록 삭제
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_ID + " = ?");
		pstmt.setInt(1, id);
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}
}
