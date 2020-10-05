package com.example.mapper; 

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.vo.ReviewVO; 

  

public interface Review1Mapper { 
//SELECT *
//FROM 
//	    (SELECT 
//	        REVIEW.RVNO, REVIEW.CONTENT, REVIEW.SHOPNO, REVIEW.SCORE, REVIEW.USERID, REVIEW.RVDATE, REVIEW.MENU, SHOP.SHOP_NO, SHOP.SHOP_NAME 
//	    FROM 
//	        REVIEW, SHOP 
//	    WHERE 
//	        REVIEW.SHOPNO = SHOP.SHOP_NO) RSJ
//WHERE RSJ.RVNO=1
    @Select("SELECT * "
    		+ "FROM (SELECT REVIEW.RVNO, REVIEW.CONTENT, REVIEW.SHOPNO, REVIEW.SCORE, REVIEW.USERID, REVIEW.RVDATE, REVIEW.MENU, "
    		+ "SHOP.SHOP_NO, SHOP.SHOP_NAME "
    		+ "FROM REVIEW, SHOP WHERE REVIEW.SHOPNO = SHOP.SHOP_NO) RSJ "
    		+ "WHERE RSJ.RVNO=#{rvno}") 
    public ReviewVO selectReviewOne(@Param("rvno") int rvno);  
    
    @Select("SELECT NVL(MAX(RVNO),0) FROM REVIEW WHERE RVNO < #{rvno}")
	public int selectBoardPrev(int rvno);
    
    @Select("SELECT NVL(MIN(RVNO),0) FROM REVIEW WHERE RVNO > #{rvno}")
	public int selectBoardNext(int rvno);

    @Select("SELECT RVNO, RVIMG FROM REVIEW " + 
    		"WHERE RVNO = #{no}")
    public ReviewVO selectReviewImg(@Param("no") int no);
    
    @Select("SELECT * FROM REVIEW WHERE USERID = #{userid} ORDER BY RVDATE DESC")
    public List<ReviewVO> selectByUserid(@Param("userid") String userid);
    
    @Insert("INSERT INTO REVIEW(RVNO, USERID, SHOPNO, SCORE, CONTENT, RVDATE, RVIMG, MENU) VALUES"+ 
     "(SEQ_REVIEW_NO.NEXTVAL, #{obj.userid}, #{obj.shopno}, #{obj.score}, #{obj.content}, SYSDATE, #{obj.rvimg, jdbcType=BLOB}, #{obj.menu})") 
     public int insertReview(@Param("obj") ReviewVO obj );
    
	@Delete("DELETE FROM REVIEW WHERE RVNO = #{obj.rvno}")
	public int deleteReview(@Param("obj") ReviewVO obj );
	
//UPDATE 
//    REVIEW 
//SET 
//    SCORE = #{score}, CONTENT = #{content}
//    <if test="rvimg != null">
//        ,RVIMG=#{rvimg, jdbcType=BLOB}
//    </if>
//WHERE
//    RVNO = #{rvno}
	@Update("<script>UPDATE REVIEW SET SCORE = #{obj.score}, CONTENT = #{obj.content}, MENU = #{obj.menu} "
			+ "<if test='obj.rvimg != null'> ,RVIMG = #{obj.rvimg, jdbcType=BLOB} </if> WHERE RVNO = #{obj.rvno}</script>")
	public int updateReview(@Param("obj") ReviewVO obj );
} 
