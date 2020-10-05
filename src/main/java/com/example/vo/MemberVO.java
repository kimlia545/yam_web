package com.example.vo;

public class MemberVO {
	private String userid = null;
	private String password = null;
	private char gender = ' ';
	private String birth = null;
	private String phone =  null;
	private String joindate = null;
	private String username = null;
	private	String role = null;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", gender=" + gender + ", birth=" + birth
				+ ", phone=" + phone + ", joindate=" + joindate + ", username=" + username + ", role=" + role + "]";
	}
	
}
