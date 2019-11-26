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
		HashMap<String,String> hMap = new HashMap();
		hMap.put("email",email);	
		MemberDTO memberdto = sessionTemplate.selectOne("funi_memberMapper.searchMember",hMap);
		return memberdto;
	}
}
