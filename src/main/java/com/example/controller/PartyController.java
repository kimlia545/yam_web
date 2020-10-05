package com.example.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.mapper.PartyLikeMapper;
import com.example.mapper.PartyMapper;
import com.example.mapper.Party_ReplyMapper;
import com.example.mapper.ShopMapper;
import com.example.vo.PartyVO;
import com.example.vo.Party_ReplyVO;
import com.example.vo.ReviewVO;
import com.example.vo.ShopVO;

@Controller
@RequestMapping("/party")
public class PartyController {

	// 글 좋아요 글 목록에서
	// 추가 1)해쉬태그 #2명 #중식 2)글순서 최신순 오래된순 조회순 댓글순 3)날짜마감

	@Autowired
	private PartyMapper partyMapper;

	@Autowired
	private ShopMapper shopMapper;

	@Autowired
	private Party_ReplyMapper party_replyMapper;

	@Autowired
	private PartyLikeMapper parylikeMapper;

	// 글목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession httpSession, Model model, HttpServletRequest request, PartyVO obj,
			@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text) {
		if (page == 0) {
			return "redirect:" + request.getContextPath() + "/party/list?page=1";
		}
		httpSession.setAttribute("SESSION_PARTY_HIT_CHECK", 1);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", page * 10 - 9);
		map.put("end", page * 10);
		map.put("text", text);
		List<PartyVO> list = partyMapper.searchParty(map);
		int j = 0; // 게시판 글번호
		for (int i = list.size(); i > 0; i--) {
			list.get(j).setPartycount(i);
			j++;
		}
		for (int i = 0; i < list.size(); i++) { // 댓글 개수
			int replycount = party_replyMapper.countReply((int) list.get(i).getPtyno());
			list.get(i).setReplycount(replycount);
		}
		for(int i=0;i<list.size();i++) { //좋아요 개수
			int likecount = parylikeMapper.countlike((int)list.get(i).getPtyno());
			list.get(i).setLikecount(likecount);
		}
		model.addAttribute("list", list);
		int cnt = partyMapper.countParty(text);
		model.addAttribute("cnt", (cnt - 1) / 10 + 1);
		return "/party/list";
	}

	// 글쓰기 페이지
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Principal principal, Model model) {
		model.addAttribute("userid", principal.getName());
		return "/party/insert";
	}

	// 글쓰기 실행
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertReviewPost(@RequestParam(value="map_id", defaultValue = "") String id, 
			@RequestParam("map_id") String mid,
			@RequestParam("shop_name") String name, 
			@RequestParam("shop_adr") String adr,
			@RequestParam("shop_tel") String tel, 
			@RequestParam("shop_dep") String dep, @RequestParam("x") String x,
			@RequestParam("y") String y, @RequestParam("ptytitle") String title,
			@RequestParam("ptycontent") String content, @RequestParam("userid") String uid,
			@RequestParam MultipartFile[] imgs) throws IOException {

		long shopno;
		ShopVO shopvo = new ShopVO();
		PartyVO partyvo = new PartyVO();
		System.out.println(mid);
		if (mid.equals("0")) {
			System.out.println("NULL");
			shopno = 0L;
		} else {
			int k = shopMapper.selectMapId(mid);

			if (k != 0) {
				shopno = shopMapper.selectShopNo(mid);

			} else {
				shopvo = new ShopVO(mid, name, adr, tel, dep, x, y);
				shopMapper.insertShop(shopvo);
				shopno = shopMapper.selectShopNo(mid);
			}
		}
		System.out.println(shopno);
		partyvo = new PartyVO(uid, title, content, shopno);

		if (imgs != null && imgs.length > 0) { // 이미지가 첨부되었다면 for
			for (MultipartFile one : imgs) {
				partyvo.setPtyimg(one.getBytes());
			}
		}

		partyMapper.insertPARTY(partyvo);

		return "redirect:/party/list";
	}

	// 이미지
	@RequestMapping(value = "/getimg")
	public ResponseEntity<byte[]> getimg(@RequestParam("no") int no, HttpServletRequest request) {
		PartyVO obj = partyMapper.selectPartyImg(no);
		try {
			if (obj.getPtyimg().length > 0) { // 이미지가 있음
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(obj.getPtyimg(), header, HttpStatus.OK);
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

	// 글읽기
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Model model, HttpSession httpSession, @ModelAttribute Party_ReplyVO robj, Principal principal,
			@RequestParam(value = "no", defaultValue = "0", required = false) int ptyno,
			@RequestParam(value = "no", defaultValue = "0", required = false) int rpno) {
		if (ptyno == 0) {
			return "redirect:/party/list";
		}
		Integer chk = (Integer) httpSession.getAttribute("SESSION_PARTY_HIT_CHECK");
		if (chk != null) {
			if (chk == 1) {
				partyMapper.updateHit(ptyno);
			}
			httpSession.setAttribute("SESSION_PARTY_HIT_CHECK", 0);
		}
		PartyVO obj = partyMapper.selectPartyOne(ptyno);
		model.addAttribute("obj", obj);
		int p = partyMapper.selectPartyPrev(ptyno);
		model.addAttribute("prev", p);
		int n = partyMapper.selectPartyNext(ptyno);
		model.addAttribute("next", n);
		// 댓글 목록
		List<Party_ReplyVO> list = party_replyMapper.selectReply(ptyno);
		int j = 0; // 게시판 글번호
		for (int i = list.size(); i > 0; i--) {
			list.get(j).setRpcount(i);
			j++;
		}
		model.addAttribute("list", list);
		// 댓글 아이디
		model.addAttribute("userid", principal.getName());
		// 게시글 좋아요
		obj.setWriter(principal.getName());
		Integer likechk = parylikeMapper.selectlike(obj);
		if(likechk == null) {
			likechk = 0;
		}
		System.out.println(obj.toString());
		model.addAttribute("likechk", likechk);

		return "/party/content";
	}

	// 글삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, @RequestParam(value = "no", defaultValue = "0") int ptyno) {

		int ret = partyMapper.deleteParty(ptyno);
		if (ret > 0) {
			return "redirect:" + request.getContextPath() + "/party/list";
		}
		return "redirect:" + request.getContextPath() + "/party/content?no=" + ptyno;
	}

	// 글수정 페이지
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model,
			@RequestParam(value = "no", defaultValue = "0") int ptyno) {
		PartyVO obj = partyMapper.selectPartyOne(ptyno);
		model.addAttribute("obj", obj);
		return "/party/update";
	}

	// 글수정 실행
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, 
			@RequestParam(value="map_id", defaultValue = "") String id, 
			@RequestParam("map_id") String mid, @RequestParam("shop_name") String name, 
			@RequestParam("shop_adr") String adr, @RequestParam("shop_tel") String tel, 
			@RequestParam("shop_dep") String dep, @RequestParam("x") String x,
			@RequestParam("y") String y, @RequestParam("ptytitle") String title,
			@RequestParam("ptycontent") String content, @RequestParam("userid") String uid, 
			@RequestParam("ptyno") long ptyno, @RequestParam MultipartFile[] img)
			throws IOException {
		
		long shopno;
		ShopVO shopvo = new ShopVO();
		PartyVO partyvo = new PartyVO();
		System.out.println(mid);
		if (mid.equals("0")) {
			System.out.println("NULL");
			shopno = 0L;
		} else {
			int k = shopMapper.selectMapId(mid);

			if (k != 0) {
				shopno = shopMapper.selectShopNo(mid);

			} else {
				shopvo = new ShopVO(mid, name, adr, tel, dep, x, y);
				shopMapper.insertShop(shopvo);
				shopno = shopMapper.selectShopNo(mid);
			}
		}
		System.out.println(shopno);
		partyvo = new PartyVO(uid, title, content, shopno, ptyno);
		System.out.println(partyvo);
		
		if (img != null) {
			for (MultipartFile one : img) {
				if (one.getSize() > 0) {
					partyvo.setPtyimg(one.getBytes());
				}
			}
		}
		partyMapper.updateParty(partyvo);
		
		return "redirect:" + request.getContextPath() + "/party/content?no=" + partyvo.getPtyno();
	}
}
