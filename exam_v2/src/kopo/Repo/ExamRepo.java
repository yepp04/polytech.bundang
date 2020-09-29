package kopo.Repo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kopo.RIO.ExamRIO;

public class ExamRepo {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int createDB() {
		int status = 0;
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("create table examtable(name varchar(20), studentid int not null primary key, kor int, eng int, mat int) DEFAULT CHARSET=utf8;");
			stmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int dropDB() {
		int status = 0;
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("drop table examtable;");
			stmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int save(ExamRIO u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into examtable(name, studentid, kor, eng, mat) values(?,?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setInt(2, u.getStudentId());
			ps.setInt(3, u.getKor());
			ps.setInt(4, u.getEng());
			ps.setInt(5, u.getMat());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int update(ExamRIO u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("update examtable set name = ?, studentid = ?, kor = ?, eng = ?, mat = ? where studentid = ?");
			ps.setString(1, u.getName());
			ps.setInt(2, u.getStudentId());
			ps.setInt(3, u.getKor());
			ps.setInt(4, u.getEng());
			ps.setInt(5, u.getMat());
			ps.setInt(6, u.getStudentId());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int delete(ExamRIO u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from examtable where studentid = ?");
			ps.setInt(1, u.getStudentId());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<ExamRIO> getAllRecords() {
		List<ExamRIO> list = new ArrayList<>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from examtable");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ExamRIO u = new ExamRIO();
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentid"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));
				list.add(u);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	
	public static ExamRIO getRecordById(int id) {
		ExamRIO u = new ExamRIO();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from examtable where studentid = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentid"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
}
