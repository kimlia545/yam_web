package com.example.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.MemberMapper;
import com.example.mapper.PartyLikeMapper;
import com.example.mapper.PartyMapper;
import com.example.mapper.Party_ReplyMapper;
import com.example.mapper.Review1Mapper;
import com.example.mapper.Review2Mapper;
import com.example.mapper.ShopMapper;
import com.example.vo.MemberVO;
import com.example.vo.PartyVO;
import com.example.vo.ReviewVO;
import com.example.vo.ShopVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	MemberMapper mMapper = null;
	
	@Autowired
	Review1Mapper r1Mapper = null;
	
	@Autowired
	Review2Mapper r2Mapper = null;
	
	@Autowired
	ShopMapper sMapper = null;
	
	@Autowired
	PartyMapper pMapper = null;
	
	@Autowired
	Party_ReplyMapper prMapper = null;
	
	@Autowired
	PartyLikeMapper plMapper = null;
	
	@RequestMapping(value = "/home")
	public String adminhome() {
		return "/admin/home";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String memberlist(Model model) {
		List<MemberVO> list = mMapper.selectMemberLIst();
		model.addAttribute("list", list);
		return "/admin/member";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.POST)
	public String memberlist(@RequestParam("btn") String btn,
			@RequestParam(value="chk[]", required = false) String[] userids) {
		if(btn.equals("일괄삭제")) {
			mMapper.deleteMemberBatch(userids);
		}
		return "redirect:/admin/member";
	}
	
	@RequestMapping(value ="/shop", method = RequestMethod.GET)
	public String shopList(HttpSession httpSession, Model model, HttpServletRequest request, 
			@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text) {

		if (page == 0) {
			return "redirect:" + request.getContextPath() + "/admin/shop?page=1";
		}	
		
		//httpSession.setAttribute("SESSION_PARTY_HIT_CHECK", 1);		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page-1)*10+1);
		map.put("end", page * 10);
		map.put("text", text);
		List<ShopVO> list = sMapper.selectShopList(map);	
		model.addAttribute("list", list);
		
		int cnt = sMapper.countShop(text) -1;
		model.addAttribute("cnt",(int) Math.ceil(cnt/10.0));
		model.addAttribute("list", list);	
		
		List<ShopVO> list1 = sMapper.selecttop5();
		model.addAttribute("list1", list1);
		return "/admin/shop";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewlist(Model model) {
		List<ReviewVO> list = r2Mapper.selectReviewList();
		model.addAttribute("list", list);
		return"/admin/review"; 
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String reviewlist(@RequestParam("btn") String btn,
			@RequestParam(value="chk[]", required = false) String[] rvnos) {
		if(btn.equals("일괄삭제")) {
			r2Mapper.deleteReviewBatch(rvnos);
		}
		return "redirect:/admin/review";
	}
	
	@RequestMapping(value = "/party", method = RequestMethod.GET)
	public String list(HttpSession httpSession, Model model, HttpServletRequest request, PartyVO obj,
			@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text) {
		if (page == 0) {
			return "redirect:" + request.getContextPath() + "/admin/party?page=1";
		}
		httpSession.setAttribute("SESSION_PARTY_HIT_CHECK", 1);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", page * 10 - 9);
		map.put("end", page * 10);
		map.put("text", text);
		List<PartyVO> list = pMapper.searchParty(map);
		int j = 0; // 게시판 글번호
		for (int i = list.size(); i > 0; i--) {
			list.get(j).setPartycount(i);
			j++;
		}
		for (int i = 0; i < list.size(); i++) { // 댓글 개수
			int replycount = prMapper.countReply((int) list.get(i).getPtyno());
			list.get(i).setReplycount(replycount);
		}
		for(int i=0;i<list.size();i++) { //좋아요 개수
			int likecount = plMapper.countlike((int)list.get(i).getPtyno());
			list.get(i).setLikecount(likecount);
		}
		model.addAttribute("list", list);
		int cnt = pMapper.countParty(text);
		model.addAttribute("cnt", (cnt - 1) / 10 + 1);
		return "/admin/party";
	}
	
}
