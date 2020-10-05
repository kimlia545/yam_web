package com.example.rest_controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.mapper.PartyLikeMapper;
import com.example.vo.PartyLikeVO;

@RestController
@CrossOrigin("*")
public class RestPartyController {
	
	@Autowired
	private PartyLikeMapper partylikeMapper = null;
	
	@RequestMapping(value = "/party/content.json",
			method = { RequestMethod.GET, RequestMethod.POST },
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String,Object> likeCheck(@RequestBody PartyLikeVO lobj){
			System.out.println(lobj.toString());
			
			int ret = partylikeMapper.insertlike(lobj);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ret", 0);
			if (ret > 0)
				map.put("ret", 1);
				
			return map;
		}

}