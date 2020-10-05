package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.vo.MemberVO;

public interface MemberMapper {
	
	@Insert("INSERT INTO MEMBER VALUES( #{obj.userid}, #{obj.password}, #{obj.gender}, "
			+ "#{obj.birth}, #{obj.phone}, SYSDATE, #{obj.username}, #{obj.role})")
	public int insertMember(@Param("obj") MemberVO obj);
	
	@Select("SELECT * FROM MEMBER WHERE ROLE IS NOT NULL ORDER BY JOINDATE DESC")
	public List<MemberVO> selectMemberLIst();
	
	@Select("SELECT * FROM MEMBER WHERE USERID=#{userid}")
	public MemberVO findByUserId(@Param("userid") String userid);
	
	@Select("SELECT COUNT(*) FROM MEMBER WHERE USERID = #{userid}")
	public int idChk(@Param("userid") String userid);
	
	@Update("UPDATE MEMBER SET PASSWORD=#{obj.password}, GENDER=#{obj.gender}, BIRTH=#{obj.birth}, "
			+ "PHONE=#{obj.phone}, USERNAME=#{obj.username} "
			+ "WHERE USERID=#{obj.userid}")
	public void updateMember(@Param("obj") MemberVO obj);
	
	@Update("<script>"
			+ "UPDATE MEMBER SET USERID='deleted'||SEQ_DELID_NO.NEXTVAL, ROLE=NULL "
			+ "WHERE USERID IN("
			+ "<foreach collection=\"userids\" item=\"tmp\" separator=\",\">"
			+ "#{tmp}"
			+ "</foreach>"
			+ ")"
			+ "</script>")
	public void deleteMemberBatch(@Param("userids") String[] userids);
}
