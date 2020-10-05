package com.example.vo;

import java.util.Arrays;

public class ReviewVO {
	private long rvno = 0L;
	private String userid = null;
	private long shopno = 0L;
	private long score = 1L;
	private String content = null;
	private String rvdate = null;
	private byte[] rvimg = null;
	private String menu = null;
	
	
	public ReviewVO() {};
	
	public ReviewVO(long shopno, String userid, long score, String content, String menu) {
		super();
		this.shopno = shopno;
		this.userid = userid;
		this.score = score;
		this.content = content;
		this.menu = menu;
	}

	private String shop_name = null;
	
	private int cnt = 0;
	private int cntf = 0;
	private int cntm = 0;

	private float avg = 0;
	private float avgf = 0;
	private float avgm = 0;
	
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
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCntf() {
		return cntf;
	}
	public void setCntf(int cntf) {
		this.cntf = cntf;
	}
	public int getCntm() {
		return cntm;
	}
	public void setCntm(int cntm) {
		this.cntm = cntm;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public float getAvgf() {
		return avgf;
	}
	public void setAvgf(float avgf) {
		this.avgf = avgf;
	}
	public float getAvgm() {
		return avgm;
	}
	public void setAvgm(float avgm) {
		this.avgm = avgm;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [rvno=" + rvno + ", userid=" + userid + ", shopno=" + shopno + ", score=" + score
				+ ", content=" + content + ", rvdate=" + rvdate + ", rvimg=" + Arrays.toString(rvimg) + ", shop_name="
				+ shop_name + ", menu=" + menu + ", cnt=" + cnt + ", cntf=" + cntf + ", cntm=" + cntm + ", avg=" + avg
				+ ", avgf=" + avgf + ", avgm=" + avgm + "]";
	}
}
	
	