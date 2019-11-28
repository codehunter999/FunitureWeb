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
	public List<FurnitureDTO> cateEImageList(HashMap<String,Object> bedMap) {
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("bedMapper.CateimageList",bedMap);
		
		return Lists;
	}
	
	//침실 전체 리스트
	public List<FurnitureDTO> bedImageList() {
		
		List<FurnitureDTO> bLists = sessionTemplate.selectList("bedMapper.bedimageList");
		
		return bLists;
	}
	
	//침실 이미지 인서트
	public void insertBedData(FurnitureDTO dto) {
		sessionTemplate.insert("bedMapper.insertData", dto);
	}
	
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
