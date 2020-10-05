package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.vo.PartyVO;
import com.example.vo.ReviewVO;
import com.example.vo.ShopVO;

public interface ShopMapper {

		
		@Insert({"INSERT INTO SHOP(SHOP_NO, SHOP_NAME, SHOP_ADR, SHOP_TEL, MAP_ID, SHOP_DEP, X, Y) VALUES", 
				"(SEQ_SHOP_NO.NEXTVAL, #{sobj.shop_name}, #{sobj.shop_adr}, #{sobj.shop_tel}, #{sobj.map_id}, #{sobj.shop_dep}, #{sobj.x}, #{sobj.y})"})
		public int insertShop(@Param("sobj") ShopVO obj);
		
		@Select({"SELECT * "
					+ "FROM (SELECT t1.*, ROW_NUMBER() OVER (ORDER BY SHOP_NO DESC) ROWN "
					+ "FROM (SELECT DISTINCT SHOP.*, AVG(REVIEW.SCORE) OVER (PARTITION BY REVIEW.SHOPNO) STAR FROM SHOP, REVIEW "
					+ "WHERE REVIEW.SHOPNO (+) = SHOP.SHOP_NO AND SHOP.SHOP_NAME LIKE '%' || #{map.text} || '%' "
					+ "ORDER BY STAR DESC) t1) "  
					+"WHERE ROWN BETWEEN #{map.start} AND #{map.end}"})			 
		public List<ShopVO> selectShopList(@Param("map") HashMap<String,Object> map);
		
		@Select("SELECT * FROM " +
				"(SELECT RANK() OVER (ORDER BY S1.STAR DESC) TOP, S1.* " + 
				"FROM (" + 
				"    SELECT DISTINCT SHOP.*, REVIEW.SHOPNO, AVG(REVIEW.SCORE) OVER (PARTITION BY REVIEW.SHOPNO) STAR " + 
				"    FROM REVIEW, SHOP " + 
				"    WHERE REVIEW.SHOPNO = SHOP.SHOP_NO " + 
				"    )S1 ) " +
				"WHERE TOP <= 5")
		public List<ShopVO> selecttop5();
		
		//content 에 사용할 것
		@Select("SELECT DISTINCT SHOP.*, AVG(REVIEW.SCORE) OVER (PARTITION BY REVIEW.SHOPNO) STAR FROM SHOP, REVIEW "
				+ "WHERE REVIEW.SHOPNO (+) = SHOP.SHOP_NO AND SHOP_NO=#{no}") 
		public ShopVO selectOneShop(@Param("no")long no);
		//content 리뷰
				@Select("SELECT SHOP.*, REVIEW.* FROM SHOP, REVIEW "
						+ "WHERE REVIEW.SHOPNO = SHOP.SHOP_NO AND SHOP_NO=#{no}"
						+ "ORDER BY REVIEW.RVNO DESC") 
				public List<ShopVO> selectShopReview(@Param("no")long no);
		
		//이미지
		@Select("SELECT SHOPNO, RVIMG FROM REVIEW WHERE SHOPNO = #{no}")
		public ShopVO selectShopImg(int no);
		 
		@Select("SELECT COUNT(*) FROM SHOP WHERE MAP_ID=#{mid}")
		public int selectMapId(@Param("mid") String mid);
		
		@Select("SELECT SHOP_NO FROM SHOP WHERE MAP_ID=#{mid}")
		public long selectShopNo(@Param("mid") String mid);
		
		@Select("SELECT * FROM SHOP WHERE SHOP_NO=#{no}")
		public ShopVO selectShopOne(@Param("no") long no);
		
		//페이지 목록
		@Select("SELECT COUNT(*) FROM SHOP WHERE SHOP_NAME LIKE '%' || #{text} || '%'")
		public int countShop(@Param("text") String text);
				 
		
		//이전글
		@Select("SELECT NVL(MAX(SHOP_NO),0) FROM SHOP WHERE SHOP_NO < #{shopno}")
		public int selectShopPrev(@Param("shopno") int no);
		
		//다음글
		@Select("SELECT NVL(MIN(SHOP_NO),0) FROM SHOP WHERE SHOP_NO > #{shopno}")
		public int selectShopNext(@Param("shopno") int no);

	
	/* { "<script>", "SELECT COUNT(*) FROM SHOP MAP_ID=#{mid}", "</script>" })
	 */
	/*
	 * @Delete("DELETE FROM SHOP WHERE SHOP_NO =#{obj.shop_no}") public int
	 * deleteShop(@Param("obj") ShopVO obj);
	 * 
	 
	 
	 * @Update
	 */

}





	
