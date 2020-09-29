package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Notice4;

public class NoticeDao4 {
	public static final String NOTICE_TABLE_NAME = "gongji3";
	public static final String NOTICE_COLUMN_ID = "id";
	public static final String NOTICE_COLUMN_TITLE = "title";
	public static final String NOTICE_COLUMN_DATE = "date";
	public static final String NOTICE_COLUMN_CONTENT = "content";
	public static final String NOTICE_COLUMN_ROOTID = "rootid";
	public static final String NOTICE_COLUMN_RELEVEL = "relevel";
	public static final String NOTICE_COLUMN_RECNT = "recnt";
	public static final String NOTICE_COLUMN_VIEWCNT = "viewcnt";
	public static final String NOTICE_COLUMN_FILENAME = "filename";
	public static final String NOTICE_COLUMN_IMAGENAME = "imagename";

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
	public void create(Notice4 notice) throws SQLException {
		// 글 입력
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		if (notice.getFilename() != null && notice.getImagename() != null) {
			stmt.execute("INSERT INTO " + NOTICE_TABLE_NAME + "(" + NOTICE_COLUMN_TITLE + "," + NOTICE_COLUMN_DATE + ","
					+ NOTICE_COLUMN_CONTENT + "," + NOTICE_COLUMN_ROOTID + "," + NOTICE_COLUMN_RELEVEL + ","
					+ NOTICE_COLUMN_RECNT + "," + NOTICE_COLUMN_VIEWCNT + "," + NOTICE_COLUMN_FILENAME + "," + NOTICE_COLUMN_IMAGENAME + ") " + "VALUES('"
					+ notice.getTitle() + "','" + notice.getDate() + "','" + notice.getContent() + "'," + notice.getRootid()
					+ "," + notice.getRelevel() + "," + notice.getRecnt() + "," + notice.getViewcnt() + ",'"
					+ notice.getFilename() + "','" + notice.getImagename() + "');");
			ResultSet rset = stmt.executeQuery("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_TITLE
					+ " = '" + notice.getTitle() + "' AND " + NOTICE_COLUMN_CONTENT + " = '" + notice.getContent() + "';");
			
			int id = 0;
			while (rset.next()) {
				id = rset.getInt(1);
			}
			if (notice.getRelevel() == 0) {
				stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_ROOTID + " = " + id + " WHERE "
						+ NOTICE_COLUMN_ID + " = " + id + ";");
			}
			
			rset.close();
			stmt.close();
			con.close();	
		} else if (notice.getFilename() == null && notice.getImagename() != null) {
			stmt.execute("INSERT INTO " + NOTICE_TABLE_NAME + "(" + NOTICE_COLUMN_TITLE + "," + NOTICE_COLUMN_DATE + ","
					+ NOTICE_COLUMN_CONTENT + "," + NOTICE_COLUMN_ROOTID + "," + NOTICE_COLUMN_RELEVEL + ","
					+ NOTICE_COLUMN_RECNT + "," + NOTICE_COLUMN_VIEWCNT + ","  + NOTICE_COLUMN_IMAGENAME + ") " + "VALUES('"
					+ notice.getTitle() + "','" + notice.getDate() + "','" + notice.getContent() + "'," + notice.getRootid()
					+ "," + notice.getRelevel() + "," + notice.getRecnt() + "," + notice.getViewcnt() +  ",'" + notice.getImagename() + "');");
			ResultSet rset = stmt.executeQuery("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_TITLE
					+ " = '" + notice.getTitle() + "' AND " + NOTICE_COLUMN_CONTENT + " = '" + notice.getContent() + "';");
			
			int id = 0;
			while (rset.next()) {
				id = rset.getInt(1);
			}
			if (notice.getRelevel() == 0) {
				stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_ROOTID + " = " + id + " WHERE "
						+ NOTICE_COLUMN_ID + " = " + id + ";");
			}
			
			rset.close();
			stmt.close();
			con.close();	
		} else if (notice.getFilename() != null && notice.getImagename() == null) {
			stmt.execute("INSERT INTO " + NOTICE_TABLE_NAME + "(" + NOTICE_COLUMN_TITLE + "," + NOTICE_COLUMN_DATE + ","
					+ NOTICE_COLUMN_CONTENT + "," + NOTICE_COLUMN_ROOTID + "," + NOTICE_COLUMN_RELEVEL + ","
					+ NOTICE_COLUMN_RECNT + "," + NOTICE_COLUMN_VIEWCNT + ","  + NOTICE_COLUMN_FILENAME + ") " + "VALUES('"
					+ notice.getTitle() + "','" + notice.getDate() + "','" + notice.getContent() + "'," + notice.getRootid()
					+ "," + notice.getRelevel() + "," + notice.getRecnt() + "," + notice.getViewcnt() +  ",'" + notice.getFilename() + "');");
			ResultSet rset = stmt.executeQuery("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_TITLE
					+ " = '" + notice.getTitle() + "' AND " + NOTICE_COLUMN_CONTENT + " = '" + notice.getContent() + "';");
			
			int id = 0;
			while (rset.next()) {
				id = rset.getInt(1);
			}
			if (notice.getRelevel() == 0) {
				stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_ROOTID + " = " + id + " WHERE "
						+ NOTICE_COLUMN_ID + " = " + id + ";");
			}
			
			rset.close();
			stmt.close();
			con.close();
		} else {
			stmt.execute("INSERT INTO " + NOTICE_TABLE_NAME + "(" + NOTICE_COLUMN_TITLE + "," + NOTICE_COLUMN_DATE + ","
					+ NOTICE_COLUMN_CONTENT + "," + NOTICE_COLUMN_ROOTID + "," + NOTICE_COLUMN_RELEVEL + ","
					+ NOTICE_COLUMN_RECNT + "," + NOTICE_COLUMN_VIEWCNT + ") " + "VALUES('"
					+ notice.getTitle() + "','" + notice.getDate() + "','" + notice.getContent() + "'," + notice.getRootid()
					+ "," + notice.getRelevel() + "," + notice.getRecnt() + "," + notice.getViewcnt() + ");");
			ResultSet rset = stmt.executeQuery("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_TITLE
					+ " = '" + notice.getTitle() + "' AND " + NOTICE_COLUMN_CONTENT + " = '" + notice.getContent() + "';");
			
			int id = 0;
			while (rset.next()) {
				id = rset.getInt(1);
			}
			if (notice.getRelevel() == 0) {
				stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_ROOTID + " = " + id + " WHERE "
						+ NOTICE_COLUMN_ID + " = " + id + ";");
			}
			
			rset.close();
			stmt.close();
			con.close();	
		}
	}

	// R
	public List<Notice4> selectAll() throws SQLException {
		// 글 전체 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + NOTICE_TABLE_NAME + " ORDER BY "
				+ NOTICE_COLUMN_ROOTID + " DESC, " + NOTICE_COLUMN_RECNT + " ASC");
		ResultSet result = pstmt.executeQuery();

		List<Notice4> noticeList = new ArrayList<>();
		while (result.next()) {
			int id = result.getInt(NOTICE_COLUMN_ID);
			String title = result.getString(NOTICE_COLUMN_TITLE);
			String date = result.getString(NOTICE_COLUMN_DATE);
			String content = result.getString(NOTICE_COLUMN_CONTENT);
			int rootid = result.getInt(NOTICE_COLUMN_ROOTID);
			int relevel = result.getInt(NOTICE_COLUMN_RELEVEL);
			int recnt = result.getInt(NOTICE_COLUMN_RECNT);
			int viewcnt = result.getInt(NOTICE_COLUMN_VIEWCNT);
			String filename = result.getString(NOTICE_COLUMN_FILENAME);
			String imagename = result.getString(NOTICE_COLUMN_IMAGENAME);

			Notice4 notice = new Notice4(id, title, date, content, rootid, relevel, recnt, viewcnt, filename, imagename);
			noticeList.add(notice);
		}
		result.close();
		pstmt.close();
		con.close();
		return noticeList;
	}

	public List<Notice4> selectAll(String what, String search) throws SQLException {
		// 검색 내용 검색
		Connection con = Connection();
		if (what.equals("제목")) {
			what = NOTICE_COLUMN_TITLE;
		} else if (what.equals("내용")) {
			what = NOTICE_COLUMN_CONTENT;
		}
		PreparedStatement pstmt = con
				.prepareStatement("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + what + " LIKE '%" + search + "%'"
						+ " ORDER BY " + NOTICE_COLUMN_ROOTID + " DESC, " + NOTICE_COLUMN_RECNT + " ASC");
		ResultSet result = pstmt.executeQuery();

		List<Notice4> noticeList = new ArrayList<>();
		while (result.next()) {
			int id = result.getInt(NOTICE_COLUMN_ID);
			String title = result.getString(NOTICE_COLUMN_TITLE);
			String date = result.getString(NOTICE_COLUMN_DATE);
			String content = result.getString(NOTICE_COLUMN_CONTENT);
			int rootid = result.getInt(NOTICE_COLUMN_ROOTID);
			int relevel = result.getInt(NOTICE_COLUMN_RELEVEL);
			int recnt = result.getInt(NOTICE_COLUMN_RECNT);
			int viewcnt = result.getInt(NOTICE_COLUMN_VIEWCNT);
			String filename = result.getString(NOTICE_COLUMN_FILENAME);
			String imagename = result.getString(NOTICE_COLUMN_IMAGENAME);

			Notice4 notice = new Notice4(id, title, date, content, rootid, relevel, recnt, viewcnt, filename, imagename);
			noticeList.add(notice);
		}
		result.close();
		pstmt.close();
		con.close();
		return noticeList;
	}

	public List<Notice4> selectOne(int id) throws SQLException {
		// 글 하나 검색
		Connection con = Connection();
		PreparedStatement pstmt = con
				.prepareStatement("SELECT * FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_ID + "= ?");
		pstmt.setInt(1, id);
		ResultSet result = pstmt.executeQuery();
		List<Notice4> noticeList = new ArrayList<>();
		while (result.next()) {
			id = result.getInt(NOTICE_COLUMN_ID);
			String title = result.getString(NOTICE_COLUMN_TITLE);
			String date = result.getString(NOTICE_COLUMN_DATE);
			String content = result.getString(NOTICE_COLUMN_CONTENT);
			int rootid = result.getInt(NOTICE_COLUMN_ROOTID);
			int relevel = result.getInt(NOTICE_COLUMN_RELEVEL);
			int recnt = result.getInt(NOTICE_COLUMN_RECNT);
			int viewcnt = result.getInt(NOTICE_COLUMN_VIEWCNT);
			String filename = result.getString(NOTICE_COLUMN_FILENAME);
			String imagename = result.getString(NOTICE_COLUMN_IMAGENAME);

			Notice4 notice = new Notice4(id, title, date, content, rootid, relevel, recnt, viewcnt, filename, imagename);
			noticeList.add(notice);
		}
		result.close();
		pstmt.close();
		con.close();
		return noticeList;
	}

	public int selectRecnt(int rootId) throws SQLException {
		// 제일 높은 글 순서 구하기
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT MAX(" + NOTICE_COLUMN_RECNT + ") FROM "
				+ NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_ROOTID + "= ?");
		pstmt.setInt(1, rootId);
		ResultSet result = pstmt.executeQuery();
		int maxRecnt = 0;
		while (result.next()) {
			maxRecnt = result.getInt(1);
		}
		return maxRecnt;
	}

	// U

	public int update(Notice4 notice) throws SQLException {
		// 게시판 제목 및 내용 수정
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_TITLE
				+ " = ?, " + NOTICE_COLUMN_CONTENT + " = ?, " + NOTICE_COLUMN_FILENAME +" = ?, " + NOTICE_COLUMN_IMAGENAME + " = ? WHERE " + NOTICE_COLUMN_ID + " = ?");
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getFilename());
		pstmt.setString(4, notice.getImagename());
		pstmt.setInt(5, notice.getId());
		int result = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return result;
	}

	public void updateViewcnt(int id) throws SQLException {
		// 조회수
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다

		// 데이터베이스 입력
		ResultSet rset = stmt.executeQuery("SELECT " + NOTICE_COLUMN_VIEWCNT + " FROM " + NOTICE_TABLE_NAME + " WHERE "
				+ NOTICE_COLUMN_ID + " = " + id + ";");
		int beforeCount = 0;
		int afterCount = 0;
		while (rset.next()) {
			beforeCount = rset.getInt(1); // 원래 조회수
			afterCount = beforeCount + 1; // 1 더한거
		}
		stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_VIEWCNT + " = " + afterCount + " WHERE "
				+ NOTICE_COLUMN_ID + " = " + id + ";");
		rset.close();
		stmt.close();
		con.close();
	}

	public void updateRecnt(int rootId, int recnt) throws SQLException {
		// 글 순서 뒷 숫자 밀기
		Connection con = Connection();
		Statement stmt = con.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		stmt.execute("UPDATE " + NOTICE_TABLE_NAME + " SET " + NOTICE_COLUMN_RECNT + " = " + NOTICE_COLUMN_RECNT
				+ " + 1 WHERE " + NOTICE_COLUMN_ROOTID + " = " + rootId + " AND " + NOTICE_COLUMN_RECNT + " > " + recnt
				+ ";");
		stmt.close();
		con.close();
	}

	// D

	public int delete(int id) throws SQLException {
		// 학생 기록 삭제
		Connection con = Connection();
		PreparedStatement pstmt = con
				.prepareStatement("DELETE FROM " + NOTICE_TABLE_NAME + " WHERE " + NOTICE_COLUMN_ID + " = ?");
		pstmt.setInt(1, id);
		int result = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return result;
	}
}
