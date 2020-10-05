package com.example.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.PartyMapper;
import com.example.mapper.Review1Mapper;
import com.example.mapper.ShopMapper;
import com.example.vo.PartyVO;
import com.example.vo.ReviewVO;
import com.example.vo.ShopVO;

@Controller
public class HomeController {
	
	@Autowired
	private Review1Mapper r1Mapper;
	
	@Autowired
	private PartyMapper pMapper;
	
	@Autowired
	private ShopMapper sMapper;
	
	public class Timeline{
		private String date;
		private String content;
		private char category;
		private long rvno;
		private String shop_name;
		private String x;
		private String y;
		public Timeline(String date, String content, char category, long rvno) {
			this.date = date;
			this.content = content;
			this.category = category;
			this.rvno = rvno;
		}
		public Timeline(String date, String content, char category,
				long rvno, String shop_name, String x, String y) {
			this(date, content, category, rvno);
			this.shop_name = shop_name;
			this.x = x;
			this.y = y;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public char getCategory() {
			return category;
		}
		public void setCategory(char category) {
			this.category = category;
		}
		public long getRvno() {
			return rvno;
		}
		public void setRvno(long rvno) {
			this.rvno = rvno;
		}
		public String getShop_name() {
			return shop_name;
		}
		public void setShop_name(String shop_name) {
			this.shop_name = shop_name;
		}
		public String getX() {
			return x;
		}
		public void setX(String x) {
			this.x = x;
		}
		public String getY() {
			return y;
		}
		public void setY(String y) {
			this.y = y;
		}
		
	}
	
	@RequestMapping(value="/")
	public String home(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue = "admin") String id) {
		String userid = request.getRemoteUser();
		if(userid != null && !userid.equals(id)) {
			return "redirect:/?id="+ userid;
		}
		List<ReviewVO> rlist = r1Mapper.selectByUserid(id);
		List<PartyVO> plist = pMapper.selectByUserid(id);
		List<Timeline> list = new ArrayList<Timeline>();
		for (PartyVO vo : plist) {
			if(vo.getShopno() != 0) {
				ShopVO svo = sMapper.selectShopOne(vo.getShopno());
				list.add(new Timeline(vo.getPtydate(), vo.getPtycontent(), 'm',
						vo.getPtyno(), svo.getShop_name(), svo.getX(), svo.getY()));
			}
			else {
				list.add(new Timeline(vo.getPtydate(), vo.getPtycontent(), 'p', vo.getPtyno()));
			}
		}
		for (ReviewVO vo : rlist) {
			ShopVO svo = sMapper.selectShopOne(vo.getShopno());
			list.add(new Timeline(vo.getRvdate(), vo.getContent(), 'r',
					vo.getRvno(), svo.getShop_name(), svo.getX(), svo.getY()));
		}
		list.sort(new Comparator<Timeline>() {
			@Override
			public int compare(Timeline o1, Timeline o2) {
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		model.addAttribute("id", id);
		model.addAttribute("list", list);
		return "/index";
	}
	
	@RequestMapping(value = "timeline", method = RequestMethod.GET)
	public String timeline(Model model,
			@RequestParam(value="id") String id) {
		List<ReviewVO> rlist = r1Mapper.selectByUserid(id);
		List<PartyVO> plist = pMapper.selectByUserid(id);
		List<Timeline> list = new ArrayList<Timeline>();
		for (PartyVO vo : plist) {
			if(vo.getShopno() != 0) {
				ShopVO svo = sMapper.selectShopOne(vo.getShopno());
				list.add(new Timeline(vo.getPtydate(), vo.getPtycontent(), 'm',
						vo.getPtyno(), svo.getShop_name(), svo.getX(), svo.getY()));
			}
			else {
				list.add(new Timeline(vo.getPtydate(), vo.getPtycontent(), 'p', vo.getPtyno()));
			}
		}
		for (ReviewVO vo : rlist) {
			ShopVO svo = sMapper.selectShopOne(vo.getShopno());
			list.add(new Timeline(vo.getRvdate(), vo.getContent(), 'r',
					vo.getRvno(), svo.getShop_name(), svo.getX(), svo.getY()));
		}
		list.sort(new Comparator<Timeline>() {
			@Override
			public int compare(Timeline o1, Timeline o2) {
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		model.addAttribute("id", id);
		model.addAttribute("list", list);
		return "/index";
	}
}
