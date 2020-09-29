package service;

import java.sql.SQLException;
import java.util.List;

import dao.VoteDao;
import domain.Vote;

public class VoteService {
	VoteDao voteDao = new VoteDao();

	// C
	public void create(Vote vote) throws SQLException {
		voteDao.create(vote);
	}

	// R
	public int sumOne(int ageId) throws SQLException {
		return voteDao.sumOne(ageId);

	}

	public int sumAll() throws SQLException {
		return voteDao.sumAll();
	}
	
	public int selectOne(int manId, int ageId) throws SQLException {
		return voteDao.selectOne(manId, ageId);
	}

	public List<Vote> selectAll() throws SQLException {
		return voteDao.selectAll();
	}

	// U
	public void update(int manId, int ageId) throws SQLException {
		voteDao.update(manId, ageId);
	}

	// D
	public void delete(int id) throws SQLException {
		voteDao.delete(id);
	}
}
