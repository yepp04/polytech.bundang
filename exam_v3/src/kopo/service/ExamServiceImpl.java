package kopo.service;

import java.util.ArrayList;
import java.util.List;

import kopo.RIO.ExamRIO;
import kopo.Repo.ExamRepo;
import kopo.SIO.ExamSIO;

public class ExamServiceImpl implements ExamService {

	@Override
	public void createDB() {
		// TODO Auto-generated method stub
		ExamRepo.createDB();
	}

	@Override
	public void dropDB() {
		// TODO Auto-generated method stub
		ExamRepo.dropDB();
	}

	@Override
	public void allsetDB() {
		// TODO Auto-generated method stub
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
	public ExamSIO selectOne(int id) {
		// TODO Auto-generated method stub
		ExamRIO exam = ExamRepo.getRecordById(id);
		return new ExamSIO(exam.getName(), exam.getStudentId(), exam.getKor(), exam.getEng(), exam.getMat());
	}

	@Override
	public List<ExamSIO> selectAll() {
		// TODO Auto-generated method stub
		List<ExamRIO> exams = ExamRepo.getAllRecords();
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
	public int insert(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return ExamRepo.save(new ExamRIO(examSIO.getName(), examSIO.getStudentid(), examSIO.getKor(), examSIO.getEng(), examSIO.getMat()));
	}

	@Override
	public int update(int id, ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
