package kopo.Repo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kopo.RIO.ExamRIO;

@Repository
public class ExamRepo {
	private static final Logger logger = LoggerFactory.getLogger(ExamRepo.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createDB() {
		logger.info("Repository--- createDB");
		String query = "create table examtable(name varchar(20), studentid int not null primary key, kor int, eng int, mat int) DEFAULT CHARSET=utf8;";
		jdbcTemplate.execute(query);
	}

	public void dropDB() {
		logger.info("Repository--- dropDB");
		String query = "drop table examtable;";
		jdbcTemplate.execute(query);
	}

	public int save(ExamRIO u) {
		logger.info("Repository save");
		return jdbcTemplate.update("insert into examtable(name, studentid, kor, eng, mat) values(?,?,?,?,?)",
				u.getName(), u.getStudentId(), u.getKor(), u.getEng(), u.getMat());
	}

	public void update(ExamRIO u) {
		String query = "update examtable set name = ?, studentid = ?, kor = ?, eng = ?, mat = ? where studentid = ?";
		jdbcTemplate.update(query, u.getName(), u.getStudentId(), u.getKor(), u.getEng(), u.getMat(), u.getStudentId());
	}

	public void delete(ExamRIO u) {
		String query = "delete from examtable where studentid = ?";
		jdbcTemplate.update(query, u.getStudentId());
	}

	public List<ExamRIO> getAllRecords() {
		logger.info("Repository getAllRecords");
		List<ExamRIO> results = jdbcTemplate.query("select * from examtable", new RowMapper<ExamRIO>() {
			@Override
			public ExamRIO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ExamRIO u = new ExamRIO();
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentid"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));

				return u;
			}
		});
		return results;
	}

	public ExamRIO getRecordById(int id) {
		List<ExamRIO> results = jdbcTemplate.query("select * from examtable where studentid = ?", new RowMapper<ExamRIO>() {
			@Override
			public ExamRIO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ExamRIO u = new ExamRIO();
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentid"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));
				return u;
			}
		}, id);
		
		return results.isEmpty()? null:results.get(0);
	}
}
