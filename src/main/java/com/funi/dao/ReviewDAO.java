package com.funi.dao;

import org.springframework.stereotype.Component;

import com.funi.domain.Re_ReviewDTO;
import com.funi.domain.ReviewDTO;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Component("ReviewDAO")
public class ReviewDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)throws Exception{
		this.sessionTemplate=sessionTemplate;
	}
	
	
	public int getMAXID() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("ReviewMapper.maxNum");
		
		return maxNum;
	}
	
	
	public int getDataCount() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("ReviewMapper.getDataCount");
		
		return maxNum;
	}
	
	
	public void insertData(ReviewDTO dto){
		
		sessionTemplate.insert("ReviewMapper.insertData",dto);
	}
	
	
	public List<ReviewDTO> getList(int start, int end){
		HashMap<String, Object> params=new HashMap<String, Object>();
		params.put("start",start);
		params.put("end",end);
		List<ReviewDTO> lists=sessionTemplate.selectList("ReviewMapper.getLists",params);
		return lists;
	}
	
	
	
	public ReviewDTO getReadData(int id) {
		ReviewDTO dto=sessionTemplate.selectOne("ReviewMapper.getReadData",id);
		return dto;
	}
	
	
	public void deleteData(int id) {
		sessionTemplate.delete("ReviewMapper.deleteData",id);
		sessionTemplate.delete("ReviewMapper.re_deleteData",id);
	}
	
	
	public void updateData(ReviewDTO dto) {
		sessionTemplate.update("ReviewMapper.updateData", dto);
	}
	
	public int getRe_MAXID() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("ReviewMapper.re_maxNum");
		
		return maxNum;
	}
	
	
	public void Re_insertData(Re_ReviewDTO dto){
		sessionTemplate.insert("ReviewMapper.re_insertData",dto);
	}

	
	public List<Re_ReviewDTO> Re_getList(int qaboard_id){
		List<Re_ReviewDTO> lists=sessionTemplate.selectList("ReviewMapper.re_getLists",qaboard_id);
		return lists;
	}
}
