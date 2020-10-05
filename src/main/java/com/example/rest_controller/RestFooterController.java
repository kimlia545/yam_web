package com.example.rest_controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.mapper.Review2Mapper;
import com.example.vo.ReviewVO;

@RestController
@CrossOrigin("*")
public class RestFooterController {
	
	@Autowired
	private Review2Mapper review2Mapper = null;
	
	@RequestMapping(value = "/rest/reviewlist.json", method = {RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> reviewList(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<ReviewVO> list = review2Mapper.listReview(map);
		map.put("ret", list);
		
		return map;
	}

}
