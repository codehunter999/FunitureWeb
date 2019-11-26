package com.funi.dao;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.MemberDTO;

import lombok.Data;

@Data
public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;


	public void insertData(MemberDTO dto) {
		sessionTemplate.insert("funi_memberMapper.insertData", dto);
	}	
	public MemberDTO searchMember(String email) {
		//sessionTemplate.insert("funi_memberMapper.insertData", dto);
		HashMap<String,String> hMap = new HashMap<String,String>();
		hMap.put("email",email);	
		MemberDTO memberdto = sessionTemplate.selectOne("funi_memberMapper.searchMember",hMap);
		return memberdto;
	}
	
	public Boolean searchID(String email) {
		//sessionTemplate.insert("funi_memberMapper.insertData", dto);
		boolean flag = false;
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		hMap.put("email",email);	
		email = sessionTemplate.selectOne("funi_memberMapper.searchID",hMap);
		
		if(email == null || email.equals("")) {
			flag = false;
		}else {
			flag = true;
		}
		
		return flag;
	}
}
