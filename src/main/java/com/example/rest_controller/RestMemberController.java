package com.example.rest_controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.mapper.MemberMapper;

@RestController
@CrossOrigin("*")
public class RestMemberController {

	@Autowired
	private MemberMapper memberMapper = null;
	
	@RequestMapping(value = "/rest/memberidcheck.json", 
			method = { RequestMethod.GET, RequestMethod.POST }, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> boardList(
			@RequestParam("id") String id){
		int ret = memberMapper.idChk(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ret", ret);
			
		return map;
	}
}
