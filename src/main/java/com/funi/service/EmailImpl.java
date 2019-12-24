package com.funi.service;

import com.funi.domain.MemberDTO;

public interface EmailImpl {
	
	void regist(MemberDTO memberdto) throws Exception;
	MemberDTO userAuth(MemberDTO memberdto) throws Exception;
	void searchPwdMail(MemberDTO memberdto) throws Exception;
}
