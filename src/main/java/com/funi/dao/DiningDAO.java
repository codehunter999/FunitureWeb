package com.funi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.FurnitureDTO;

public class DiningDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(FurnitureDTO dto) {
		
		sessionTemplate.insert("diningMapper.insertData", dto);
		
	}
	
	public List<FurnitureDTO> getLists(int start,int end,String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);

		List<FurnitureDTO> lists = sessionTemplate.selectList("diningMapper.getLists",params);

		return lists;

	}

	public List<FurnitureDTO> getCateLists(String cateEn,String searchValue,int start,int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("searchValue", searchValue);
		params.put("start", start);
		params.put("end", end);

		List<FurnitureDTO> catelists = sessionTemplate.selectList("diningMapper.getCateLists", params);

		return catelists;

	}
	
	public List<FurnitureDTO> getDetailLists(String cateEn){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);

		List<FurnitureDTO> detailLists = sessionTemplate.selectList("diningMapper.getDetailLists", params);

		return detailLists;
	}
	
	public FurnitureDTO getReadData(int imageIndex,String cateEn){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cateEn", cateEn);

		FurnitureDTO dto = sessionTemplate.selectOne("diningMapper.getReadData", params);

		return dto;

	}
	
	public int getDataCount(String searchValue){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchValue", searchValue);

		int result = sessionTemplate.selectOne("diningMapper.getDataCount",params);

		return result;

	}
	
	public int getCateDataCount(String cateEn,String searchValue){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("searchValue", searchValue);

		int result = sessionTemplate.selectOne("diningMapper.getCateDataCount",params);

		return result;

	}
	
	public FurnitureDTO getReadAllData(int imageIndex,String cateEn) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cateEn", cateEn);
		
		FurnitureDTO dto = sessionTemplate.selectOne("diningMapper.getReadAllData",params);
		
		return dto;
	}
	
	public List<FurnitureDTO> getAllData(){
		
		List<FurnitureDTO> allLists = sessionTemplate.selectList("diningMapper.getAllData");
		
		return allLists;
	}

}
