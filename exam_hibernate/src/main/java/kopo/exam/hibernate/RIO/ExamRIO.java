package kopo.exam.hibernate.RIO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examtable")
public class ExamRIO {
	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="name")
	private String name;
	@Column(name="studentid")
	private int studentId;	
	@Column(name="kor")
	private int kor;
	@Column(name="eng")
	private int eng;
	@Column(name="mat")
	private int mat;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public ExamRIO(String name, int studentId, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.studentId = studentId;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public ExamRIO() {
		super();
	}
}
