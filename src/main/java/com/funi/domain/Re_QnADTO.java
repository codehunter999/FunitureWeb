package com.funi.domain;

public class Re_QnADTO {
	int id;
	String name;
	String content;
	String ipaddr;
	String created_at;
	int qaboard_id;
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
	public int getQaboard_id() {
		return qaboard_id;
	}
	public void setQaboard_id(int qaboard_id) {
		this.qaboard_id = qaboard_id;
	}
}
