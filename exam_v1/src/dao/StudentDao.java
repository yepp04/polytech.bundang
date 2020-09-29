package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Student;

public class StudentDao {
	public static final String STUDENT_TABLE_NAME = "examtable";
	public static final String STUDENT_COLUMN_NAME = "name";
	public static final String STUDENT_COLUMN_ID = "studentid";
	public static final String STUDENT_COLUMN_KOR = "kor";
	public static final String STUDENT_COLUMN_ENG = "eng";
	public static final String STUDENT_COLUMN_MAT = "mat";

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
	public int create(Student student) throws SQLException {
		// 학생 성적 입력
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO " + STUDENT_TABLE_NAME + " VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, student.getName());
		pstmt.setInt(2, student.getStudentId());
		pstmt.setInt(3, student.getKor());
		pstmt.setInt(4, student.getEng());
		pstmt.setInt(5, student.getMat());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}
	

	// R
	public List<Student> selectOne(int id) throws SQLException {
		// 학생 한명 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + STUDENT_TABLE_NAME + " WHERE " + STUDENT_COLUMN_ID + "= ?");
		pstmt.setInt(1, id);
		ResultSet result = pstmt.executeQuery();
		List<Student> studentList = new ArrayList<>();
		while (result.next()) {
			String name = result.getString(STUDENT_COLUMN_NAME);
			id = result.getInt(STUDENT_COLUMN_ID);
			int kor = result.getInt(STUDENT_COLUMN_KOR);
			int eng = result.getInt(STUDENT_COLUMN_ENG);
			int mat = result.getInt(STUDENT_COLUMN_MAT);
			
			Student student = new Student(name, id, kor, eng, mat);
			studentList.add(student);
		}
		result.close();
		pstmt.close();
		con.close();
		return studentList;
	}

	public List<Student> selectAll() throws SQLException {
		// 학생 전체 검색
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM " + STUDENT_TABLE_NAME);
		ResultSet result = pstmt.executeQuery();
		
		List<Student> studentList = new ArrayList<>();
		while (result.next()) {
			String name = result.getString(STUDENT_COLUMN_NAME);
			int id = result.getInt(STUDENT_COLUMN_ID);
			int kor = result.getInt(STUDENT_COLUMN_KOR);
			int eng = result.getInt(STUDENT_COLUMN_ENG);
			int mat = result.getInt(STUDENT_COLUMN_MAT);
			
			Student student = new Student(name, id, kor, eng, mat);
			studentList.add(student);
		}
		result.close();
		pstmt.close();
		con.close();
		return studentList;
	}

	// U
	public int update(Student student) throws SQLException {
		// 학생 이름 및 성적 수정
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("UPDATE " + STUDENT_TABLE_NAME + " SET " + STUDENT_COLUMN_NAME + " = ?, " 
		+ STUDENT_COLUMN_KOR + " = ?, " + STUDENT_COLUMN_ENG + " = ?, " + STUDENT_COLUMN_MAT + " = ? "+" WHERE " + STUDENT_COLUMN_ID + " = ?");
		pstmt.setString(1, student.getName());
		pstmt.setInt(2, student.getKor());
		pstmt.setInt(3, student.getEng());
		pstmt.setInt(4, student.getMat());
		pstmt.setInt(5, student.getStudentId());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}

	// D
	public int delete(int studentId) throws SQLException {
		// 학생 기록 삭제
		Connection con = Connection();
		PreparedStatement pstmt = con.prepareStatement("DELETE FROM " + STUDENT_TABLE_NAME + " WHERE " + STUDENT_COLUMN_ID + " = ?");
		pstmt.setInt(1, studentId);
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}
}
