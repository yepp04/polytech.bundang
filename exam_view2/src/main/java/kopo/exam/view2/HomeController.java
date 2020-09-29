package kopo.exam.view2;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "get1", method = RequestMethod.GET)
	// /get1?id=aaa&pass=bbb 로 겟방식 호출하면 get1.jsp로 간다
	public String get1(Model model, String id, String pass) {
		logger.info("get1.jsp start["+id+":"+pass+"]");
		
		model.addAttribute("id", id);
		model.addAttribute("pass", pass);
		
		return "get1";
	}
	
	@RequestMapping(value = "get2/{id}/{pass}", method = RequestMethod.GET)
	public String get2(@PathVariable("id") String id, @PathVariable("pass") String pass, Model model) {
		logger.info("get2.jsp start["+id+":"+pass+"]");
		
		model.addAttribute("id", id);
		model.addAttribute("pass", pass);
		return "get2";
	}
	
	@RequestMapping(value = "post1", method = RequestMethod.POST)
	public String post1(Model model, String name, String studentid, String kor, String eng, String mat) throws UnsupportedEncodingException {
		logger.info("post1.jsp start["+name+":"+studentid+":"+kor+":"+eng+":"+mat+"]");
		
		//한글처리
		//name = new String(name.getBytes("8859_1"), "utf-8");
		
		model.addAttribute("name", name);
		model.addAttribute("studentid", studentid);
		model.addAttribute("kor", kor);
		model.addAttribute("eng", eng);
		model.addAttribute("mat", mat);
		return "post1";
	}
	
	@RequestMapping(value = "post2", method = RequestMethod.POST)
	public String post2(Model model, ExamRIO exam) throws UnsupportedEncodingException {
		logger.info("post2.jsp start["+exam.getName()+":"+exam.getStudentId()+":"+exam.getKor()+":"+exam.getEng()+":"+exam.getMat()+"]");
		
		//한글처리
		//exam.setName(new String(exam.getName().getBytes("8859_1"), "utf-8"));
		
		model.addAttribute("exam", exam);
		return "post2";
	}
	
}
