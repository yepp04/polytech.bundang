package service;

import java.sql.SQLException;
import java.util.List;

import dao.StudentDao;
import domain.Student;

public class StudentService {
	StudentDao studentDao = new StudentDao();
	
	//C
	public void create(Student student) throws SQLException {
		int id = studentDao.selectAll().get(studentDao.selectAll().size()-1).getStudentId();
		student.setStudentId(id + 1);
		//학번자동
		
		studentDao.create(student);
	}
	//R
	public List<Student> selectOne(int id) throws SQLException {
		return studentDao.selectOne(id);
	}
	
	public List<Student> selectAll() throws SQLException {
		return studentDao.selectAll();
	}
	//U
	public int update(Student student) throws SQLException {
		return studentDao.update(student);
	}
	//D
	public int delete(int studentId) throws SQLException {
		return studentDao.delete(studentId);
	}
}
