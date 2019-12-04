package com.funi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.FurnitureDTO;

public class LivingDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//living*************
	
	//카테고리 리스트
	public List<FurnitureDTO> cateEImageList(HashMap<String,Object> livingMap) {
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.CateimageList", livingMap);
		
		return Lists;
	}
	
	//카테고리 검색&페이지
	public List<FurnitureDTO> cateSImageList(String cateEn, int start, int end, String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.CateSimageList",params);
		
		return Lists;
	}
	
	//페이징 처리 위한 부분
	public int getDataCount(String searchValue) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchValue", searchValue);
		
		//mapper 사용문
		int result = sessionTemplate.selectOne("livingMapper.getDataCount", params);
		
		return result;
		
		
	}
	
	//카테고리별 검색&페이지
	public int getCateDataCount(String cateEn, String searchValue) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cateEn", cateEn);
		params.put("searchValue", searchValue);
		
		//mapper 사용문
		int result = sessionTemplate.selectOne("livingMapper.getCateDataCount", params);
		
		return result;
		
	}
	
	//거실 전체 리스트
	public List<FurnitureDTO> livingImageList(int start, int end, String searchValue) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.livingimageList", params);
		
		return Lists;
	}
	
	//거실 이미지 인서트
	public void insertlivingData(FurnitureDTO dto) {
		sessionTemplate.insert("livingMapper.insertData", dto);
	}
	
	//한 개의 데이터
	//getReadData
	public FurnitureDTO getReadData(int imageIndex, String cateEn) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cateEn", cateEn);
		
		
		FurnitureDTO dto = sessionTemplate.selectOne("livingMapper.getReadData",params);
		
		System.out.println(dto.getImageIndex());
		System.out.println(dto.getSaveFileName());
		
		return dto;
	}
	
	

}
