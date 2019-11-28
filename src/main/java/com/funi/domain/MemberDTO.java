package com.funi.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {

	private String email;
	private String pwd; 
	private String name; 
	private String phone;
	private String salt;
	private String addr1;
	private String addr2;
	private String addr3;
	
	
}
