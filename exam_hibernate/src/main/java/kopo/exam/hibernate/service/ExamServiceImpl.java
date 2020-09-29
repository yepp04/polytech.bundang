package kopo.exam.hibernate.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kopo.exam.hibernate.RIO.ExamRIO;
import kopo.exam.hibernate.Repo.ExamRepo;
import kopo.exam.hibernate.Repo.ExamRepoImpl;
import kopo.exam.hibernate.SIO.ExamSIO;

@Service
public class ExamServiceImpl implements ExamService {

	@Autowired
	private ExamRepo repo;
	

	private static final Logger logger = LoggerFactory.getLogger(ExamRepoImpl.class);
	
	
	@Override
	public void createDB() {
		// TODO Auto-generated method stub
		repo.createDB();
	}

	@Override
	public void dropDB() {
		// TODO Auto-generated method stub
		repo.dropDB();
	}

	@Override
	public void allsetDB() {
		// TODO Auto-generated method stub
		logger.info("allsetDB().start");
		this.insert(new ExamSIO("나연",209901,95,100,95));
		this.insert(new ExamSIO("정연",209902,95,95,95));
		this.insert(new ExamSIO("모모",209903,100,100,100));
		this.insert(new ExamSIO("사나",209904,100,95,90));
		this.insert(new ExamSIO("지효",209905,80,100,70));
		this.insert(new ExamSIO("미나",209906,100,100,70));
		this.insert(new ExamSIO("다현",209907,70,70,70));
		this.insert(new ExamSIO("채영",209908,100,90,80));
		this.insert(new ExamSIO("쯔위",209909,80,100,90));
	}

	@Override
	public void insert(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		try {
			repo.createOne(new ExamRIO(examSIO.getName(), examSIO.getStudentid(), examSIO.getKor(), examSIO.getEng(), examSIO.getMat()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ExamSIO selectOne(int id) {
		// TODO Auto-generated method stub
		ExamRIO exam = null;
		try {
			exam = repo.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ExamSIO(exam.getName(), exam.getStudentId(), exam.getKor(), exam.getEng(), exam.getMat());
	}
	@Override
	public List<ExamSIO> selectAll() {
		// TODO Auto-generated method stub
		List<ExamRIO> exams = null;
		try {
			exams = repo.selectAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<ExamSIO> examSIO = new ArrayList<>();
		for (ExamRIO exam : exams) {
			examSIO.add(new ExamSIO(exam.getName(), exam.getStudentId(), exam.getKor(), exam.getEng(), exam.getMat()));
		}
		return examSIO;
	}
	@Override
	public List<ExamSIO> selectAllByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void update(int id, ExamSIO examSIO) {
		// TODO Auto-generated method stub
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
	}
	@Override
	public void delete(ExamSIO examSIO) {
		// TODO Auto-generated method stub
	}
}
