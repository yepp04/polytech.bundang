package service;

import java.sql.SQLException;
import java.util.List;

import dao.NoticeDao;
import domain.Notice;

public class NoticeService {
	NoticeDao noticeDao = new NoticeDao();

	// C
	public int create(Notice notice) throws SQLException {
		return noticeDao.create(notice);
	}

	// R
	public List<Notice> selectAll() throws SQLException {
		return noticeDao.selectAll();
	}

	public List<Notice> selectOne(int id) throws SQLException {
		return noticeDao.selectOne(id);
	}

	// U

	public int update(Notice notice) throws SQLException {
		return noticeDao.update(notice);
	}

	// D
	
	public int delete(int id) throws SQLException {
		return noticeDao.delete(id);
	}
	
}
