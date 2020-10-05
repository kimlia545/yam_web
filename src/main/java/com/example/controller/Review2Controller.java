package com.example.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.Review2Mapper;
import com.example.vo.ReviewVO;

@Controller
@RequestMapping(value = "/review")
public class Review2Controller {

	@Autowired
	private Review2Mapper review2Mapper = null;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listReview(Model model, 
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue = "0", required = false) int page,
			@RequestParam(value="text", defaultValue = "", required = false) String text) {
		
		if(page == 0) {
			return "redirect:" + request.getContextPath() + "/review/list?page=1"; 
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", page*10-9);
		map.put("end", page*10);
		map.put("text", text);
		List<ReviewVO> list = review2Mapper.listReview(map);
		model.addAttribute("list", list);
	
		int cnt = review2Mapper.countReview(text);
		model.addAttribute("cnt", (cnt-1)/10+1);
	
		return "/review/list";
	}
	
	@RequestMapping(value = "/timelinesample", method = RequestMethod.GET)
	public String timelinesample() {
		return "/review/timelinesample";
	}
	
	
	
	@RequestMapping(value="/ranking", method = RequestMethod.GET)
	public String rankinglist(Model model) {
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		List<ReviewVO> list1 = review2Mapper.countVisit(map1);
		model.addAttribute("list1", list1);
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		List<ReviewVO> list2 = review2Mapper.countFemaleVisit(map2);
		model.addAttribute("list2", list2);
		
		HashMap<String, Object> map3 = new HashMap<String, Object>();
		List<ReviewVO> list3 = review2Mapper.countMaleVisit(map3);
		model.addAttribute("list3", list3);

		HashMap<String, Object> mapavg1 = new HashMap<String, Object>();
		List<ReviewVO> listavg1 = review2Mapper.avgScore(mapavg1);
		model.addAttribute("listavg1", listavg1);
		
		HashMap<String, Object> mapavg2 = new HashMap<String, Object>();
		List<ReviewVO> listavg2 = review2Mapper.avgFemaleScore(mapavg2);
		model.addAttribute("listavg2", listavg2);
		
		HashMap<String, Object> mapavg3 = new HashMap<String, Object>();
		List<ReviewVO> listavg3 = review2Mapper.avgMaleScore(mapavg3);
		model.addAttribute("listavg3", listavg3);
		
		HashMap<String, Object> mapcntweek1 = new HashMap<String, Object>();
		List<ReviewVO> listcntweek1 = review2Mapper.countVisitWeek(mapcntweek1);
		model.addAttribute("listcntweek1", listcntweek1);
		
		HashMap<String, Object> mapcntweekf = new HashMap<String, Object>();
		List<ReviewVO> listcntweekf = review2Mapper.countFemaleVisitWeek(mapcntweekf);
		model.addAttribute("listcntweekf", listcntweekf);
		
		HashMap<String, Object> mapcntweekm = new HashMap<String, Object>();
		List<ReviewVO> listcntweekm = review2Mapper.countMaleVisitWeek(mapcntweekm);
		model.addAttribute("listcntweekm", listcntweekm);

		HashMap<String, Object> mapavgweek = new HashMap<String, Object>();
		List<ReviewVO> listavgweek = review2Mapper.avgScoreWeek(mapavgweek);
		model.addAttribute("listavgweek", listavgweek);

		HashMap<String, Object> mapavgweekf = new HashMap<String, Object>();
		List<ReviewVO> listavgweekf = review2Mapper.avgFemaleScoreWeek(mapavgweekf);
		model.addAttribute("listavgweekf", listavgweekf);

		HashMap<String, Object> mapavgweekm = new HashMap<String, Object>();
		List<ReviewVO> listavgweekm = review2Mapper.avgMaleScoreWeek(mapavgweekm);
		model.addAttribute("listavgweekm", listavgweekm);
		
		return "/review/ranking";
	}
}
