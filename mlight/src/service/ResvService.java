package service;

import java.sql.SQLException;
import java.util.List;

import dao.ResvDao;
import domain.Resv;

public class ResvService {

	ResvDao resvDao = new ResvDao(); 
	
	//C
	public int create(Resv resv) throws SQLException {
		return resvDao.create(resv);
	}
	
	
	//R
	
	public List<Resv> selectAll() throws SQLException {
		return resvDao.selectAll();
	}
	
	public List<Resv> selectOne(String resv_date, int room) throws SQLException {
		return resvDao.selectOne(resv_date, room);
	}
	//U
	
	public void update(Resv resv) throws SQLException {
		resvDao.update(resv);
	}
	
	public void update(String date, int room) throws SQLException {
		resvDao.update(date, room);
	}
	
	
	//D
	public int delete(String resv_date, int room) throws SQLException {
		return resvDao.delete(resv_date, room);
	}
}
