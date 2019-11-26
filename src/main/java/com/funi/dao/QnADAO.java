package com.funi.dao;

import org.springframework.stereotype.Component;

import com.funi.dto.QnADTO;
import com.funi.dto.Re_QnADTO;
import com.funi.dto.Re_ReviewDTO;
import com.funi.dto.ReviewDTO;

import java.sql.SQLSyntaxErrorException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Component("QnADAO")
public class QnADAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)throws Exception{
		this.sessionTemplate=sessionTemplate;
	}
	public int getMAXID() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("QnAMapper.maxNum");
		
		return maxNum;
	}
	public int getDataCount() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("QnAMapper.getDataCount");
		
		return maxNum;
	}
	public void insertData(QnADTO dto){
		
		sessionTemplate.insert("QnAMapper.insertData",dto);
	}
	public List<QnADTO> getList(int start, int end){
		
		HashMap<String, Object> params=new HashMap<String, Object>();
		params.put("start",start);
		params.put("end",end);
		List<QnADTO> lists=sessionTemplate.selectList("QnAMapper.getLists",params);
		return lists;
		
	}
	public QnADTO getReadData(int id) {
		QnADTO dto=sessionTemplate.selectOne("QnAMapper.getReadData",id);
		return dto;
	}
	public void deleteData(int id) {
		sessionTemplate.delete("QnAMapper.deleteData",id);
		sessionTemplate.delete("QnAMapper.re_deleteData",id);
	}
	public void updateData(QnADTO dto) {
		sessionTemplate.update("QnAMapper.updateData", dto);
	}
	
	public int getRe_MAXID() {
		int maxNum=0;
		maxNum=sessionTemplate.selectOne("QnAMapper.re_maxNum");
		
		return maxNum;
	}
	public void Re_insertData(Re_QnADTO dto){
		
		sessionTemplate.insert("QnAMapper.re_insertData",dto);
	}
	public List<Re_QnADTO> Re_getList(int qaboard_id){
		
		List<Re_QnADTO> lists=sessionTemplate.selectList("QnAMapper.re_getLists",qaboard_id);
		return lists;
		
	}
}
