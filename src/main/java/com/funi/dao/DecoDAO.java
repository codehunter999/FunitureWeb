package com.funi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.FurnitureDTO;

public class DecoDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(FurnitureDTO dto) {
		
		sessionTemplate.insert("decoMapper.insertData", dto);
		
	}
	
	public List<FurnitureDTO> getLists(int start,int end,String searchValue){


		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);

		List<FurnitureDTO> lists = sessionTemplate.selectList("decoMapper.getLists",params);

		return lists;

	}

	public List<FurnitureDTO> getCateLists(String cate){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cate", cate);

		List<FurnitureDTO> catelists = sessionTemplate.selectList("decoMapper.getCateLists", params);

		return catelists;

	}
	
	public FurnitureDTO getReadData(int imageIndex,String cate){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cate", cate);

		FurnitureDTO dto = sessionTemplate.selectOne("decoMapper.getReadData", params);

		return dto;

	}
	
	public int getDataCount(String searchValue){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchValue", searchValue);

		int result = sessionTemplate.selectOne("decoMapper.getDataCount",params);

		return result;

	}

}
