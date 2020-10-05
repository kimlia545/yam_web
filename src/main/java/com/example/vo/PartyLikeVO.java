package com.example.vo;

public class PartyLikeVO {
	//USERID, PTYNO, LIKECHK, LIKENO
	private String userid = null;
	private long ptyno = 0L;
	private int likechk = 0;

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
	public int getLikechk() {
		return likechk;
	}
	public void setLikechk(int likechk) {
		this.likechk = likechk;
	}
	
	@Override
	public String toString() {
		return "PartyLikeVO [userid=" + userid + ", ptyno=" + ptyno + ", likechk=" + likechk + "]";
	}
	
	
}
