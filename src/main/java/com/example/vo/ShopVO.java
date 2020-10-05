package com.example.vo;

public class ShopVO {
	
	private long shop_no = 0L;
	private String map_id = null;	
	private String shop_name = null;
	private String shop_adr = null;
	private String shop_tel = null;
	private String shop_dep = null;
	private String x = null;
	private long rvno = 0L;
	private String userid = null;
	private long shopno = 0L;
	private long score = 1L;
	private String content = null;
	private String rvdate = null;
	private byte[] rvimg = null;
	private String menu = null;
	
	private int star = 0;
	private int top = 0;
	
	
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public long getRvno() {
		return rvno;
	}
	public void setRvno(long rvno) {
		this.rvno = rvno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public long getShopno() {
		return shopno;
	}
	public void setShopno(long shopno) {
		this.shopno = shopno;
	}
	public long getScore() {
		return score;
	}
	public void setScore(long score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	public byte[] getRvimg() {
		return rvimg;
	}
	public void setRvimg(byte[] rvimg) {
		this.rvimg = rvimg;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public ShopVO() {};
	public ShopVO(String map_id, String shop_name, String shop_adr, String shop_tel, String shop_dep, String x,
			String y) {
		super();
		this.map_id = map_id;
		this.shop_name = shop_name;
		this.shop_adr = shop_adr;
		this.shop_tel = shop_tel;
		this.shop_dep = shop_dep;
		this.x = x;
		this.y = y;
	}
	private String y = null;
	
	public long getShop_no() {
		return shop_no;
	}
	public void setShop_no(long shop_no) {
		this.shop_no = shop_no;
	}
	public String getMap_id() {
		return map_id;
	}
	public void setMap_id(String map_id) {
		this.map_id = map_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_adr() {
		return shop_adr;
	}
	public void setShop_adr(String shop_adr) {
		this.shop_adr = shop_adr;
	}
	public String getShop_tel() {
		return shop_tel;
	}
	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}
	public String getShop_dep() {
		return shop_dep;
	}
	public void setShop_dep(String shop_dep) {
		this.shop_dep = shop_dep;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "ShopVO [shop_no=" + shop_no + ", map_id=" + map_id + ", shop_name=" + shop_name + ", shop_adr="
				+ shop_adr + ", shop_tel=" + shop_tel + ", shop_dep=" + shop_dep + ", x=" + x + ", y=" + y
				+ "]";
	}
	


}
