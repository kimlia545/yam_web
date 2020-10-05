package com.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import com.example.vo.PartyLikeVO;
import com.example.vo.PartyVO;
@Transactional
public interface PartyLikeMapper {
	//USERID, PTYNO, LIKECHK, LIKENO

    //좋아요
	@Update({"<script>","MERGE INTO \r\n" + 
    		"    PARTYLIKE\r\n" + 
    		"USING DUAL \r\n" + 
    		"    ON (PTYNO = #{lobj.ptyno} AND USERID = #{lobj.userid})\r\n" + 
    		"    WHEN MATCHED THEN     \r\n" + 
    		"        UPDATE SET     \r\n" + 
    		"                LIKECHK = #{lobj.likechk}\r\n" + 
    		"        \r\n" + 
    		"    WHEN NOT MATCHED THEN\r\n" + 
    		"        INSERT (PTYNO, USERID, LIKECHK)\r\n" + 
    		"        VALUES (#{lobj.ptyno},#{lobj.userid},#{lobj.likechk})","</script>"})
    public int insertlike(@Param("lobj")PartyLikeVO lobj);
    	
	//좋아요 갯수
	@Select("SELECT COUNT(LIKECHK) FROM PARTYLIKE WHERE PTYNO = #{ptyno}")
	public int countlike(@Param("ptyno")int ptyno);
	
	
	 //좋아요 가져오기
	 @Select({ "<script>","SELECT LIKECHK FROM PARTYLIKE WHERE PTYNO = #{lobj.ptyno} AND USERID = #{lobj.writer}","</script>"}) 
	 public Integer selectlike(@Param("lobj")PartyVO lobj);
	
	

}
