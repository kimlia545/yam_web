package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import com.example.vo.PartyVO;
import com.example.vo.ReviewVO;

@Transactional
public interface PartyMapper {
	/*USERID, PTYNO, PTYTITLE, PTYCONTENT, PTYDATE*/
	
	//글 쓰기 
	 @Insert({"INSERT INTO PARTY(USERID, PTYNO, PTYTITLE, PTYCONTENT, PTYDATE, PTYIMG, PTYHIT, SHOPNO) VALUES",
	 "(#{obj.userid},MY_GET_SEQ_NUMBER, #{obj.ptytitle}, #{obj.ptycontent},SYSDATE,#{obj.ptyimg, jdbcType=BLOB}, #{obj.ptyhit}, #{obj.shopno})"})
	 public int insertPARTY(@Param("obj") PartyVO obj);
	 
	 //글 삭제
	 @Delete("DELETE FROM PARTY WHERE PTYNO = #{ptyno}")
	 public int deleteParty(@Param("ptyno")int ptyno);

	 //글 수정
	 @Update("<script>UPDATE PARTY SET PTYTITLE=#{obj.ptytitle}, PTYCONTENT=#{obj.ptycontent}, SHOPNO=#{obj.shopno}"
	 		+ "<if test=\"obj.ptyimg != null\"> ,PTYIMG= #{obj.ptyimg, jdbcType=BLOB}  </if>WHERE PTYNO = #{obj.ptyno}</script>")
	 public int updateParty(@Param("obj") PartyVO obj);
	 
	 //글 읽기
	 @Select("SELECT PARTY.*, SHOP.SHOP_NAME, SHOP.SHOP_NO FROM "
	 		+ "(SELECT * FROM PARTY WHERE PTYNO=#{ptyno}) PARTY, SHOP "
	 		+ "WHERE PARTY.SHOPNO = SHOP.SHOP_NO")
	 public PartyVO selectPartyOne(@Param("ptyno") int ptyno);
	 
	 //페이지 목록
	 @Select("SELECT COUNT(*) FROM PARTY WHERE PTYTITLE LIKE '%' || #{text} || '%'")
	 public int countParty(@Param("text") String text);
	 
	 //글 검색
	 @Select({"SELECT * FROM(SELECT PTYNO,PTYTITLE,USERID,PTYHIT,PTYDATE,",
		 "ROW_NUMBER() OVER (ORDER BY PTYNO DESC) ROWN FROM PARTY WHERE PTYTITLE LIKE '%' || #{map.text} || '%')",
		 "WHERE ROWN BETWEEN #{map.start} AND #{map.end}"}) 
	 public List<PartyVO> searchParty(@Param("map") HashMap<String,Object> map);
			 
	 //조회수 
	 @Update("UPDATE PARTY SET PTYHIT = PTYHIT + 1 WHERE PTYNO = #{ptyno}")
	 public int updateHit(@Param("ptyno") int ptyno);
	 
	 //이전글
	 @Select("SELECT NVL(MAX(PTYNO),0) FROM PARTY WHERE PTYNO < #{ptyno}")
	 public int selectPartyPrev(@Param("ptyno") int ptyno);
	 
	 //다음글
	 @Select("SELECT NVL(MIN(PTYNO),0) FROM PARTY WHERE PTYNO > #{ptyno}")
	 public int selectPartyNext(@Param("ptyno") int ptyno);
	 
	 //아이디로 검색
	 @Select("SELECT * FROM PARTY WHERE USERID = #{userid} ORDER BY PTYDATE DESC")
	 public List<PartyVO> selectByUserid(@Param("userid") String userid);
	 
	 //이미지
	 @Select("SELECT PTYNO, PTYIMG FROM PARTY WHERE PTYNO = #{ptyno}")
	 public PartyVO selectPartyImg(int no);
	 
}
	 
