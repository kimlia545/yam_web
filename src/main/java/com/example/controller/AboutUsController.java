package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/aboutus")

public class AboutUsController {

	@RequestMapping(value="/content", method = RequestMethod.GET)
	public String aboutus() {
		return "/aboutus/content";
	}
}
