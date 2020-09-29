package kopo.exam.hibernate.service;

import java.util.List;

import kopo.exam.hibernate.SIO.ExamSIO;


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
	void update(int id, ExamSIO examSIO);
	//delete
	void delete(int id);
	void delete(ExamSIO examSIO);
}

