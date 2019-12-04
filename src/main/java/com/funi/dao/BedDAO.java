package com.funi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.FurnitureDTO;

public class BedDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//bed*************

	//카테고리 리스트
	public List<FurnitureDTO> cateEImageList(HashMap<String,Object> bedMap){
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("bedMapper.CateimageList",bedMap);
		
		return Lists;
	}
	
	//카테고리 검색&페이지
	public List<FurnitureDTO> cateSImageList(String cateEn, int start, int end, String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("bedMapper.CateSimageList",params);
		
		return Lists;
	}
	
	//침실 전체 리스트
	public List<FurnitureDTO> bedImageList(int start, int end, String searchValue) {
		//검색
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		
		List<FurnitureDTO> bLists = sessionTemplate.selectList("bedMapper.bedimageList", params);
		
		return bLists;
	}
	
	//total 검색&페이지
	public int getDataCount(String searchValue) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchValue", searchValue);
		
		//mapper 사용문
		int result = sessionTemplate.selectOne("bedMapper.getDataCount", params);
		
		return result;
		
	}
	//카테고리별 검색&페이지
	public int getCateDataCount(String cateEn, String searchValue) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("searchValue", searchValue);
		
		//mapper 사용문
		int result = sessionTemplate.selectOne("bedMapper.getCateDataCount", params);
		
		return result;
		
	}
	
	//침실 이미지 인서트
	public void insertBedData(FurnitureDTO dto) {
		sessionTemplate.insert("bedMapper.insertData", dto);
	}
	
	
	//디테일부분
	public FurnitureDTO getReadData(int imageIndex, String cateEn) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cateEn", cateEn);
		
		
		FurnitureDTO dto = sessionTemplate.selectOne("bedMapper.getReadData",params);
			
			System.out.println(dto.getImageIndex());
			System.out.println(dto.getSaveFileName());
			
			return dto;
		}
	

}
