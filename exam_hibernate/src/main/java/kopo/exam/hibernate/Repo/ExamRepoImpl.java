package kopo.exam.hibernate.Repo;

import java.sql.Statement;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kopo.exam.hibernate.RIO.ExamRIO;

@Transactional
@Repository
public class ExamRepoImpl implements ExamRepo{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private static final Logger logger = LoggerFactory.getLogger(ExamRepoImpl.class);
	
	
	private Session getSession() {
		//return sessionFactory.openSession();
		logger.info("getSession().start");
		Session ss = null;
		try {
			ss = sessionFactory.getCurrentSession();
		} catch (org.hibernate.HibernateException he) {
			ss = sessionFactory.openSession();
		}
		return ss;
		
	}
	
	@Override
	public Long count() {
		// TODO Auto-generated method stub
		logger.info("count().start");
		String hql = "SELECT COUNT(*) FROM ExamRIO";
		Query query = getSession().createQuery(hql);
		Long totalCount = (Long) query.uniqueResult();
		return totalCount;
	}

	@Override
	public ExamRIO selectOne(long id) {
		// TODO Auto-generated method stub
		String hql = "FROM ExamRIO e WHERE studentid = " + id;
		Query query = getSession().createQuery(hql);
		return (ExamRIO) query.uniqueResult();
		// return (User) query.list().get(0);
		// return (Users) getSession().get(Users.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExamRIO> selectAll() {
		// TODO Auto-generated method stub
		String hql = "FROM ExamRIO";
		Query query = getSession().createQuery(hql);
		return query.list();
		// return getSession().createCriteria(ExamRIO.class).list();
	}

	@SuppressWarnings("uncheked")
	@Override
	public List<ExamRIO> selectAllByPagination(int page, int itemSizePerPage) {
		// TODO Auto-generated method stub
		String hql = "FROM ExamRIO ORDER BY studentid";
		Query query = getSession().createQuery(hql);
		query.setFirstResult((page - 1) * itemSizePerPage);
		query.setMaxResults(itemSizePerPage);
		return query.list();
	}

	@Override
	public void createOne(ExamRIO exam) {
		// TODO Auto-generated method stub
		getSession().save(exam);
	}

	@Override
	public void updateOne(ExamRIO exam) {
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(exam);
	}

	@Override
	public void deleteOne(ExamRIO exam) {
		// TODO Auto-generated method stub
		getSession().delete(exam);
	}

	@Override
	public int deleteAll() {
		// TODO Auto-generated method stub
		String hql = "DELETE FROM ExamRIO";
		Query query = getSession().createQuery(hql);
		return query.executeUpdate();
	}

	@Override
	public void createDB() {
		// TODO Auto-generated method stub
		// 하이버네이트 세션상태에서 테이블을 생성하고 지우고 하는 DDL-sql을 적용할 수 없음
		// 하이버네이트 세션에서 커넥션을 얻어다 sql을 날린다
		// 세션 내 커넥션이 있어서 커넥션을 close하면 안될 것 같다
		// 이렇게 쓰면 하이버네이트에서 drop, create DB 가능하다.
		Statement stmt;
		try {
			stmt = ((SessionImpl) getSession()).connection().createStatement();
			stmt.execute("create table examtable(name varchar(20), studentid int not null primary key, kor int, eng int, mat int) DEFAULT CHARSET=utf8;");
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void dropDB() {
		// TODO Auto-generated method stub
		Statement stmt;
		try {
			stmt = ((SessionImpl) getSession()).connection().createStatement();
			stmt.execute("drop table examtable;");
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
