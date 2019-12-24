package com.funi.dao;

import com.funi.domain.MemberDTO;

public interface EmailDAOImpl {
	 void insertUser(MemberDTO memberdto) throws Exception;
	 MemberDTO authenticate(String str) throws Exception;
	 void createAuthKey(String memberEmail,String memberAuthKey) throws Exception;
	 MemberDTO chkAuth(MemberDTO memberdto) throws Exception;
	 void userAuth(MemberDTO memberdto) throws Exception; 
}
