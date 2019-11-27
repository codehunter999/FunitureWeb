package com.funi.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class CartDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	
	

}
