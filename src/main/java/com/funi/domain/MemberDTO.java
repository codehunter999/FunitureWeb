package com.funi.domain;

public class MemberDTO {

	private String email;
	private String pwd; 
	private String name; 
	private String phone;
	private String salt;
	private String addr1;
	private String addr2;
	private String addr3;
	private String authKey;
	private int enableEmail;
	
	public int getEnableEmail() {
		return enableEmail;
	}
	public void setEnableEmail(int enableEmail) {
		this.enableEmail = enableEmail;
	}
	public String getAuthKey() {return authKey;}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	
}
