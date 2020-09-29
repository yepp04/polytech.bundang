package kopo.exam.hibernate;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kopo.exam.hibernate.service.ExamService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExamController {

	@Autowired
	private ExamService service;

	private static final Logger logger = LoggerFactory.getLogger(ExamController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		logger.info("index.jsp start");

		return "index";
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String menu() {
		logger.info("menu.jsp start");
		return "menu";
	}

	@RequestMapping(value = "/allsetDB", method = RequestMethod.GET)
	public String allsetDB(Model model) {
		logger.info("allsetDB.jsp start");

		String ret = null;
		try {
			service.allsetDB();
			ret = "DB create 성공";
		} catch (Exception e) {
			e.printStackTrace();
			ret = "DB create 실패" + e;
		}
		model.addAttribute("msg", ret);
		return "allsetDB";
	}
	
	@RequestMapping(value = "/allviewDB", method = RequestMethod.GET)
	public String allviewDB(Model model) {
		logger.info("allviewDB.jsp start");
		try {
			model.addAttribute("list", service.selectAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "allviewDB";
	}
	@RequestMapping(value = "/createDB", method = RequestMethod.GET)
	public String createDB(Model model) {
		logger.info("createDB.jsp start");
		String ret = null;
		try {
			service.createDB();
			ret = "DB create 성공";
		} catch (Exception e) {
			e.printStackTrace();
			ret = "DB create 실패" + e;
		}
		model.addAttribute("msg", ret);
		return "createDB";
	}

	@RequestMapping(value = "/dropDB", method = RequestMethod.GET)
	public String dropDB(Model model) {
		logger.info("dropDB.jsp start");
		String ret = null;
		try {
			service.dropDB();
			ret = "DB Drop 성공";
		} catch (Exception e) {
			e.printStackTrace();
			ret = "DB Drop 실패" + e;
		}
		model.addAttribute("msg", ret);
		return "dropDB";
	}
	
	@RequestMapping(value = "/oneviewDB/{studentid}", method = RequestMethod.GET)
	public String oneviewDB(@PathVariable("studentid") int studentid, Model model) {
		logger.info("oneviewDB.jsp start studentid ="+studentid);
		try {
			model.addAttribute("list", service.selectOne(studentid));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "oneviewDB";
	}
	
	
}
