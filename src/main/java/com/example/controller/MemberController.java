package com.example.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.mapper.MemberMapper;
import com.example.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper = null;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVO obj) {
		
		if(memberMapper.idChk(obj.getUserid()) > 0) {
			return "redirect:/member/join" ;
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String str1 = passwordEncoder.encode(obj.getPassword());
		obj.setPassword(str1);
		memberMapper.insertMember(obj);
		
		return "redirect:/";
	}
	
	@RequestMapping(value= "/login", method = RequestMethod.GET)
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping(value = "/loginSuccess")
	public String loginSuccess(HttpSession httpSession) {
		String backURL = (String) httpSession.getAttribute("CURRPAGE");
		return "redirect:" + backURL;
	}
	
	@RequestMapping(value = "/page403", method = RequestMethod.GET)
	public String page403() {
		return "/member/page403";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Principal principal, Model model) {
		
		MemberVO vo = memberMapper.findByUserId(principal.getName());
		model.addAttribute("vo", vo);
		return "/member/edit";
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute MemberVO obj) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String str1 = passwordEncoder.encode(obj.getPassword());
		obj.setPassword(str1);
		memberMapper.updateMember(obj);
		return "redirect:/";
	}
}
