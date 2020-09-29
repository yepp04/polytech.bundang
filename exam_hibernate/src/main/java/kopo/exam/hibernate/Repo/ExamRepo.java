package kopo.exam.hibernate.Repo;

import java.util.List;

import kopo.exam.hibernate.RIO.ExamRIO;

public interface ExamRepo {
	Long count();
	ExamRIO selectOne(long id);
	List<ExamRIO> selectAll();
	List<ExamRIO> selectAllByPagination(int page, int itemSizePerPage);
	void createOne(ExamRIO exam);
	void updateOne(ExamRIO exam);
	void deleteOne(ExamRIO exam);
	int deleteAll();
	void createDB();
	void dropDB();
}
