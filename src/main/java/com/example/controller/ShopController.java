package com.example.controller;

import java.io.InputStream;
import java.security.Principal;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.ShopMapper;

import com.example.vo.PartyVO;
import com.example.vo.Party_ReplyVO;
import com.example.vo.ReviewVO;
//import com.example.vo.BoardVO;
import com.example.vo.ShopVO;

@Controller
@RequestMapping(value="/shop")
public class ShopController {

	@Autowired
	ShopMapper shopMapper = null;
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String shopList(HttpSession httpSession, Model model, HttpServletRequest request, 
			@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text) {

		if (page == 0) {
			return "redirect:" + request.getContextPath() + "/shop/list?page=1";
		}	
		
		//httpSession.setAttribute("SESSION_PARTY_HIT_CHECK", 1);		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page-1)*10+1);
		map.put("end", page * 10);
		map.put("text", text);
		List<ShopVO> list = shopMapper.selectShopList(map);	
		model.addAttribute("list", list);
		
		int cnt = shopMapper.countShop(text) -1;
		model.addAttribute("cnt",(int) Math.ceil(cnt/10.0));
		model.addAttribute("list", list);	
		
		List<ShopVO> list1 = shopMapper.selecttop5();
		model.addAttribute("list1", list1);
		return "/shop/list";
	}
	
	// 이미지
		@RequestMapping(value = "/getimg")
		public ResponseEntity<byte[]> getimg(@RequestParam("no") int no, HttpServletRequest request) {
			ShopVO obj = shopMapper.selectShopImg(no);
			try {
				if (obj.getRvimg().length > 0) { // 이미지가 있음
					HttpHeaders header = new HttpHeaders();
					header.setContentType(MediaType.IMAGE_JPEG);
					ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(obj.getRvimg(), header, HttpStatus.OK);
					return ret;
				}
				return null;
			} catch (Exception e) {
				try {
					InputStream in = request.getServletContext().getResourceAsStream("/resources/img/default-img.jpg");
					HttpHeaders header = new HttpHeaders();
					header.setContentType(MediaType.IMAGE_JPEG);
					ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.OK);
					return ret;
				} catch (Exception e1) {
					return null;
				}
			}
		}
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String shopContent(Model model, HttpSession httpSession, @ModelAttribute Party_ReplyVO robj, Principal principal,
		@RequestParam(value = "no", defaultValue = "0", required = false) int no) {
	if (no == 0) {
		return "redirect:/shop/list";
	}
	
	ShopVO shopvo = shopMapper.selectOneShop(no);
	model.addAttribute("obj", shopvo);
	
	// 리뷰 목록
	List<ShopVO> list = shopMapper.selectShopReview(no);
	model.addAttribute("list", list);
//	// 댓글 아이디
//	model.addAttribute("userid", principal.getName());
//	// 게시글 좋아요
//	obj.setWriter(principal.getName());
//	Integer likechk = parylikeMapper.selectlike(obj);
//	if(likechk == null) {
//		likechk = 0;
//	}
	//System.out.println(shopvo.toString());
	//model.addAttribute("likechk", likechk);

	return "/shop/content";
	}
	
	@RequestMapping(value ="/map2", method = RequestMethod.GET)
	public String showMap2(Model model) {
			List<ShopVO> list = shopMapper.selecttop5();
			model.addAttribute("list", list);
			return "/shop/map2";
	}	
	
	@RequestMapping(value ="/map", method = RequestMethod.GET)
	public String showMap() {
		return "/shop/map";
	}

}
	/*
	 * @RequestMapping(value = "/details", method = RequestMethod.GET) public String
	 * shopdetail(Model model, HttpSession httpSession,
	 * 
	 * @RequestParam(value="no", defaultValue = "1", required = false) int no) { if
	 * (no == 0) { return "redirect:/shop/list"; }
	 * 
	 * ShopVO obj = sDAO.selectShopOne(no); model.addAttribute("obj", obj);
	 * 
	 * return "/shop/details"; }
	 */


