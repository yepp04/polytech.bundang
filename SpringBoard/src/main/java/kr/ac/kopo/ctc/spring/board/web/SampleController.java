package kr.ac.kopo.ctc.spring.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.ctc.spring.board.RIO.Sample;
import kr.ac.kopo.ctc.spring.board.Repo.SampleRepo;
import kr.ac.kopo.ctc.spring.board.Repo.SampleSpecs;
import kr.ac.kopo.ctc.spring.board.Repo.mapper.SampleCondition;
import kr.ac.kopo.ctc.spring.board.Repo.mapper.SampleMapper;

@Controller
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Autowired
	private SampleRepo sampleRepo;
	
	@Autowired
	SampleMapper sampleMapper;
	
	@RequestMapping(value = "/sample/list")
	@ResponseBody
	public List<Sample> list(Model model) {
		return sampleRepo.findAll();
	}

	@RequestMapping(value = "/sample/filter")
	@ResponseBody
	public List<Sample> filter(Model model) {
		Map<String, Object> filter = new HashMap<>();
		filter.put("title", "aa");
		PageRequest pageable = PageRequest.of(0,  2);
		Page<Sample> ret = sampleRepo.findAll(SampleSpecs.search(filter), pageable);
		return ret.getContent();
	}
	
	@RequestMapping(value = "/sample/test")
	@ResponseBody
	public void findAll() {
		List<Sample> samples = sampleMapper.findAll();
		for (Sample sample : samples) {
			logger.info(sample.getTitle());
		}
	}
	
	@RequestMapping(value = "/mybatis/list")
	@ResponseBody
	public List<Sample> mabatis_list(Model model) {
		return sampleMapper.findAll();
	}
	
	@RequestMapping(value = "/mybatis/filter")
	@ResponseBody
	public List<Sample> mybatis_filter(Model model) {
		SampleCondition sampleCondition = new SampleCondition();
		sampleCondition.setTitle("aa");
		
		RowBounds rowBounds = new RowBounds(0, 2);
		
		return sampleMapper.findAllByCondition(sampleCondition, rowBounds);
	}
}
