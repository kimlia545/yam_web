package com.example.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.PartyMapper;
import com.example.mapper.Party_ReplyMapper;
import com.example.vo.PartyVO;
import com.example.vo.Party_ReplyVO;

@Controller
@RequestMapping("/party_reply")
public class Party_ReplyController {
	
	@Autowired
	private PartyMapper partyMapper;
	
	@Autowired
	private Party_ReplyMapper party_replyMapper;


	 //댓글 쓰기
	 @RequestMapping(value="/insert",method = RequestMethod.POST) 
	 public String insert(Principal principal,Model model,
			 @ModelAttribute Party_ReplyVO robj,HttpServletRequest request,
			 @RequestParam(value="no",defaultValue="0")int ptyno,
			 @RequestParam(value="userid",defaultValue="0")String userid,
			 @RequestParam(value="createreply",defaultValue="0")String createreply) {
		 robj.setUserid(userid);
		 robj.setPtyno(ptyno);
		 robj.setRpcontent(createreply);
		 System.out.println(robj.toString());
		 party_replyMapper.insertReply(robj); 
		 return "redirect:"+request.getContextPath()+"/party/content?no="+ptyno; 
	 }
	  
	 //댓글 삭제
	 @RequestMapping(value="/delete", method = RequestMethod.POST) 
	 public String delete(HttpServletRequest request,
			 @RequestParam(value="rpno",defaultValue="0") int rpno,
			 @RequestParam(value="no",defaultValue="0")int ptyno) { 		
			int ret= party_replyMapper.deleteReply(rpno);
			return "redirect:"+request.getContextPath()+"/party/content?no="+ptyno;
	}

	 //댓글 수정
	 @RequestMapping(value="/update",method = RequestMethod.POST) 
	 public String update(HttpServletRequest request,Model model,Principal principal,
			 @RequestParam(value="rpno",defaultValue="0")int rpno,
			 @RequestParam(value="no",defaultValue="0")int ptyno,
			 @RequestParam(value="rpcontent",defaultValue="0") String rpcontent){
		 Party_ReplyVO robj = new Party_ReplyVO();
		 robj.setRpcontent(rpcontent);
		 robj.setRpno(rpno);
		 System.out.println(robj.toString());
		 
		 party_replyMapper.updateReply(robj); 
		 return "redirect:"+request.getContextPath()+"/party/content?no="+ptyno; 
	 }          
}
