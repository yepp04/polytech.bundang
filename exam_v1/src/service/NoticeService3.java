package service;

import java.sql.SQLException;
import java.util.List;

import dao.NoticeDao3;
import domain.Notice3;

public class NoticeService3 {
	NoticeDao3 noticeDao = new NoticeDao3();

	// C
	public int create(Notice3 notice) throws SQLException {
		return noticeDao.create(notice);
	}

	// R
	public List<Notice3> selectAll() throws SQLException {
		return noticeDao.selectAll();
	}

	public List<Notice3> selectOne(int id) throws SQLException {
		return noticeDao.selectOne(id);
	}

	// U

	public int update(Notice3 notice) throws SQLException {
		return noticeDao.update(notice);
	}

	// D
	
	public int delete(int id) throws SQLException {
		return noticeDao.delete(id);
	}
	
}
