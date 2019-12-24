package com.funi.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.MemberDTO;
import com.funi.service.EmailImpl;




public class MemberDAO implements EmailDAOImpl{
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}

	public void insertData(MemberDTO memberdto) {
		sessionTemplate.insert("funi_memberMapper.insertData",memberdto);
	}
	public void SuccessAuth(MemberDTO memberdto) {
		sessionTemplate.insert("funi_memberMapper.emailSuccess",memberdto);
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
	public void update_myinfo(MemberDTO memberdto) throws Exception{
		
		sessionTemplate.update("funi_memberMapper.update_myInfo",memberdto);
	
	}

	@Override
	public void insertUser(MemberDTO memberdto) throws Exception {
		sessionTemplate.insert("funi_memberMapper.insertData",memberdto);
		System.out.println("회원 등록 완료 !! ");
	}
	
	//mail overlap
	@Override
	public MemberDTO authenticate(String str) throws Exception {	
		return sessionTemplate.selectOne("funi_memberMapper.",str);
	}

	@Override
	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception {
		MemberDTO memberdto = new MemberDTO();
		memberdto.setEmail(memberEmail);
		memberdto.setAuthKey(memberAuthKey);
		sessionTemplate.update("funi_memberMapper",memberdto);
	}

	@Override
	public MemberDTO chkAuth(MemberDTO memberdto) throws Exception {
		return sessionTemplate.selectOne("funi_memberMapper",memberdto);
	}

	@Override
	public void userAuth(MemberDTO memberdto) throws Exception {
		
		System.out.println("인증하나요 ?? ");
		sessionTemplate.update("funi_memberMapper",memberdto);
		
	}

	
}
