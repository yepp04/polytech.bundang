package kopo.service;

import java.util.List;

import kopo.SIO.ExamSIO;

public interface ExamService {
	//createDB & dropDB
	void createDB();
	void dropDB();
	//그나마 서비스 같은 놈
	void allsetDB();
	//read
	ExamSIO selectOne(int id);
	List<ExamSIO> selectAll();
	List<ExamSIO> selectAllByName(String name);
	//update
	void insert(ExamSIO examSIO);
	int update(int id, ExamSIO examSIO);
	int update(ExamSIO examSIO);
	//delete
	int delete(int id);
	int delete(ExamSIO examSIO);
}

