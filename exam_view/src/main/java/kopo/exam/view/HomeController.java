package kopo.exam.view;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kopo.RIO.ExamRIO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome home!");
		
		// 모델에 한개를 보내거나
		model.addAttribute("name", "강진성");
		model.addAttribute("addr", "용인시");
		
		// 모델에 클래스 구조로 보내거나
		ExamRIO exam = new ExamRIO("제니",209901,91,100,95);
		model.addAttribute("exam", exam);
		
		// 모델에 클래스 구조의 리스트로 보내거나
		List<ExamRIO> exams = new ArrayList<>();
		exams.add(new ExamRIO("나연", 209901, 91, 100, 95));
		exams.add(new ExamRIO("정연", 209902, 92, 100, 95));
		exams.add(new ExamRIO("모모", 209903, 93, 100, 95));
		exams.add(new ExamRIO("사나", 209904, 94, 100, 95));
		exams.add(new ExamRIO("지효", 209905, 80, 100, 95));
		exams.add(new ExamRIO("미나", 209906, 96, 100, 95));
		exams.add(new ExamRIO("다현", 209907, 97, 100, 95));
		exams.add(new ExamRIO("채영", 209908, 98, 100, 95));
		exams.add(new ExamRIO("쯔위", 209909, 99, 100, 95));
		model.addAttribute("exams", exams);
		return "home";
	}
}
