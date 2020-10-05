
package com.example.rest_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.mapper.ShopMapper;
import com.example.vo.ShopVO;
import com.example.vo.ReviewVO;

@RestController

@CrossOrigin("*")
public class RestShopController {

	@Autowired
	ShopMapper shopMapper = null;

	// 127.0.0.1:8080/rest/insertshop.json
	@RequestMapping(value = "rest/insertshop.json", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> insertshop(@RequestParam("map_id") String id,
			@RequestParam("shop_name") String name, @RequestParam("shop_adr") String adr,
			@RequestParam("shop_tel") String tel, @RequestParam("shop_dep") String dep, @RequestParam("y") String x,
			@RequestParam("x") String y) {

		ShopVO shopvo = new ShopVO(id, name, adr, tel, dep, x, y);

		System.out.println(shopvo);
		shopMapper.insertShop(shopvo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ret", 0);
		return map;
	}
	
	//127.0.0.1:8080/rest/shoptop5.json ?id=adfd
	@RequestMapping(value = "/rest/shoptop5.json", 
				method = { RequestMethod.GET, RequestMethod.POST }, 
				produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> shopTop(){
						
		List<ShopVO> top5list = shopMapper.selecttop5();	
	
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("data", top5list);
			
		return map;
}
	/*
	 * // 127.0.0.1:8080/rest/insertreview.json
	 * 
	 * @RequestMapping(value = "rest/insertreview.json", method = {
	 * RequestMethod.GET, RequestMethod.POST }, produces =
	 * MediaType.APPLICATION_JSON_VALUE) public @ResponseBody Map<String, Object>
	 * insertreview(
	 * 
	 * @RequestParam("map_id") String id,
	 * 
	 * @RequestParam("shop_name") String name,
	 * 
	 * @RequestParam("shop_adr") String adr,
	 * 
	 * @RequestParam("shop_tel") String tel,
	 * 
	 * @RequestParam("shop_dep") String dep,
	 * 
	 * @RequestParam("y") String x,
	 * 
	 * @RequestParam("x") String y) {
	 * 
	 * 
	 * ReviewVO reviewvo = new ReviewVO(id, name, adr, tel, dep, x, y);
	 * 
	 * System.out.println(reviewvo); shopMapper.insertReview(reviewvo);
	 * 
	 * int ret = pDAO.selectMemberId(id); HashMap<String, Object> map = new
	 * HashMap<String, Object>(); map.put("ret", 0); if (ret > 0) map.put("ret", 1);
	 * 
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("ret",
	 * 0); return map; }
	 */

}
