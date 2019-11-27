package com.funi.domain;

public class ReviewDTO {
	/*
	 * id number(10) not null, name varchar2(20), subject varchar2(100), content
	 * varchar2(1000), ipaddr varchar2(20), created_at varchar2(20), photo
	 * varchar2(100)
	 */
	int id;
	String name;
	String subject;
	String content;
	String ipaddr;
	String created_at;
	String photo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
