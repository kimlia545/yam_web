package com.example.vo;

public class PartyVO {
	private String userid = null;
	private long ptyno = 0L;
	private String ptytitle = null;
	private String ptycontent = null;
	private String ptydate = null;
	private byte[] ptyimg = null; //이미지
	private long ptyhit = 1L;
	private long shopno = 0L; //가게번호
	private String shop_name = null; //가게명
	private int partycount = 0; //게시판글번호

	private int likecount = 0; //좋아요 개수
	private int replycount = 0; //댓글 개수
	private String writer = null; //작성자 아이디
	
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public PartyVO() {};
	public PartyVO(String userid, String ptytitle, String ptycontent, long shopno) {
		super();
		this.userid = userid;
		this.ptytitle = ptytitle;
		this.ptycontent = ptycontent;
		this.shopno = shopno;
	}
	
	public PartyVO(String userid, String ptytitle, String ptycontent, long shopno, long ptyno) {
		super();
		this.userid = userid;
		this.ptytitle = ptytitle;
		this.ptycontent = ptycontent;
		this.shopno = shopno;
		this.ptyno = ptyno;
	}
	public long getShopno() {
		return shopno;
	}
	public void setShopno(long shopno) {
		this.shopno = shopno;
	}
	public byte[] getPtyimg() {
		return ptyimg;
	}
	public void setPtyimg(byte[] ptyimg) {
		this.ptyimg = ptyimg;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getPartycount() {
		return partycount;
	}
	public void setPartycount(int partycount) {
		this.partycount = partycount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public long getPtyno() {
		return ptyno;
	}
	public void setPtyno(long ptyno) {
		this.ptyno = ptyno;
	}
	public String getPtytitle() {
		return ptytitle;
	}
	public void setPtytitle(String ptytitle) {
		this.ptytitle = ptytitle;
	}
	public String getPtycontent() {
		return ptycontent;
	}
	public void setPtycontent(String ptycontent) {
		this.ptycontent = ptycontent;
	}
	public String getPtydate() {
		return ptydate;
	}
	public void setPtydate(String ptydate) {
		this.ptydate = ptydate;
	}
	public long getPtyhit() {
		return ptyhit;
	}
	public void setPtyhit(long ptyhit) {
		this.ptyhit = ptyhit;
	}
	@Override
	public String toString() {
		return "PartyVO [userid=" + userid + ", ptyno=" + ptyno + ", ptytitle=" + ptytitle + ", ptycontent="
				+ ptycontent + ", ptydate=" + ptydate + ", ptyhit=" + ptyhit + "]";
	}
	
	
	
}
