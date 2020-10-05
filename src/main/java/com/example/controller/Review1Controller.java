package com.example.controller; 

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;

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
import org.springframework.web.multipart.MultipartFile;

import com.example.mapper.Review1Mapper;
import com.example.mapper.ShopMapper;
import com.example.vo.ReviewVO;
import com.example.vo.ShopVO; 
  
@Controller 
@RequestMapping(value = "/review") 

public class Review1Controller { 
	
    @Autowired 
    Review1Mapper review1Mapper = null; 
    
    @Autowired 
    ShopMapper shopMapper = null; 

    //리뷰상세읽기 
    @RequestMapping(value="/content", method = RequestMethod.GET) 
    public String contentsReview(Model model, HttpSession httpSession, 
			@RequestParam(value="no", defaultValue = "0", required = false) int rvno) { 
    	
        ReviewVO obj = review1Mapper.selectReviewOne(rvno); 
        model.addAttribute("obj", obj); 
		
		int p = review1Mapper.selectBoardPrev(rvno);
		model.addAttribute("prev", p);
		
		int n = review1Mapper.selectBoardNext(rvno);
		model.addAttribute("next", n);
		
        return "/review/content"; 
    }
    
    @RequestMapping(value="/getimg")
	public ResponseEntity<byte[]> getimg(
			@RequestParam("no") int no,
			HttpServletRequest request){
		ReviewVO obj = review1Mapper.selectReviewImg(no);
		try {
			if (obj.getRvimg().length > 0) { //이미지가 있음
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							obj.getRvimg(), header, HttpStatus.OK);
				return ret;
			}
			return null;
		}
		catch(Exception e) {
			try {
				//request.getServletContext().getResourceAsStream() ==	//src/main/webapp
				InputStream in 
					= request.getServletContext().getResourceAsStream("/resources/img/default-img.jpg");
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							IOUtils.toByteArray(in), header, HttpStatus.OK);
				return ret;
			}
			catch(Exception e1) {
				return null;
			}
		}
	}
	
    @RequestMapping(value="/getimgtp")
	public ResponseEntity<byte[]> getimgtp(
			@RequestParam("no") int no,
			HttpServletRequest request){
		ReviewVO obj = review1Mapper.selectReviewImg(no);
		try {
			if (obj.getRvimg().length > 0) { //이미지가 있음
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							obj.getRvimg(), header, HttpStatus.OK);
				return ret;
			}
			return null;
		}
		catch(Exception e) {
			try {
				//request.getServletContext().getResourceAsStream() ==	//src/main/webapp
				InputStream in 
					= request.getServletContext().getResourceAsStream("/resources/img/transparent.png");
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							IOUtils.toByteArray(in), header, HttpStatus.OK);
				return ret;
			}
			catch(Exception e1) {
				return null;
			}
		}
	}
    
    @RequestMapping(value="/insert", method = RequestMethod.GET) 
    public String insertReview(Principal principal, Model model) { 
        String userid = principal.getName(); 
        model.addAttribute("userid", userid); 
        return "/review/insert"; 
    } 

    @RequestMapping(value="/insert", method = RequestMethod.POST) 
    public String insertReviewPost(@RequestParam("map_id") String id,
    		@RequestParam("map_id") String mid,
    		@RequestParam("shop_name") String name,
    		@RequestParam("shop_adr") String adr,
    		@RequestParam("shop_tel") String tel,
    		@RequestParam("shop_dep") String dep,
    		@RequestParam("x") String x,
    		@RequestParam("y") String y,
    		@RequestParam("score") long score,
    		@RequestParam("content") String content,
    		@RequestParam("userid") String uid,
    		@RequestParam("menu") String menu,
    		@RequestParam MultipartFile[] imgs) throws IOException {
    	
    		int k = shopMapper.selectMapId(mid);
    		long shopno;
    		ShopVO shopvo = new ShopVO();
    		ReviewVO reviewvo = new ReviewVO();
    		System.out.println(mid);
    		if(k != 0) {
				shopno = shopMapper.selectShopNo(mid);
	  			
    		} else {
    		    shopvo = new ShopVO(mid, name, adr, tel, dep, x, y);
    			shopMapper.insertShop(shopvo);
    			shopno = shopMapper.selectShopNo(mid);
    			System.out.println(shopno);
    		}  
    		System.out.println(shopno);
			
			  reviewvo = new ReviewVO(shopno, uid, score, content, menu);
			  
			  if(imgs != null && imgs.length > 0) { //이미지가 첨부되었다면 for 
				  for( MultipartFile one :imgs ) { reviewvo.setRvimg(one.getBytes()); } }
			  
			  
			  review1Mapper.insertReview(reviewvo);
			 
			return  "redirect:/review/list"; 
    }

    @RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateReview(Principal principal, Model model,
			@RequestParam(value="no", defaultValue = "0") int no) {
    	ReviewVO obj = review1Mapper.selectReviewOne(no);
    	model.addAttribute("obj", obj);	
		return "/review/update";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateReviewPost(@ModelAttribute ReviewVO obj,
			@RequestParam MultipartFile[] img) throws IOException {
		
		if(img != null) {
			for ( MultipartFile one : img ) {
				if(one.getSize() > 0) { //첨부한 파일의 용량이 있느냐?
				//if(!one.getOriginalFilename().equals("")) { //파일명이 비어 있지 않다면
					obj.setRvimg(one.getBytes());
				}
			}
		}
		review1Mapper.updateReview(obj);
		return "redirect:/review/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam(value="no", defaultValue = "0") int no) {
		ReviewVO obj = review1Mapper.selectReviewOne(no); 
		obj.setRvno(no);
		int ret =  review1Mapper.deleteReview(obj);
		
		if(ret > 0) {  //성공하면 목록화면 으로
			return "redirect:/review/list";
		}
		//실패하면 이전화면 즉, 상세화면으로
		return "redirect:/review/content?no=" + no;
	}
	
} 