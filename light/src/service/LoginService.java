package service;

import java.sql.SQLException;
import java.util.List;

import dao.LoginDao;
import domain.Login;

public class LoginService {

	LoginDao loginDao = new LoginDao();
	public List<Login> select() throws SQLException {
		return loginDao.select();
	}
	
	
}
