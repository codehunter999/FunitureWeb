package com.funi.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.MemberDTO;

import lombok.Data;

@Data
public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void insertData(MemberDTO memberdto) {
		System.out.println(memberdto.getSalt());
		sessionTemplate.insert("funi_memberMapper.insertData", memberdto);
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
		//email = sessionTemplate.selectOne("funi_memberMapper.searchID",hMap);

		int searchIdCheck = sessionTemplate.selectOne("funi_memberMapper.searchID",hMap);
		System.out.println("searchIdCheck : "+searchIdCheck);
		if(searchIdCheck == 0) {
			flag = false;
		}else {
			flag = true;
		}

		return flag;
	}
	
	public int update_pw(MemberDTO memberdto) throws Exception{		
		return sessionTemplate.update("funi_memberMapper.update_pw", memberdto);
	}
	public int delete_member(String email) throws Exception{			
		Map<String,String> hMap = new HashMap<String,String>();
		hMap.put("email",email);
		return sessionTemplate.delete("funi_memberMapper.deleteMember",hMap);
	}
}
