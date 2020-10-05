package com.example.vo;

public class Party_ReplyVO {
	//PTYNO, RPNO, USERID, RPCONTENT, RPDATE
	private long ptyno = 0L;
	private long rpno = 0L;
	private String userid = null;
	private String rpcontent = null;
	private String rpdate = null;
	private int rpcount = 0; //댓글번호
	
	
	
	public int getRpcount() {
		return rpcount;
	}
	public void setRpcount(int rpcount) {
		this.rpcount = rpcount;
	}
	public long getPtyno() {
		return ptyno;
	}
	public void setPtyno(long ptyno) {
		this.ptyno = ptyno;
	}
	public long getRpno() {
		return rpno;
	}
	public void setRpno(long rpno) {
		this.rpno = rpno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRpcontent() {
		return rpcontent;
	}
	public void setRpcontent(String rpcontent) {
		this.rpcontent = rpcontent;
	}
	public String getRpdate() {
		return rpdate;
	}
	public void setRpdate(String rpdate) {
		this.rpdate = rpdate;
	}
	@Override
	public String toString() {
		return "Party_ReplyVO [ptyno=" + ptyno + ", rpno=" + rpno + ", userid=" + userid + ", rpcontent=" + rpcontent
				+ ", rpdate=" + rpdate + "]";
	}
	
	

}
