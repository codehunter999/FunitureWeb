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
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.CateimageList",livingMap);
		
		return Lists;
	}
	
	//침실 전체 리스트
	public List<FurnitureDTO> livingImageList() {
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.livingimageList");
		
		return Lists;
	}
	
	//침실 이미지 인서트
	public void insertlivingData(FurnitureDTO dto) {
		sessionTemplate.insert("livingMapper.insertData", dto);
	}
	
	public FurnitureDTO getReadData(int imageIndex, String cateEn) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);

		params.put("cateEn", cateEn);

		
		
		FurnitureDTO dto = sessionTemplate.selectOne("livingMapper.getReadData",params);
		
		/*
		 * System.out.println(dto.getImageIndex());
		 * System.out.println(dto.getSaveFileName());
		 */
		return dto;
	}
	
	

}
