package service;

import java.sql.SQLException;
import java.util.List;

import dao.NoticeDao2;
import domain.Notice2;

public class NoticeService2 {
	NoticeDao2 noticeDao = new NoticeDao2();

	// C
	public void create(Notice2 notice) throws SQLException {
		noticeDao.create(notice);
	}

	// R
	public List<Notice2> selectAll() throws SQLException {
		return noticeDao.selectAll();
	}

	public List<Notice2> selectAll(String what ,String search) throws SQLException {
		return noticeDao.selectAll(what, search);
	}
	
	public List<Notice2> selectOne(int id) throws SQLException {
		return noticeDao.selectOne(id);
	}

	public int selectRecnt(int rootId) throws SQLException {
		return noticeDao.selectRecnt(rootId);
	}

	// U

	public int update(Notice2 notice) throws SQLException {
		return noticeDao.update(notice);
	}

	public void updateViewcnt(int id) throws SQLException {
		noticeDao.updateViewcnt(id);
	}
	
	public void updateRecnt(int rootId, int recnt) throws SQLException {
		noticeDao.updateRecnt(rootId, recnt);
	}

	// D

	public int delete(int id) throws SQLException {
		return noticeDao.delete(id);
	}

}
