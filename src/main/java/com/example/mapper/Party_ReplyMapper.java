package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.vo.Party_ReplyVO;

public interface Party_ReplyMapper {
	//PARTY_REPLY  PTYNO, RPNO, USERID, RPCONTENT, RPDATE
	
	//댓글 쓰기
	@Insert({"INSERT INTO PARTY_REPLY(PTYNO, RPNO, USERID, RPCONTENT, RPDATE)",
		"VALUES (#{robj.ptyno},MY_GET_REPLY_NUMBER,#{robj.userid},#{robj.rpcontent},SYSDATE)"})
	public int insertReply(@Param("robj") Party_ReplyVO robj);
	
	//댓글 삭제
	@Delete("DELETE FROM PARTY_REPLY WHERE RPNO = #{rpno}")
	public int deleteReply(@Param("rpno")int rpno);
	
	//댓글 수정
	@Update("UPDATE PARTY_REPLY SET RPCONTENT=#{robj.rpcontent} WHERE RPNO = #{robj.rpno}")
	public int updateReply(@Param("robj")Party_ReplyVO robj);
	
	//댓글 목록
	@Select("SELECT * FROM PARTY_REPLY WHERE PTYNO = #{ptyno}")
	public List<Party_ReplyVO> selectReply(@Param("ptyno")int ptyno);
	
	//댓글 선택
	@Select({"SELECT * FROM PARTY_REPLY WHERE RPNO=#{rpno}"}) 
	public Party_ReplyVO selectReplyOne(@Param("rpno") int rpno);
	
	//댓글 갯수
	@Select("SELECT COUNT(RPNO) FROM PARTY_REPLY WHERE PTYNO = #{ptyno}")
	public int countReply (@Param("ptyno")int ptyno);
	

}
