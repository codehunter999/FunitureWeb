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
	
	public List<FurnitureDTO> getLists(){


		List<FurnitureDTO> lists = sessionTemplate.selectList("decoMapper.getLists");

		return lists;

	}

	public List<FurnitureDTO> getCateLists(HashMap<String, Object> diningmap){


		List<FurnitureDTO> catelists = sessionTemplate.selectList("decoMapper.getCateLists", diningmap);

		return catelists;

	}
	
	public FurnitureDTO getReadData(int imageIndex,String cate){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cate", cate);

		FurnitureDTO dto = sessionTemplate.selectOne("decoMapper.getReadData", params);

		return dto;

	}
	
	public int getDataCount(){

		HashMap<String, Object> params = new HashMap<String, Object>();

		int result = sessionTemplate.selectOne("diningMapper.getDataCount",params);

		return result;

	}

}
